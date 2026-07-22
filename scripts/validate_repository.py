#!/usr/bin/env python3
from __future__ import annotations

import json
import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SKILL_NAME = re.compile(r"^[a-z0-9]+(?:-[a-z0-9]+)*$")
LINK = re.compile(r"\[[^]]+\]\(([^)]+)\)")
PLACEHOLDER = re.compile(r"\b(?:TBD|FIXME|XXX)\b|\[TODO\]", re.IGNORECASE)
BENCHMARK_REQUIRED_FIELDS = (
    "model", "model_version", "run_date", "starter_commit", "host",
    "budget", "retry_policy",
)
SITE_SECTION_ORDER = ("audiences", "workflow", "skills", "evidence", "benchmark", "install")
SITE_EVENTS = {
    "install_copy", "verified_results_open", "benchmark_artifact_open",
    "github_open", "sponsor_open", "audience_path_select", "install_success_help_open",
}
PRODUCT_STUDIO_IMAGES = {
    "phone-workspace.png", "phone-audit.png", "phone-system.png",
    "phone-adaptive.png", "phone-visualQa.png", "phone-release.png",
    "phone-error.png", "tablet-workspace.png",
}


def parse_frontmatter(path: Path) -> dict[str, str]:
    lines = path.read_text(encoding="utf-8").splitlines()
    if not lines or lines[0] != "---":
        raise ValueError("missing opening frontmatter delimiter")
    try:
        end = lines.index("---", 1)
    except ValueError as error:
        raise ValueError("missing closing frontmatter delimiter") from error
    values: dict[str, str] = {}
    for line in lines[1:end]:
        if not line.strip():
            continue
        if ":" not in line:
            raise ValueError(f"invalid frontmatter line: {line}")
        key, value = line.split(":", 1)
        values[key.strip()] = value.strip()
    return values


def validate_benchmark_manifest(path: Path, benchmark_root: Path) -> list[str]:
    errors: list[str] = []
    try:
        manifest = json.loads(path.read_text(encoding="utf-8"))
    except (json.JSONDecodeError, OSError) as error:
        return [f"{path}: invalid benchmark manifest: {error}"]

    if manifest.get("status") not in {"pending", "complete"}:
        errors.append(f"{path}: status must be pending or complete")
    if manifest.get("arm") not in {"baseline", "skill-guided"}:
        errors.append(f"{path}: invalid benchmark arm")
    artifacts = manifest.get("artifacts")
    if not isinstance(artifacts, list):
        errors.append(f"{path}: artifacts must be a list")
        artifacts = []

    if manifest.get("status") == "complete":
        for field in BENCHMARK_REQUIRED_FIELDS:
            if not manifest.get(field):
                errors.append(f"{path}: complete run missing {field}")
        if not artifacts:
            errors.append(f"{path}: complete run requires evidence artifacts")
        for artifact in artifacts:
            if not isinstance(artifact, str) or not (benchmark_root / artifact).exists():
                errors.append(f"{path}: missing benchmark artifact {artifact!r}")
    return errors


def validate_site_contract(root: Path) -> list[str]:
    errors: list[str] = []
    html_path = root / "docs" / "index.html"
    analytics_path = root / "docs" / "assets" / "analytics-adapter.js"
    if not html_path.exists():
        return ["docs/index.html: missing website entry point"]
    html = html_path.read_text(encoding="utf-8")

    positions = [html.find(f'id="{section}"') for section in SITE_SECTION_ORDER]
    if any(position < 0 for position in positions):
        missing = [section for section, position in zip(SITE_SECTION_ORDER, positions) if position < 0]
        errors.append(f"docs/index.html: missing required sections {missing}")
    elif positions != sorted(positions):
        errors.append("docs/index.html: conversion sections are out of approved order")

    image_root = root / "docs" / "assets" / "product-studio"
    for name in PRODUCT_STUDIO_IMAGES:
        if f'assets/product-studio/{name}' not in html:
            errors.append(f"docs/index.html: missing Product Studio evidence {name}")
        if not (image_root / name).exists():
            errors.append(f"docs/assets/product-studio: missing {name}")

    if "No score published" not in html or "Protocol ready" not in html:
        errors.append("docs/index.html: benchmark pending state must forbid implied results")
    for header_contract in ('class="brand-meta"', 'class="nav-install"', 'class="nav-sponsor"', 'data-nav-section="workflow"'):
        if header_contract not in html:
            errors.append(f"docs/index.html: missing premium header contract {header_contract}")
    for audience_outcome in ("Ship production-ready UI", "Standardize quality gates", "Connect intent to evidence", "Add a verifiable Flutter workflow"):
        if audience_outcome not in html:
            errors.append(f"docs/index.html: missing audience outcome {audience_outcome}")
    if "analytics-adapter.js" not in html:
        errors.append("docs/index.html: missing analytics adapter")
    sponsors_url = "https://github.com/sponsors/musabekisakov-imj"
    if sponsors_url not in html or 'data-analytics-event="sponsor_open"' not in html:
        errors.append("docs/index.html: missing official GitHub Sponsors CTA")
    if 'class="nav-sponsor"' not in html or 'data-analytics-placement="header"' not in html:
        errors.append("docs/index.html: missing header Sponsor discovery action")
    funding_path = root / ".github" / "FUNDING.yml"
    if not funding_path.exists() or "github: [musabekisakov-imj]" not in funding_path.read_text(encoding="utf-8"):
        errors.append(".github/FUNDING.yml: missing approved GitHub Sponsors account")
    preview_path = root / "docs" / "assets" / "social-preview.jpg"
    if "assets/social-preview.jpg" not in html or not preview_path.exists():
        errors.append("docs: missing social preview image or Open Graph reference")
    elif preview_path.stat().st_size > 1_000_000:
        errors.append("docs/assets/social-preview.jpg: GitHub social preview must stay below 1 MB")
    if not analytics_path.exists():
        errors.append("docs/assets/analytics-adapter.js: missing analytics adapter")
    else:
        analytics = analytics_path.read_text(encoding="utf-8")
        missing_events = sorted(event for event in SITE_EVENTS if f'"{event}"' not in analytics)
        if missing_events:
            errors.append(f"docs/assets/analytics-adapter.js: missing events {missing_events}")
        if "localStorage" in analytics or "document.cookie" in analytics:
            errors.append("docs/assets/analytics-adapter.js: persistent client storage is not allowed")
    return errors


def validate(root: Path = ROOT) -> list[str]:
    errors: list[str] = []
    errors.extend(validate_site_contract(root))
    descriptions: dict[str, str] = {}
    skill_dirs = sorted((root / "skills").glob("*"))
    if not skill_dirs:
        errors.append("skills: no skill directories found")

    for skill_dir in skill_dirs:
        if not skill_dir.is_dir():
            continue
        skill_file = skill_dir / "SKILL.md"
        metadata_file = skill_dir / "agents" / "openai.yaml"
        if not skill_file.exists():
            errors.append(f"{skill_dir.name}: missing SKILL.md")
            continue
        try:
            metadata = parse_frontmatter(skill_file)
        except ValueError as error:
            errors.append(f"{skill_file.relative_to(root)}: {error}")
            continue
        if set(metadata) != {"name", "description"}:
            errors.append(f"{skill_dir.name}: frontmatter must contain only name and description")
        name = metadata.get("name", "")
        description = metadata.get("description", "")
        if name != skill_dir.name or not SKILL_NAME.fullmatch(name):
            errors.append(f"{skill_dir.name}: invalid or mismatched name {name!r}")
        if len(description) < 80:
            errors.append(f"{skill_dir.name}: description is not trigger-specific enough")
        if description in descriptions:
            errors.append(f"{skill_dir.name}: duplicate description with {descriptions[description]}")
        descriptions[description] = skill_dir.name
        if not metadata_file.exists():
            errors.append(f"{skill_dir.name}: missing agents/openai.yaml")
        elif f"${name}" not in metadata_file.read_text(encoding="utf-8"):
            errors.append(f"{skill_dir.name}: default prompt must mention ${name}")

    markdown_files = list(root.rglob("*.md"))
    for path in markdown_files:
        text = path.read_text(encoding="utf-8")
        if PLACEHOLDER.search(text):
            errors.append(f"{path.relative_to(root)}: contains placeholder marker")
        for target in LINK.findall(text):
            if target.startswith(("http://", "https://", "mailto:", "#")):
                continue
            clean_target = target.split("#", 1)[0]
            if clean_target and not (path.parent / clean_target).resolve().exists():
                errors.append(f"{path.relative_to(root)}: broken link {target}")

    benchmark_root = root / "benchmarks" / "connected-command-center"
    manifests = [
        benchmark_root / "baseline" / "manifest.json",
        benchmark_root / "skill-guided" / "manifest.json",
    ]
    for manifest in manifests:
        if not manifest.exists():
            errors.append(f"missing benchmark manifest: {manifest.relative_to(root)}")
        else:
            errors.extend(validate_benchmark_manifest(manifest, benchmark_root))

    if all(manifest.exists() for manifest in manifests):
        try:
            statuses = [
                json.loads(manifest.read_text(encoding="utf-8")).get("status")
                for manifest in manifests
            ]
        except json.JSONDecodeError:
            statuses = []
        if "complete" in statuses and "pending" in statuses:
            errors.append("benchmark pair cannot publish only one complete arm")

    required = [
        "README.md", "LICENSE", "CONTRIBUTING.md", "CODE_OF_CONDUCT.md",
        "SECURITY.md", "AGENTS.md", "references", "assets/starter", "evals",
        "benchmarks/connected-command-center",
    ]
    for relative in required:
        if not (root / relative).exists():
            errors.append(f"missing required path: {relative}")
    return errors


def main() -> int:
    errors = validate()
    if errors:
        print("Validation failed:")
        for error in errors:
            print(f"- {error}")
        return 1
    print("Validation passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
