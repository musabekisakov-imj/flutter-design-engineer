# Flutter Product Studio Mobile Showcase Design

Date: 2026-07-22  
Status: Approved for implementation

## Purpose

Replace the current barbershop screenshots in the public skill website with a cohesive mobile product that demonstrates what Flutter Design Engineer actually helps a team do. The new showcase must read as one realistic cross-platform application, not as unrelated concept screens or a generic dashboard.

The product concept is **Flutter Product Studio**: an AI-assisted workspace that guides a Flutter team from audit findings through design-system work, adaptive verification, visual QA, and release readiness.

## Approved Direction

The approved visual system is **Adaptive Hybrid**.

It combines a light neutral workspace with dark high-information surfaces, one blue interaction/AI accent, and one lime success/recommendation accent. It should feel premium and product-led while remaining plausible on both iOS and Android.

The visual direction may use Dribbble-level composition and polish as inspiration, but must avoid common concept-only patterns:

- no glassmorphism;
- no decorative gradients;
- no tiny presentation-only text;
- no disconnected floating cards;
- no inconsistent navigation or component styling between screens;
- no UI that cannot be implemented and verified in Flutter.

## User Story

A product team opens a project, sees its current release readiness, follows prioritized AI audit recommendations, validates the shared design system, checks responsive behavior, reviews screenshot differences, and completes a final quality gate.

The six screenshots form this sequence:

1. Workspace
2. AI Audit
3. Design System
4. Adaptive Preview
5. Visual QA
6. Release

## Screen Specifications

### 1. Workspace

The entry screen answers: “What needs attention now?”

It includes the Aurora project context, an 86% release-readiness score, a short progress explanation, one high-value next action, adaptive verification status, and persistent product navigation. It establishes the design language without trying to summarize every feature.

### 2. AI Audit

This screen turns analysis into prioritized action. It includes one prominent AI recommendation, its expected readiness impact, and three findings with severity and location. Findings use clear product language and remain scannable at mobile size.

### 3. Design System

This screen demonstrates a shared semantic foundation. It includes the core semantic palette, synchronized component count, and examples of a primary button, recommendation card, and list item. The UI must communicate reusable tokens rather than a decorative mood board.

### 4. Adaptive Preview

This screen demonstrates that responsive behavior is intentional. It compares compact phone and wider tablet layouts and reports three verified conditions: navigation preservation, logical content order, and safe 200% text scaling.

### 5. Visual QA

This screen provides screenshot evidence. It compares baseline and current renders, highlights a detected difference, explains the related spacing-token change, and shows review status. The visual difference must be legible without relying on color alone.

### 6. Release

The final screen closes the workflow. It includes a 92 readiness score, an explicit “Excellent readiness” interpretation, accessibility and visual-QA results, and a single action to generate the release report. Completion must feel earned by the evidence shown in the preceding screens.

## Design System

### Color roles

- Paper: `#F6F6F3` — primary canvas.
- Surface: `#FFFFFF` — standard cards and grouped content.
- Ink: `#121921` — text, dark surfaces, and navigation.
- AI blue: `#6D8CFF` — selection, AI-related interaction, and primary action.
- Signal lime: `#D9FF67` — recommendations, completion, and verified state.
- Critical coral: `#FF715F` — errors and high-severity differences.
- Divider: `#DFE2E6` — boundaries on light surfaces.
- Muted text: `#747C86` — supporting copy that still meets contrast requirements.

Blue and lime must not be used as interchangeable decoration. Coral must appear only when attention or failure is meaningful.

### Typography

- Use the website’s existing high-quality sans-serif stack unless the current implementation already bundles an appropriate variable face.
- Display headings use compact leading and controlled negative tracking.
- Product content must remain readable in the final screenshots; no primary copy may be rendered below the visual equivalent of 12 logical pixels.
- Metadata may be smaller only when it remains readable in the published page’s intended display size.
- Screens must tolerate 200% text scaling without clipping or hiding actions.

### Spacing and shape

- Base spacing grid: 8 logical pixels.
- Screen horizontal padding: 16 logical pixels on compact mobile.
- Primary surface radius: 18 logical pixels.
- Compact control radius: 12–14 logical pixels.
- Navigation radius: 16–18 logical pixels.
- Avoid excessive nested rounded rectangles. Every surface must represent grouping, interaction, or state.

### Navigation

The same bottom navigation shell appears throughout the six screens. The active destination changes consistently with the current task. Labels and icons must remain stable; navigation cannot be reinvented per screen.

The Release screen may show completion inside the home/workspace destination rather than adding a one-off fifth tab.

## Component Boundaries

Implementation should keep the showcase maintainable through focused units:

- semantic design tokens and theme extensions;
- adaptive app scaffold and persistent navigation;
- project header;
- readiness card and progress visualization;
- recommendation card;
- audit finding row with severity semantics;
- token palette and component preview;
- device preview frame;
- visual-diff comparison;
- verification/result row;
- release score and final action.

Screen files compose these units and supply fixture data. Components must not own fixture data or embed screen-specific navigation decisions.

## Data and State

The showcase uses deterministic local fixture data so golden output remains reproducible. No network dependency is required.

The fixture represents one project named Aurora and one release named 1.8. Navigation state selects the corresponding screen. Audit, verification, and release results are derived from fixed domain models rather than handwritten strings scattered through widgets.

Required states:

- normal workspace;
- audit finding severities;
- adaptive verification success;
- visual difference requiring review;
- accepted visual difference;
- release-ready success;
- loading, empty, and failure states for at least the shared result surfaces.

The public showcase may focus on the six approved success-path screenshots, but the Flutter implementation and tests must cover the supporting states.

## Adaptive Behavior

The primary golden target is a compact phone viewport representative of 390 logical pixels in width. A tablet or expanded golden must also prove that the app recomposes rather than merely stretches.

- Compact: single-column content, bottom navigation, full-width primary cards.
- Medium: increased gutters and selective two-column grouping.
- Expanded: persistent side navigation is allowed when it follows the same information architecture.

Safe areas, keyboard insets, long localization strings, RTL ordering, and 200% text scale must be handled without clipped content.

## Motion and Interaction

Motion supports orientation and state change only:

- short content transition between destinations;
- progress and score animation on first reveal;
- restrained press feedback;
- visual-diff highlight reveal;
- reduced-motion mode that removes nonessential movement.

No ambient looping animation, parallax, or decorative particle effects are permitted.

## Accessibility

- Meet WCAG AA contrast for text and essential controls.
- Do not encode severity, success, or selected state by color alone.
- Interactive targets must be at least 48 by 48 logical pixels where platform conventions allow.
- Provide meaningful semantic labels for scores, progress, severity, preview devices, and screenshot differences.
- Preserve logical focus and reading order at every breakpoint.
- Verify text scaling at 200% and RTL layout.

## Website Integration

The current cinematic site structure stays intact. Replace the barbershop-specific mobile artwork and copy with the Product Studio workflow.

The website presentation should:

- show the screens large enough to inspect;
- preserve correct phone proportions;
- avoid cropping key UI;
- use a controlled stagger rather than inconsistent arbitrary sizing;
- explain that screenshots are deterministic Flutter renders;
- connect each screen to the corresponding skill or quality gate;
- retain the existing technical-proof and installation sections.

The website must not claim platform support, accessibility verification, or screenshot fidelity until the related checks pass.

## Verification

Implementation is complete only after all of the following pass:

- Flutter analyzer and existing repository validation;
- unit/widget tests for shared components and state mapping;
- compact phone goldens for all six approved screens;
- at least one expanded/tablet golden;
- golden coverage for a loading, empty, failure, and visual-diff state;
- screenshot inspection at the website’s desktop, tablet, and mobile breakpoints;
- 200% text-scale and RTL checks;
- keyboard-only website navigation and visible focus checks;
- browser console free of errors.

## Acceptance Criteria

- A visitor understands within one viewport that the repository provides a full Flutter product-design workflow.
- All six screens look like one application built from one design system.
- Each screen has one clear purpose and advances the same project story.
- Mobile text remains readable when screenshots are embedded on the public site.
- Screens avoid generic dashboard filler and use plausible product content.
- Goldens are deterministic and generated from the repository’s Flutter example.
- Website copy distinguishes proven behavior from illustrative content.
- Existing installation, registry, and technical-evidence functionality remains intact.

## Out of Scope

- Backend services or live AI inference.
- User authentication, billing, or multi-project persistence.
- A general-purpose design editor.
- Native platform-specific forks of the visual language.
- Rebuilding unrelated sections of the public website.
