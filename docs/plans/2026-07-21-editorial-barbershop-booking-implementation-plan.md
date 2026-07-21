# Editorial Barbershop Booking Showcase Implementation Plan

**Design contract:** `docs/specs/2026-07-21-editorial-barbershop-booking-design.md`

## Objective

Build, render, inspect, document, and publish an isolated deterministic Flutter booking fixture that demonstrates the repository's seven-skill workflow without modifying the private DE Legends staff application.

## Guardrails

- Work only inside `flutter-design-engineer` for the showcase.
- Preserve the connected command center as a separate example.
- Use local deterministic data, fonts, time, and artwork; no network or backend.
- Treat HTML as a design-review artifact only. Only Flutter goldens are implementation evidence.
- Do not update goldens broadly without visual inspection.
- Do not publish community posts before the public evidence is verified.

## Phase 1 — Review Prototype

### Task 1: Build the standalone HTML design companion

**Create:**

- `docs/prototypes/editorial-barbershop-booking/index.html`
- `docs/prototypes/editorial-barbershop-booking/styles.css`
- `docs/prototypes/editorial-barbershop-booking/app.js`

**Steps:**

1. Encode the approved Editorial Craft tokens and five-step journey.
2. Show phone screens for service, barber, availability, review, and confirmation.
3. Add one recoverable availability error state and one expanded tablet composition.
4. Add screen switching and a compact state legend without simulating a backend.
5. Verify the page locally at narrow and wide browser constraints.
6. Capture a review screenshot and compare it with the design contract.

## Phase 2 — Flutter Fixture Foundation

### Task 2: Scaffold the isolated demo and deterministic domain model

**Create:**

- `examples/barbershop-booking/README.md`
- `examples/barbershop-booking/demo/pubspec.yaml`
- `examples/barbershop-booking/demo/analysis_options.yaml`
- `examples/barbershop-booking/demo/lib/main.dart`
- `examples/barbershop-booking/demo/lib/booking_models.dart`
- `examples/barbershop-booking/demo/lib/booking_fixtures.dart`
- `examples/barbershop-booking/demo/test/booking_controller_test.dart`

**Steps:**

1. Write model/controller tests for selection, downstream invalidation, retry, slot invalidation, validation, and duplicate-submit prevention.
2. Confirm the tests fail before implementation.
3. Add immutable service, barber, day, slot, customer, and confirmation models.
4. Add deterministic fixtures and a clock-independent state controller.
5. Run focused tests until they pass.

### Task 3: Implement the semantic design system

**Create:**

- `examples/barbershop-booking/demo/lib/booking_theme.dart`
- `examples/barbershop-booking/demo/lib/widgets/booking_primitives.dart`
- `examples/barbershop-booking/demo/test/booking_theme_test.dart`

**Steps:**

1. Test the semantic palette and key component contracts.
2. Define canvas, surface, content, border, accent, selected, success, warning, destructive, focus, and disabled roles.
3. Define display, title, body, label, and numeric typography roles.
4. Define spacing, geometry, control heights, focus, and motion roles.
5. Map roles into `ThemeData`, component themes, and one narrow `ThemeExtension`.
6. Keep the first fixture light-only and document that boundary.

## Phase 3 — Connected Booking Journey

### Task 4: Implement orchestration and adaptive shell

**Create:**

- `examples/barbershop-booking/demo/lib/booking_controller.dart`
- `examples/barbershop-booking/demo/lib/booking_flow_screen.dart`
- `examples/barbershop-booking/demo/lib/widgets/booking_progress.dart`
- `examples/barbershop-booking/demo/lib/widgets/booking_summary.dart`
- `examples/barbershop-booking/demo/lib/widgets/persistent_action_bar.dart`

**Steps:**

1. Add widget tests for phone single-column and tablet two-region composition.
2. Implement constraint-driven layout with a meaningful expanded breakpoint.
3. Keep active-step state and summary consistent across recomposition.
4. Implement safe-inset and keyboard-aware action placement.
5. Add accessible progress semantics and edit actions.

### Task 5: Implement service and barber selection

**Create:**

- `examples/barbershop-booking/demo/lib/widgets/service_step.dart`
- `examples/barbershop-booking/demo/lib/widgets/barber_step.dart`
- `examples/barbershop-booking/demo/test/selection_steps_test.dart`

**Steps:**

1. Test disabled continue, selection semantics, `Any available barber`, and downstream invalidation.
2. Implement service rows with duration, price, and plain-language description.
3. Implement editorial barber portraits using deterministic local artwork, specialties, and availability cue.
4. Ensure selected state is conveyed through structure, icon, text, and color.

### Task 6: Implement availability and recovery states

**Create:**

- `examples/barbershop-booking/demo/lib/widgets/availability_step.dart`
- `examples/barbershop-booking/demo/lib/widgets/booking_states.dart`
- `examples/barbershop-booking/demo/test/availability_step_test.dart`

**Steps:**

1. Test date changes, unavailable slots, empty day, request failure, retry, preserved selections, and slot invalidation.
2. Implement the date strip and grouped time slots.
3. Keep unavailable slots legible but non-interactive.
4. Place recovery beside the failed availability region.
5. Preserve upstream selection and offer nearby alternatives after invalidation.

### Task 7: Implement review, validation, submission, and confirmation

**Create:**

- `examples/barbershop-booking/demo/lib/widgets/review_step.dart`
- `examples/barbershop-booking/demo/lib/widgets/confirmation_step.dart`
- `examples/barbershop-booking/demo/test/review_confirmation_test.dart`

**Steps:**

1. Test input preservation, inline errors, appropriate field semantics, submission state, duplicate prevention, and successful confirmation.
2. Implement the consolidated review and per-section edit actions.
3. Implement persistent labels, keyboard types, autofill hints, and associated validation.
4. Disable duplicate confirmation while submitting.
5. Render a calm confirmation with one primary and one secondary action.

## Phase 4 — Motion and Inclusive Behavior

### Task 8: Add purposeful and reduced motion

**Modify:**

- `examples/barbershop-booking/demo/lib/booking_flow_screen.dart`
- `examples/barbershop-booking/demo/lib/booking_theme.dart`
- `examples/barbershop-booking/demo/test/booking_motion_test.dart`

**Steps:**

1. Test that rapid navigation converges on current state and reduced motion removes spatial travel.
2. Add an interruptible adjacent-step transition and restrained summary cross-fade.
3. Keep core actions immediately available.
4. Use near-immediate opacity feedback under reduced motion.

### Task 9: Complete accessibility and localization-safety checks

**Create:**

- `examples/barbershop-booking/demo/test/booking_accessibility_test.dart`

**Steps:**

1. Test core selection and form semantics.
2. Test 48-pixel targets, logical reading order, and unavailable/selected values.
3. Render the highest-risk form/review state at 200% text scaling.
4. Test long content and an RTL direction wrapper for structural safety.
5. Record that manual screen-reader testing is not automated unless performed separately.

## Phase 5 — Rendered Evidence and Refinement

### Task 10: Add deterministic golden coverage

**Create:**

- `examples/barbershop-booking/demo/test/booking_golden_test.dart`
- `examples/barbershop-booking/demo/goldens/phone-service.png`
- `examples/barbershop-booking/demo/goldens/phone-availability.png`
- `examples/barbershop-booking/demo/goldens/phone-review.png`
- `examples/barbershop-booking/demo/goldens/phone-confirmation.png`
- `examples/barbershop-booking/demo/goldens/phone-availability-error.png`
- `examples/barbershop-booking/demo/goldens/tablet-availability.png`
- `examples/barbershop-booking/demo/goldens/phone-review-text-200.png`

**Steps:**

1. Freeze pixel ratio, surface size, animation, locale, fixture time, and artwork.
2. Generate the smallest representative phone/tablet/state/text-scale matrix.
3. Inspect every golden visually in side-by-side contact sheets.
4. Log P0–P3 findings by task impact, not personal preference.
5. Complete at least one refinement pass for all P0–P2 findings.
6. Regenerate and reinspect only affected artifacts.

## Phase 6 — Repository and Public Guide

### Task 11: Document the evidence honestly

**Modify:**

- `examples/barbershop-booking/README.md`
- `README.md`
- `docs/index.html`
- `docs/assets/install-guide.css`
- `docs/assets/install-guide.js` only if interaction is required
- `AGENTS.md`

**Steps:**

1. Add a concise case study with the real phone flow and tablet/error evidence.
2. Explain the user problem, seven-skill sequence, design decisions, states, verification, and limitations.
3. Label the HTML page as a prototype and Flutter goldens as implementation evidence.
4. Keep the connected command center visible as the adaptive dashboard example.
5. Verify paths locally and after GitHub Pages deployment.

### Task 12: Run full verification and publish the repository update

**Steps:**

1. Run `dart format --set-exit-if-changed .` in the demo.
2. Run `flutter analyze` and all Flutter tests.
3. Run `python3 scripts/validate_repository.py` and `python3 -m unittest discover -s tests`.
4. Review `git diff --check`, the complete diff, and repository status.
5. Commit the implementation in intentional units.
6. Push `main` only after all required checks pass.
7. Verify the public GitHub README and Pages guide display the images.

## Phase 7 — Community Launch

### Task 13: Prepare and submit technical community posts

**Modify:**

- `docs/launch/community-posts.md`

**Steps:**

1. Write a Reddit post as an open-source Flutter design-engineering deep dive, not app advertising.
2. Include the real flow, one recovery state, technical architecture, test matrix, explicit limitations, and questions for critique.
3. Prepare Flutter Community/Discord variants fitted to their current channel rules.
4. Re-check current posting rules immediately before submission.
5. Present the final copy and target destination for action-time confirmation if the platform will create a public external post.
6. Submit only through an authenticated user session and capture confirmation evidence.

## Definition of Done

- The five-step journey works deterministically on phone and tablet.
- Loading, empty, error, unavailable, validation, submitting, and success behavior is tested.
- Accessibility and reduced-motion behavior is implemented and reported honestly.
- Flutter analysis, tests, repository validation, and visual inspection pass.
- Public documentation uses genuine Flutter screenshots.
- The public repository update is pushed and visible.
- Community posts are technical, rule-compliant, and never ask for stars or fabricate traction.
