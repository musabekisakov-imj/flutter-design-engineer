# Connected Command Center Showcase Design

## Goal

Replace the barbershop-specific booking showcase with a universal Flutter product that demonstrates the repository's seven skills as one connected workflow. The new example must be credible as a real application, visually distinctive, adaptive across compact and expanded layouts, and free of claims that the skills generated the demo automatically.

## Product Concept

The showcase is an AI-assisted personal command center with three connected domains:

- **Workspace:** projects, tasks, release progress, and AI-generated action briefs;
- **Finance:** cash-flow summary, budgets, and recent activity;
- **Travel:** upcoming trip, itinerary progress, and contextual actions.

AI is the connective layer rather than a separate chatbot screen. It summarizes changes across the three domains and exposes a command action from the shared shell. All content is deterministic fixture data and requires no backend, account, or network connection.

## Experience Architecture

The expanded composition uses a navigation rail and a responsive dashboard grid. Project progress is the primary region, while finance, travel, and the AI brief form secondary regions. The compact composition preserves the same information hierarchy as a scrollable card feed with bottom navigation and a prominent AI command action.

The showcase includes four deterministic UI states:

1. populated command center;
2. loading skeletons with stable geometry;
3. recoverable error with a retry action;
4. empty activity state with a clear next step.

Compact and expanded layouts share models, semantic tokens, components, and state. Layout differences are constraint-driven; they do not fork into unrelated applications.

## Visual Direction

Use a high-contrast editorial command-center aesthetic:

- deep ink foundation;
- warm paper surfaces;
- coral primary action accent;
- restrained amber, blue, and green accents for domain distinction;
- strong type hierarchy and asymmetric but orderly grid composition;
- flat or lightly elevated surfaces without excessive nested cards, gradients, or ornamental glass effects.

The main README hero is a purpose-built composite showing the compact and expanded rendered application together. It must contain no barbershop, haircut, barber, appointment, or booking imagery or copy.

## Seven-Skill Story

The example documents how every repository skill contributes to the same result:

1. `flutter-audit` identifies hierarchy, density, state, and adaptation risks;
2. `flutter-design` establishes the product narrative and visual direction;
3. `flutter-design-system` defines semantic tokens and reusable primitives;
4. `flutter-implementation` builds constraint-driven compact and expanded layouts;
5. `flutter-accessibility` adds semantics, focus order, text scaling, contrast, and reduced-motion behavior;
6. `flutter-motion` specifies purposeful transitions and state feedback;
7. `flutter-visual-qa` verifies compact and expanded goldens and state coverage.

The README presents this as an auditable workflow, not a claim of automatic generation.

## Code Organization

Replace `examples/booking-redesign` with `examples/connected-command-center` while keeping the demo isolated from the skill packages.

- `demo/lib/main.dart`: application shell and showcase controls;
- `demo/lib/theme.dart`: semantic tokens and theme construction;
- `demo/lib/command_center_models.dart`: immutable deterministic fixtures;
- `demo/lib/command_center_screen.dart`: adaptive page composition;
- `demo/lib/components/`: focused workspace, finance, travel, AI brief, navigation, and state components;
- `demo/test/command_center_smoke_test.dart`: behavior, semantics, and state checks;
- `demo/test/command_center_golden_test.dart`: deterministic compact and expanded rendering;
- `demo/goldens/`: committed evidence used by the README.

Components receive models and callbacks rather than reading global state. A small local showcase controller selects the visible fixture state. No production state-management dependency is added.

## Interaction and Motion

Primary interactions are navigation selection, project action completion, finance detail expansion, travel itinerary continuation, retry, and the AI command affordance. Keyboard traversal must follow reading order and all controls need meaningful semantic labels.

Motion is limited to navigation/content transitions, progress changes, and state replacement. Reduced-motion mode removes spatial movement and preserves short opacity feedback. Golden tests capture settled states only.

## README and Repository Migration

Update the README hero, captions, paths, quick-start commands, architecture narrative, and example links. Replace the existing booking art-direction asset and booking goldens with command-center media. Update launch copy, release documentation, eval examples, and repository references wherever barbershop-specific material implies that booking is the canonical showcase.

Historical Git tags and the published `v0.1.0` release remain unchanged. The migration ships as the next release rather than rewriting release history.

## Verification

The change is complete only when:

1. repository validation and Python tests pass;
2. `flutter analyze` passes in the new demo;
3. Flutter smoke, accessibility, and golden tests pass;
4. compact and expanded goldens are visually inspected;
5. repository search finds no live README/demo references to the removed booking example, except immutable historical release notes where appropriate;
6. CI passes on the publication branch;
7. the new README image renders correctly on GitHub.

## Publication Follow-Up

After the showcase release is public, prepare platform-specific launch posts for Flutter Community Slack, Flutter Dev Discord, Reddit, Threads/X, LinkedIn, DEV Community, Medium, Hacker News, and Product Hunt. Publish only where the maintainer is authenticated and after confirming each external post at action time. Posts must request feedback and contributors, avoid invented traction, and link to the new showcase and release.
