# Editorial Barbershop Booking Showcase Design

## Goal

Add a production-like customer booking example that proves the seven Flutter skills can carry one meaningful mobile workflow from product framing through rendered verification. The example must complement, not replace, the connected command center: the command center demonstrates adaptive multi-domain composition, while this case study demonstrates a focused consumer transaction with forms, availability, validation, recovery, and completion.

The fixture lives entirely inside `flutter-design-engineer`. It must not modify or depend on the private DE Legends staff application, its backend, or its assets.

## Product and User

The product is a customer-facing booking experience for an independent premium barbershop. The primary user is a returning or first-time client who wants to reserve a specific service with confidence in under two minutes. The critical action is completing a valid appointment without needing to call the shop.

The experience must answer four questions in order:

1. What service am I booking, how long does it take, and what does it cost?
2. Who will perform it, and why should I choose them?
3. When is a genuinely available time?
4. What exactly will be reserved before I confirm?

Success means that the user can understand progress, revise earlier choices without losing unrelated work, recover from unavailable or failed availability, and reach an unambiguous confirmation.

## Scope

The deterministic fixture contains five connected steps:

1. service selection;
2. barber selection;
3. date and time selection;
4. booking review with customer details;
5. success confirmation.

The example does not implement authentication, payments, map navigation, push notifications, a real network client, or a production backend. It uses immutable local fixtures and a small controller so every tested state is reproducible.

## Experience Architecture

Phone layouts use a single-column journey with a persistent but unobtrusive progress header and a bottom action area that respects safe insets. Tablet layouts use a two-region composition: the active step occupies the primary region and a sticky booking summary occupies the secondary region. The tablet treatment is a genuine recomposition rather than a stretched phone screen.

Users may move backward and revise service, barber, date, or time. A change invalidates only dependent downstream choices. For example, changing the service preserves customer details but clears an incompatible time slot. The review step exposes edit actions for every booking choice.

Navigation is state-driven and local to the fixture. Each step receives typed models and callbacks. The screen must not read global mutable state or rely on route replacement for transient validation.

## Visual Direction: Editorial Craft

The visual language combines the clarity of an editorial service guide with the tactile restraint of a well-run neighborhood barbershop.

- warm ivory canvas instead of pure white;
- near-black charcoal for primary type and controls;
- a single burnished-copper accent for selected and primary states;
- muted stone borders and quiet sage reserved for confirmation;
- expressive serif display type for short headings paired with a highly legible sans-serif for UI copy;
- squared editorial imagery and clipped portrait crops rather than circular avatar rows;
- medium-radius controls and panels, with no glass, glow, arbitrary gradients, or nested-card stacks;
- generous but task-appropriate spacing, compact enough to keep choices and the next action in view;
- photography used only to establish the shop or differentiate barbers, never as decorative filler.

The primary hierarchy comes from typography, alignment, whitespace, and selection treatment. Not every content group becomes a card. Price, duration, expertise, and availability remain scannable without competing badges.

## Screen Contracts

### Service

Show a short shop introduction followed by a concise service list. Every service exposes name, plain-language description, duration, and price. Selection is unmistakable through border, background, and semantic state; it cannot depend on color alone. Continue remains disabled until a service is selected.

### Barber

Present `Any available barber` as a practical first option, followed by individual barbers with portrait, specialties, experience cue, and next-available hint. The user can compare people without opening separate profiles. The selected service remains visible in the booking summary.

### Date and Time

Provide a horizontally navigable seven-day strip on phone and a wider date rail on tablet. Time slots are grouped into morning, afternoon, and evening only when those groups contain options. Unavailable slots remain understandable but are not interactive. Selecting a new date clears the previous slot.

### Review and Details

Display one consolidated booking summary with edit actions. Collect name, phone, and optional note using appropriate input types, labels, hints, and inline errors. Consent copy is factual and concise. The confirm action communicates the final price and remains disabled while submitting.

### Confirmation

Confirm the appointment with service, barber, local date and time, duration, and shop location. Provide one primary next action and a secondary calendar affordance. Avoid celebratory confetti or unrelated upsells.

## Required State Matrix

The rendered and behavioral matrix includes:

- populated service, barber, date/time, review, and success states;
- initial loading skeleton with stable geometry;
- availability request failure with impact, retry, and preserved selections;
- an empty day with a clear path to another date;
- a slot that becomes unavailable after selection, with an explanation and nearby alternatives;
- disabled continue and confirm states;
- inline invalid-name and invalid-phone feedback;
- submission in progress with duplicate submission prevented;
- compact phone and expanded tablet constraints;
- 200% text scaling on the highest-risk form or review state;
- reduced-motion behavior;
- light theme only for this first fixture, documented honestly.

## Design System

The demo defines semantic tokens rather than scattering raw values:

- canvas, surface, foreground, secondary text, border, accent, selected surface, success, warning, and destructive colors;
- display, title, body, label, and numeric typography roles;
- spacing, radius, focus, and motion roles;
- component themes for buttons, text fields, selectable rows, date cells, time slots, progress, and summary regions.

The display serif must be bundled or use a deterministic local fallback suitable for golden tests. The fixture must not fetch fonts or images from the network. Image assets must have clear provenance and redistribution permission; otherwise the first implementation uses deliberately art-directed local illustrations or neutral asset placeholders that do not pretend to be real people.

## Interaction and Motion

Motion communicates progression and state change only:

- a short directional transition between adjacent steps;
- selection feedback without scale bounce;
- summary changes through restrained cross-fade;
- error and success replacement without layout shock.

Animations must be interruptible and keep durations short. Reduced-motion mode removes directional movement and uses near-immediate opacity changes. Golden tests capture settled frames.

## Accessibility and Localization

All interactive targets are at least 48 logical pixels. Selectable items expose selected, enabled, and unavailable semantics. Reading and focus order follow the visual journey. Images have meaningful labels only when their content aids the decision; decorative imagery is excluded from semantics.

Text must remain usable at 200% scaling without clipped labels or hidden actions. Errors are announced and associated with their fields. The persistent action area must not obscure content or the keyboard. Date and price formatting use locale-aware utilities. Layout and component contracts remain RTL-safe even though the committed fixture copy is English.

## Code Organization

Create `examples/barbershop-booking` with an isolated Flutter application:

```text
examples/barbershop-booking/
├── README.md
└── demo/
    ├── lib/
    │   ├── main.dart
    │   ├── booking_controller.dart
    │   ├── booking_models.dart
    │   ├── booking_theme.dart
    │   ├── booking_flow_screen.dart
    │   └── widgets/
    ├── test/
    └── goldens/
```

The controller owns the deterministic journey and injected fixture state. Widgets remain small, typed, and callback-driven. No third-party state-management, routing, animation, or network dependency is required.

## Documentation and Evidence

The case-study README explains the user problem, design decisions, state matrix, adaptive behavior, accessibility treatment, seven-skill workflow, run commands, and verified limitations. It must distinguish authored showcase code from measured evidence and never claim that an agent generated the fixture automatically.

The repository README and public guide add a concise case-study section using real Flutter golden screenshots. A separate HTML prototype may be used during design review, but it is not implementation evidence and must not be presented as the Flutter application.

## Verification

The showcase is complete only when:

1. `dart format` and `flutter analyze` pass in the demo;
2. smoke tests cover forward progress, revision of earlier choices, validation, retry, slot invalidation, and duplicate-submit prevention;
3. semantics and 200% text-scale tests pass for critical states;
4. golden tests render representative phone, tablet, error, and success states;
5. every committed golden is visually inspected against this specification;
6. repository validation and Python tests pass;
7. README and public-guide images resolve from GitHub Pages;
8. no claim of dark-theme, backend, payment, or production readiness is made without evidence.

## Publication Standard

Community publication happens only after the Flutter evidence is committed and visible publicly. Reddit and Flutter-community copy must lead with the technical problem, show the complete booking journey and recovery state, explain what the seven-skill workflow changed, state limitations, and ask for concrete critique. It must not ask for stars, invent adoption, call the fixture production-ready, or present a promotional app advertisement as a development discussion.
