# Ultra-Pro Header — Implementation Plan

## Goal

Implement the approved Precision Glass header across expanded desktop, compact desktop, mobile closed, and mobile open states without changing navigation destinations, analytics semantics, install behavior, or the product identity.

## Tasks

### 1. Refine the semantic header structure

- Preserve the existing `header`, brand link, menu button, and primary `nav` landmarks.
- Group the four primary destinations inside a navigation capsule.
- Group GitHub and Install inside an actions container.
- Add decorative navigation indices for the mobile panel while keeping visible labels and existing attributes intact.
- Replace the mobile `Menu` text presentation with an accessible two-line glyph whose name changes between `Menu` and `Close menu`.

### 2. Build the Precision Glass visual states

- Upgrade the expanded header to a 70px layered glass surface with a 38px brand mark.
- Refine the grouped navigation capsule and active-section underline.
- Preserve GitHub as the secondary action and Install as the only high-energy action.
- Upgrade compact mode to a 58px anchored surface with a 32px brand mark.
- Add an opaque fallback for browsers without `backdrop-filter`.
- Keep all interaction targets at least 44px and prevent wrapping at intermediate widths.

### 3. Upgrade responsive menu behavior

- Render the mobile panel directly below the sticky header.
- Use full-width, indexed destination rows and paired GitHub/Install actions.
- Stack action controls at the narrowest breakpoint.
- Synchronize `aria-expanded`, visual state, and the button's accessible name.
- Close on in-page selection, outside click, and Escape.
- Return focus to the menu button after Escape when focus was inside the panel; preserve the user's clicked focus target after outside-close.

### 4. Polish motion and reduced-motion behavior

- Reuse existing easing and keep expanded-to-compact motion within 250ms.
- Animate the active underline through opacity and transform without JavaScript measurement.
- Limit hover movement to 1px and pressed scale to 0.98.
- Morph the mobile menu glyph only when reduced motion is not requested.
- Remove decorative motion and shorten transitions under `prefers-reduced-motion: reduce`.

### 5. Validate rendered behavior

- Run repository validation, unit tests, and `git diff --check`.
- Test 1440x900, 1024x768, 768x1024, 390x844, and 320x568.
- Verify expanded, compact, mobile closed, mobile open, keyboard, Escape, outside-click, and reduced-motion states.
- Confirm zero horizontal overflow and no header-related console warnings or errors.
- Save four visual QA screenshots under `docs/superpowers/qa/`.

### 6. Publish through the protected branch workflow

- Commit only the approved header, plan, and QA artifacts.
- Push `codex/ultra-pro-header`.
- Open a focused pull request against `main`.
- Wait for required repository, Flutter demo, and security checks.
- Squash-merge and verify the deployed GitHub Pages HTML, CSS, JavaScript, and rendered header.

## Files

- `docs/index.html`
- `docs/assets/install-guide.css`
- `docs/assets/install-guide.js`
- `docs/superpowers/specs/2026-07-22-ultra-pro-header-design.md`
- `docs/superpowers/plans/2026-07-22-ultra-pro-header-implementation-plan.md`
- QA evidence under `docs/superpowers/qa/`

## Acceptance Criteria

- The header presents distinct brand, navigation, and action groups on desktop.
- Expanded and compact states match the approved 70px and 58px hierarchy.
- The active section is visually clear and remains semantically represented by `aria-current="location"`.
- The mobile menu works with pointer and keyboard input at 390px and 320px without overflow.
- GitHub and Install retain their destinations, analytics attributes, visible labels, and upgraded icons.
- JavaScript-disabled and no-backdrop-filter fallbacks remain usable and legible.
- Reduced-motion users receive no decorative morph or movement.
- No new runtime dependency or asset request is introduced.
- All automated and rendered validation passes before merge.
