#!/usr/bin/env python3
from __future__ import annotations

import argparse
import shutil
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def install(destination: Path, selected: list[str], force: bool = False) -> list[Path]:
    source_root = ROOT / "skills"
    available = {path.name: path for path in source_root.iterdir() if path.is_dir()}
    names = selected or sorted(available)
    unknown = sorted(set(names) - set(available))
    if unknown:
        raise ValueError(f"unknown skills: {', '.join(unknown)}")

    destination.mkdir(parents=True, exist_ok=True)
    installed: list[Path] = []
    for name in names:
        target = destination / name
        if target.exists():
            if not force:
                raise FileExistsError(f"refusing to overwrite {target}; pass --force")
            if target.is_dir():
                shutil.rmtree(target)
            else:
                target.unlink()
        shutil.copytree(available[name], target)
        installed.append(target)
    return installed


def main() -> int:
    parser = argparse.ArgumentParser(description="Install Flutter Design Engineer skills.")
    parser.add_argument("--destination", required=True, type=Path)
    parser.add_argument("--skill", action="append", default=[])
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()
    try:
        installed = install(args.destination.expanduser(), args.skill, args.force)
    except (ValueError, FileExistsError) as error:
        parser.error(str(error))
    for path in installed:
        print(f"Installed {path.name} -> {path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

