#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SKILL_NAME = re.compile(r"^[a-z0-9]+(?:-[a-z0-9]+)*$")
LINK = re.compile(r"\[[^]]+\]\(([^)]+)\)")
PLACEHOLDER = re.compile(r"\b(?:TBD|FIXME|XXX)\b|\[TODO\]", re.IGNORECASE)


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


def validate(root: Path = ROOT) -> list[str]:
    errors: list[str] = []
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

    required = [
        "README.md", "LICENSE", "CONTRIBUTING.md", "CODE_OF_CONDUCT.md",
        "SECURITY.md", "AGENTS.md", "references", "assets/starter", "evals",
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

