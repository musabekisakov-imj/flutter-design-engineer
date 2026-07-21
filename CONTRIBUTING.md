# Contributing

Thank you for improving Flutter Design Engineer.

1. Open an issue for substantial workflow or compatibility changes.
2. Keep `SKILL.md` files concise and move detailed knowledge into a directly linked reference.
3. Use imperative instructions and preserve the distinction between diagnosis and authorized implementation.
4. Add or update an eval when behavior changes.
5. Run `python3 scripts/validate_repository.py` and `python3 -m unittest discover -s tests -v`.
6. For demo changes, run `flutter analyze`, `flutter test --exclude-tags golden`, and local golden tests from `examples/connected-command-center/demo`; inspect every changed golden.
7. Keep commits focused and explain the user-facing behavior changed.

Do not add aesthetic rules that pretend one style fits every product. New guidance must explain the product or usability reason behind it.
