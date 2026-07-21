# Launch Demo and OSS Growth Design

## Goal

Turn the technically complete repository into a credible, demonstrable open-source project with a real Flutter example, reproducible screenshots, contributor entry points, release artifacts, and honest application/launch material.

## Visual Demo

Build a self-contained Flutter web/mobile example under `examples/booking-redesign/demo`. The demo presents the same booking task in two modes:

- **Before:** a plausible generic AI-generated screen with weak hierarchy, nested cards, scattered styling, incomplete state communication, and phone-only composition.
- **After:** a calm cross-platform premium booking flow with editorial hierarchy, warm neutral surfaces, a deep ink primary color, a coral confirmation accent, semantic tokens, explicit availability states, accessible controls, and a purposeful responsive list-detail composition.

The demo must not claim that the skill automatically generated the result. It demonstrates the quality standard and workflow encoded by the skills.

Three reproducible screenshots will be generated from widget tests:

1. compact before;
2. compact after;
3. expanded after.

The screenshots will be displayed prominently in the README with an honest caption and direct links to the demo source.

## Demo Architecture

Keep the example isolated from the skill package:

- `lib/main.dart`: application shell and mode switching;
- `lib/theme.dart`: semantic theme and design tokens;
- `lib/booking_models.dart`: deterministic fixture data;
- `lib/booking_screen.dart`: responsive before/after compositions;
- `test/booking_golden_test.dart`: deterministic screenshot generation;
- `goldens/`: committed output used in README.

The demo has no network dependency or backend. It must support light theme, compact and expanded constraints, keyboard-accessible controls, meaningful semantics, text scaling, and deterministic data.

## Repository Launch Layer

Add:

- a stronger README hero, quick install, screenshot evidence, architecture diagram, supported workflows, and honest project status;
- `ROADMAP.md` with scoped contribution tracks;
- issue and pull-request templates;
- label definitions documented for maintainers;
- a release workflow and release notes for `v0.1.0`;
- contribution instructions tied to evals and validation;
- a launch kit containing truthful copy for Reddit, Threads/X, LinkedIn, Flutter communities, and the Anthropic application.

## Community Work

Create genuine GitHub issues whose work is not already implemented. Initial issues cover Cupertino guidance, RTL eval fixtures, foldable layouts, visual regression adapters, Bloc/Riverpod examples, Windows/macOS keyboard navigation, reduced-motion fixtures, installer portability, and contributor documentation.

Enable Discussions. Do not create fake contributors, reactions, stars, installs, download counts, or testimonials.

## Release and Verification

Before release:

1. Run repository validation and Python tests.
2. Run `flutter analyze` and Flutter tests in the demo.
3. Generate and inspect all committed screenshots.
4. Check Markdown links and staged scope.
5. Push the feature branch and merge through a pull request or fast-forward only after CI succeeds.
6. Tag and publish `v0.1.0` with factual release notes.

## Anthropic Application

Prepare a factual application draft and a machine-readable evidence checklist. Do not claim a formal eligibility threshold that the project has not met. Apply through the exception route only after the public release and demo exist. State that the project is new, explain the underserved Flutter-specific agent workflow, and link validation, demo, release, and contribution infrastructure.

Submitting the final Anthropic form may require private contact information and account interaction. Use the maintainer's authenticated browser only when available; never invent personal or usage metrics.

