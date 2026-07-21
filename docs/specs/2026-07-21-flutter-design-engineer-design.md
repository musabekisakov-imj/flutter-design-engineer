# Flutter Design Engineer — Design Specification

## Objective

Create a new open-source repository that gives coding agents a rigorous, repeatable workflow for designing, implementing, and visually validating high-quality Flutter interfaces. The repository must work as an agent skill collection rather than a monolithic prompt, remain portable across Claude Code, Codex, and compatible skill-aware agents, and produce evidence-backed improvements through examples and evaluations.

The first release targets both redesigning existing Flutter applications and creating new screens inside established applications. It does not introduce a proprietary Flutter widget framework or require a particular state-management library.

## Product Positioning

`flutter-design-engineer` is a design-engineering workflow for Flutter. It prevents an agent from jumping directly from a vague brief to widget code. The agent must first inspect the product and codebase, define a coherent visual direction, model all relevant states, establish or extend design tokens, implement adaptive and accessible widgets, and verify the rendered result.

The repository differentiates itself from prompt collections and UI kits through four properties:

1. Progressive disclosure: the agent loads only the specialist guidance required for the current task.
2. Enforced gates: implementation cannot begin before product context, visual direction, and state coverage are explicit.
3. Rendered verification: screenshots and golden tests are treated as evidence, not optional polish.
4. Evaluability: realistic prompts, rubrics, and fixtures make regressions in skill behavior visible.

## Supported Tasks

The initial release supports:

- auditing an existing Flutter interface;
- redesigning an existing screen or flow;
- designing and implementing a new screen in an existing project;
- creating or extending a Flutter design system;
- building adaptive phone, tablet, foldable, desktop, and web layouts;
- designing light and dark themes;
- covering loading, empty, error, offline, disabled, destructive, and success states;
- applying accessibility and localization requirements, including RTL;
- adding purposeful motion and interaction feedback;
- capturing screenshots and performing a structured visual QA pass;
- creating golden tests for stable visual behavior.

Greenfield application architecture, backend generation, product branding, and a full component library are outside the first-release scope unless required by a concrete example fixture.

## Repository Architecture

```text
flutter-design-engineer/
├── README.md
├── LICENSE
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
├── AGENTS.md
├── skills/
│   ├── flutter-design/
│   │   ├── SKILL.md
│   │   └── agents/openai.yaml
│   ├── flutter-audit/
│   │   ├── SKILL.md
│   │   └── agents/openai.yaml
│   ├── flutter-design-system/
│   │   ├── SKILL.md
│   │   └── agents/openai.yaml
│   ├── flutter-implementation/
│   │   ├── SKILL.md
│   │   └── agents/openai.yaml
│   ├── flutter-motion/
│   │   ├── SKILL.md
│   │   └── agents/openai.yaml
│   ├── flutter-accessibility/
│   │   ├── SKILL.md
│   │   └── agents/openai.yaml
│   └── flutter-visual-qa/
│       ├── SKILL.md
│       └── agents/openai.yaml
├── references/
│   ├── visual-direction.md
│   ├── anti-slop.md
│   ├── typography-and-color.md
│   ├── layout-and-density.md
│   ├── adaptive-layouts.md
│   ├── navigation-and-input.md
│   ├── states-and-feedback.md
│   ├── accessibility-and-localization.md
│   ├── motion.md
│   ├── flutter-architecture.md
│   └── visual-qa.md
├── assets/
│   └── starter/
│       ├── design_tokens.dart
│       ├── app_theme.dart
│       └── adaptive_scaffold.dart
├── scripts/
│   ├── validate_repository.py
│   └── install.py
├── evals/
│   ├── README.md
│   ├── cases/
│   └── rubrics/
└── examples/
    └── booking-redesign/
```

Top-level project documentation exists for human contributors. Skill folders themselves remain minimal and contain only agent-facing instructions, UI metadata, and directly required resources.

## Skill Responsibilities

### `flutter-design`

Act as the public entry point and router. Inspect the request and repository, establish product context, select the required specialist workflows, and enforce the sequence of work. Require explicit visual direction and state coverage before implementation. Avoid duplicating detailed guidance from references or specialist skills.

### `flutter-audit`

Inspect existing screens, screenshots, themes, components, navigation, accessibility, and responsive behavior. Produce prioritized findings with concrete evidence and distinguish functional defects from visual refinement opportunities. Do not edit code unless the user requests implementation.

### `flutter-design-system`

Define or extend semantic color, typography, spacing, radius, elevation, motion, and component tokens. Prefer semantic roles over raw values. Integrate with existing conventions rather than replacing a mature project theme unnecessarily.

### `flutter-implementation`

Translate an approved direction into production Flutter code. Follow the project's architecture and state-management conventions, use composable widgets, preserve behavior, handle adaptive constraints, and run proportionate static analysis and tests.

### `flutter-motion`

Choose motion only when it communicates hierarchy, causality, continuity, or feedback. Specify reduced-motion behavior, interruption handling, durations, curves, and performance constraints. Reject decorative motion that impairs usability.

### `flutter-accessibility`

Verify semantics, focus order, keyboard navigation, text scaling, touch targets, contrast, reduced motion, screen-reader labels, RTL behavior, and localization-safe layouts. Accessibility findings block completion when they prevent core use.

### `flutter-visual-qa`

Capture or inspect rendered output across representative viewport sizes and themes. Compare implementation against the approved direction, identify visual regressions, and require a refinement pass. Use golden tests when stable rendering is practical.

## Core Workflow

1. Inspect the request, repository structure, Flutter and Dart versions, dependencies, theme, navigation, and state-management conventions.
2. Determine whether the task is an audit, redesign, new screen, design-system task, motion task, or visual QA task.
3. Establish product purpose, primary user, critical action, content hierarchy, constraints, and success criteria.
4. For visual work, select one explicit visual direction and describe its typography, density, color behavior, geometry, imagery, and motion character.
5. Enumerate interaction and data states before implementation.
6. Reuse or define semantic tokens and component contracts.
7. Implement in small, isolated widgets that follow the host project's conventions.
8. Run `dart format`, static analysis, and relevant tests.
9. Render representative phone and large-screen states in light and dark modes when supported.
10. Perform visual, adaptive, accessibility, and interaction QA.
11. Refine material issues and report verified results, remaining limitations, and affected files.

## Design Guardrails

The skills must reject generic AI-interface patterns when they do not serve the product:

- excessive rounded cards and nested surfaces;
- arbitrary gradients, glass effects, and glow;
- oversized hero text in operational mobile interfaces;
- icon-only controls without clear semantics;
- decorative charts or metrics without user value;
- indiscriminate use of `Container` and hard-coded dimensions;
- desktop layouts implemented as stretched phone screens;
- placeholder copy treated as final information architecture;
- missing loading, empty, error, and disabled states;
- animations without a communication purpose;
- visual changes that silently alter business behavior.

Guardrails remain heuristics, not a fixed aesthetic. The skill must support restrained editorial, expressive consumer, dense operational, Material, Cupertino, and custom visual languages when justified by product context.

## Compatibility

Each skill uses portable Markdown instructions and standard YAML frontmatter with only `name` and `description`. Codex-facing metadata lives under `agents/openai.yaml`. The README documents installation patterns for Claude Code, Codex, and manual skill-aware environments without claiming identical capabilities where hosts differ.

The implementation must not require a particular operating system for the core skills. Optional scripts use Python's standard library. Flutter-specific verification commands are discovered from the target project rather than hard-coded globally.

## Error Handling

- If no Flutter project is present, stop implementation and report the missing prerequisite.
- If visual evidence cannot be captured, complete code-level checks and explicitly mark visual verification as unperformed.
- If the existing design system conflicts with the requested direction, present the conflict before replacing tokens or primitives.
- If a requested effect harms accessibility or performance, provide a safer equivalent and explain the trade-off.
- If tests or analysis fail for unrelated pre-existing reasons, isolate and report them without masking failures introduced by the task.
- If required assets are missing, use structurally honest placeholders only when the user permits them.

## Evaluation Strategy

The repository includes deterministic structural validation and behavior-oriented eval cases.

Structural validation checks:

- required frontmatter and valid skill names;
- existence and consistency of `agents/openai.yaml`;
- valid internal links;
- referenced files exist;
- no placeholder markers remain;
- every specialist skill has a distinct trigger description;
- scripts run with the Python standard library.

Behavior evals cover:

1. Audit an existing low-quality booking screen without making unauthorized edits.
2. Redesign a booking flow while preserving validation and backend contracts.
3. Create an adaptive tablet layout rather than stretching the phone UI.
4. Identify accessibility failures at 200% text scale and with screen readers.
5. Add motion with reduced-motion behavior and interruption safety.
6. Refuse premature implementation when product context and visual direction are missing.
7. Perform screenshot-based critique and prioritize material issues over subjective polish.

Each eval rubric scores process adherence, product reasoning, Flutter correctness, adaptive behavior, accessibility, visual specificity, verification quality, and scope discipline.

## Example Fixture

The first example is a compact booking flow because it exercises dates, availability, staff selection, service duration, forms, loading states, errors, and confirmation. The fixture demonstrates a before state, design rationale, tokens, responsive decisions, implementation, tests, and rendered after states. It remains small enough to understand without becoming a showcase application unrelated to the skills.

## Release Standard

Version 0.1 is complete when:

- all seven skills contain valid, concise instructions and metadata;
- references cover the non-obvious design-engineering guidance used by those skills;
- starter assets compile in a documented Flutter fixture;
- validation scripts pass;
- the booking eval and at least four additional behavior evals are documented;
- installation is documented for supported hosts;
- repository governance and security files are present;
- no placeholder content remains;
- a fresh agent can follow the entry skill without prior conversation context.

## Future Work

Later releases may add Figma translation workflows, automated screenshot capture adapters, a Dart CLI, additional example domains, and community-contributed visual-direction packs. These are deliberately excluded from version 0.1 to keep the first release coherent and testable.
