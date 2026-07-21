# Flutter Product Studio Mobile Showcase Implementation Plan

## Goal

Replace the barbershop-led website evidence with six deterministic Flutter Product Studio screens built from one Adaptive Hybrid design system, verify the rendered output, and integrate it into the existing public site without weakening installation or technical-proof content.

## Task 1: Create the Product Studio Flutter fixture

Files:

- `examples/product-studio/demo/pubspec.yaml`
- `examples/product-studio/demo/lib/main.dart`
- `examples/product-studio/demo/lib/product_studio_app.dart`
- `examples/product-studio/demo/lib/models/`
- `examples/product-studio/demo/lib/theme/`
- `examples/product-studio/demo/lib/widgets/`
- `examples/product-studio/demo/lib/screens/`

Work:

- Add deterministic Aurora project and release fixture models.
- Implement the approved semantic tokens and cross-platform Adaptive Hybrid theme.
- Build isolated shared components for navigation, project context, readiness, findings, recommendations, verification, device previews, visual differences, and release results.
- Compose Workspace, AI Audit, Design System, Adaptive Preview, Visual QA, and Release screens.
- Add loading, empty, failure, accepted-diff, and release-ready states without network dependencies.

Verification:

- Run `flutter analyze`.
- Run widget and model tests.
- Inspect text scale, semantics, and RTL behavior.

## Task 2: Add deterministic rendered evidence

Files:

- `examples/product-studio/demo/test/`
- `examples/product-studio/demo/goldens/`

Work:

- Add a reusable golden harness with fixed fonts, locale, viewport, and animation state.
- Capture all six compact phone screens at 390 logical pixels.
- Capture one expanded/tablet composition.
- Capture loading, empty, failure, and visual-diff states where they materially differ.
- Keep image dimensions and names stable for website integration.

Verification:

- Run golden tests twice and confirm no nondeterministic differences.
- Inspect every generated image at original resolution.
- Confirm no overflow, clipped text, unsafe insets, or unreadable metadata.

## Task 3: Replace the public mobile showcase

Files:

- `docs/index.html`
- `docs/assets/install-guide.css`
- `docs/assets/product-studio/`

Work:

- Replace hero barbershop screenshots with Product Studio Workspace and Release goldens.
- Replace the booking evidence rail with the six-screen Product Studio workflow.
- Replace recovery and tablet booking proof with visual-diff/error and adaptive Product Studio evidence.
- Update labels, alternative text, links, and evidence notes to match the fixture exactly.
- Preserve the page’s cinematic structure, skill registry, agent installer, technical proof, and copy interactions.
- Use correct intrinsic image dimensions and ensure screens remain inspectable at every website breakpoint.

Verification:

- Validate semantic headings, links, alt text, and image dimensions.
- Inspect desktop, tablet, and mobile website renders.
- Confirm no horizontal overflow or cropped phone UI.

## Task 4: Align repository documentation

Files:

- `examples/product-studio/README.md`
- `README.md`
- `AGENTS.md`

Work:

- Document how to run, test, and regenerate Product Studio evidence.
- Make Product Studio the primary showcase contract while retaining the barbershop example as an additional fixture.
- Link the approved specification and explain that the screenshots use local deterministic data.

Verification:

- Check all repository-relative links.
- Confirm no unsupported claims about live AI or backend behavior.

## Task 5: Final QA and publication

Work:

- Run repository validation, Python tests, Flutter analysis/tests, golden tests, and `git diff --check`.
- Serve the docs site locally and inspect 1440, 1024, 768, and 390 pixel layouts.
- Test keyboard navigation, reduced motion, visible focus, and browser console output.
- Commit implementation only after rendered QA passes.
- Push the verified main branch so GitHub Pages rebuilds from the tested commit.

Verification:

- `python3 scripts/validate_repository.py`
- `python3 -m unittest discover -s tests`
- `flutter analyze`
- `flutter test`
- `git diff --check`
- browser console contains no errors
- GitHub Pages completes successfully on the published commit
