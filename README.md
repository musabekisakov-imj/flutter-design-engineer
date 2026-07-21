# Flutter Design Engineer

An open-source agent skill system for product-aware, adaptive, accessible, and visually verified Flutter UI work.

Most AI UI workflows jump from a vague brief to widget code. Flutter Design Engineer enforces a better loop:

```text
inspect → understand → direct → model states → implement → render → critique → refine
```

## Skills

| Skill | Purpose |
| --- | --- |
| `flutter-design` | Route and gate complete design workflows |
| `flutter-audit` | Diagnose existing Flutter UI without unauthorized edits |
| `flutter-design-system` | Build semantic tokens, themes, and component contracts |
| `flutter-implementation` | Implement approved adaptive Flutter interfaces |
| `flutter-motion` | Add purposeful, interruptible, accessible motion |
| `flutter-accessibility` | Harden semantics, focus, text scaling, RTL, and localization |
| `flutter-visual-qa` | Verify rendered states, breakpoints, themes, and goldens |

## Install

Install all skills into a chosen directory:

```bash
python3 scripts/install.py --destination ~/.codex/skills
```

Install selected skills:

```bash
python3 scripts/install.py \
  --destination ~/.claude/skills \
  --skill flutter-design \
  --skill flutter-visual-qa
```

The installer refuses to overwrite existing skills unless `--force` is provided. You can also copy folders from `skills/` manually into the skill directory supported by your agent host. Host capabilities differ: screenshot capture, UI tools, and automatic skill discovery depend on the environment.

## Use

Start with the router for broad work:

```text
Use $flutter-design to redesign this booking flow without changing its backend behavior.
```

Invoke specialists directly for narrow tasks:

```text
Use $flutter-audit to review these Flutter screens. Do not edit code.
Use $flutter-accessibility to test this checkout flow at enlarged text sizes and RTL.
Use $flutter-visual-qa to compare compact, tablet, light, and dark states.
```

## Validate

```bash
python3 scripts/validate_repository.py
python3 -m unittest discover -s tests -v
```

Run the official Codex validator against any skill when it is available:

```bash
python3 /path/to/skill-creator/scripts/quick_validate.py skills/flutter-design
```

## Design Principles

- Product intent precedes aesthetics.
- Visual direction precedes implementation.
- Every relevant state is designed.
- Constraints drive adaptive composition.
- Accessibility is part of correctness.
- Rendered evidence precedes claims of polish.
- Distinctiveness comes from coherent decisions, not decorative noise.
- Existing architecture and business behavior are preserved by default.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Behavioral changes should add or update an eval case and keep all validation green.

## License

MIT. See [LICENSE](LICENSE).

