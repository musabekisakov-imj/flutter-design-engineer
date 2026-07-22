# Ultra-Pro Header Design

## Status

Approved visual direction: **Precision Glass**.

This specification upgrades the existing Flutter Design Engineer website header without changing its information architecture, brand identity, destinations, analytics events, or install flow.

## Objective

Make the header feel as deliberate and premium as the rest of the website while improving navigation clarity, compact-scroll behavior, mobile usability, and interaction feedback.

The upgrade must remain lightweight, accessible, responsive, and native to the existing static HTML, CSS, and JavaScript implementation.

## Approved Direction

Precision Glass is a restrained evolution of the current header rather than a visual rebrand. It separates the header into three clear groups:

1. Brand lockup: mark, product name, and `7 skills` badge.
2. Primary navigation: Workflow, Skills, Evidence, and Benchmark inside a quiet grouped navigation surface.
3. Primary actions: GitHub as a secondary outlined control and Install as the only high-energy chartreuse control.

The visual treatment uses controlled transparency, a subtle vertical surface gradient, restrained border highlights, and deeper shadowing when the header becomes compact. Glass effects must preserve sufficient contrast and degrade gracefully when backdrop filtering is unavailable.

## Desktop Layout

- The expanded sticky header is 70px tall and retains the current centered maximum width.
- The brand mark is 38px square in the expanded state.
- The primary links sit inside a low-contrast grouped navigation capsule. This capsule visually distinguishes navigation from the brand and actions without resembling a segmented control.
- The active section uses brighter text, a faint local surface, and a 2px chartreuse underline.
- GitHub and Install remain 44px minimum-height controls.
- Install remains the strongest visual element in the header. GitHub remains quieter and must not compete with it.
- Spacing must prevent collision at intermediate widths. The desktop navigation collapses to the mobile pattern before any item wraps.

## Compact Scroll State

- The header enters compact mode after the page scrolls beyond the existing threshold.
- Compact height is 58px.
- The brand mark reduces to 32px.
- Vertical padding and surface transparency reduce while shadow depth increases slightly, making the sticky state feel anchored.
- Navigation and action labels remain visible on desktop.
- The transition uses the existing easing system and completes within 250ms.
- Layout-affecting animation is limited to header height, padding, and brand-mark size. No spring or overshoot is used.

## Navigation State and Motion

- Existing section observation remains the source of truth for `aria-current="location"`.
- The active underline transitions using opacity and transform. It must not require JavaScript measurement or introduce layout shift.
- Link hover feedback is limited to color and a faint local background.
- GitHub may lift by at most 1px on hover; its external-link glyph may move by at most 1px diagonally.
- Install may lift by at most 1px and gain a slightly stronger chartreuse shadow.
- Pressed controls translate down by 1px and scale no smaller than 0.98.
- Under `prefers-reduced-motion: reduce`, scroll-state and interactive transitions become effectively immediate and decorative movement is removed.

## Mobile Header and Menu

- At the existing mobile breakpoint, only the brand lockup and menu control remain in the header row.
- The text `Menu` control becomes a two-line menu glyph with an accessible name of `Menu` when closed and `Close menu` when open.
- The icon animates into a close glyph only when reduced motion is not requested.
- The open navigation panel appears directly below the sticky header and uses the same Precision Glass surface language.
- Primary destinations are full-width 46px minimum-height rows. They show optional visual indices `01` through `04`; those indices are decorative and hidden from assistive technology.
- GitHub and Install appear as two equal-width actions beneath the destination rows at 390px and wider.
- At very narrow widths, including 320px, those actions stack vertically to preserve readable labels and 44px targets.
- Opening the menu does not scroll the page to the top or alter the current section.
- Selecting an in-page destination closes the menu and moves to the destination using existing anchor behavior.
- Clicking outside the panel or pressing Escape closes it.
- Pressing Escape while focus is inside the panel returns focus to the menu control. An outside click leaves focus with the user's clicked target.
- Page scroll remains available while the compact menu is open because the panel does not cover the viewport.

## Components and Responsibilities

### Header structure

`docs/index.html` retains one semantic `header`, one brand link, one menu button, and one primary `nav`. Additional wrappers may be introduced only for the brand, grouped navigation links, and action controls.

### Header presentation

`docs/assets/install-guide.css` owns expanded, compact, active, hover, focus, mobile-panel, narrow-width, fallback, and reduced-motion presentation. New values should reuse existing color, spacing, radius, shadow, and easing variables where possible.

### Header behavior

`docs/assets/install-guide.js` owns compact-scroll state, menu open/close state, accessible labels, outside-click handling, Escape handling, and focus return. It must not duplicate the section-observer logic or introduce a dependency.

## State Flow

1. On load, JavaScript identifies the header, menu control, navigation panel, and navigation links.
2. Scroll state toggles `.is-compact` on the header using the existing threshold behavior.
3. Section observation updates `aria-current="location"`; CSS renders the corresponding active treatment.
4. Menu activation toggles `.is-open`, synchronizes `aria-expanded`, and updates the menu control's accessible name.
5. An in-page navigation selection, Escape, or an outside click closes the menu.
6. Escape returns focus to the menu button when focus was inside the panel. Outside-click closure does not override the user's new focus target.

## Accessibility Requirements

- Semantic header and navigation landmarks remain intact.
- Every interactive target is at least 44px in both dimensions; mobile navigation rows are at least 46px tall.
- Keyboard focus uses the existing high-contrast chartreuse focus ring and is never clipped by the header or panel.
- `aria-expanded` and `aria-controls` remain synchronized with visual state.
- The menu button's accessible name reflects open and closed state.
- Decorative indices and glyphs are `aria-hidden="true"`.
- Current-section state continues to use `aria-current="location"`.
- Text and controls maintain WCAG AA contrast against every header surface.
- The header remains usable at 200% browser zoom and with long text without horizontal page overflow.

## Resilience and Fallbacks

- Without JavaScript, primary navigation remains visible and wraps only according to the existing no-JavaScript responsive fallback.
- Without `backdrop-filter`, the header and mobile panel use an opaque dark surface that preserves contrast.
- Missing optional decorative effects must never affect layout or interaction.
- If `IntersectionObserver` is unavailable, navigation remains functional even if active-section highlighting does not update dynamically.

## Analytics and Links

- Existing GitHub URL, Install anchor, navigation anchors, `data-analytics-event`, and `data-analytics-placement` attributes remain unchanged.
- The redesign adds no telemetry and changes no install commands.

## Validation

Repository validation:

- `python3 scripts/validate_repository.py`
- `python3 -m unittest discover -s tests`
- `git diff --check`

Browser validation:

- Desktop: 1440x900 and 1024x768.
- Tablet boundary: 768x1024.
- Mobile: 390x844 and 320x568.
- Expanded and compact scroll states.
- Mobile menu closed and open states.
- Keyboard-only navigation, Escape close, outside click, and focus return.
- Reduced-motion mode.
- No horizontal overflow at any target viewport.
- No console warnings or errors caused by the header.

Visual QA artifacts:

- Capture desktop expanded, desktop compact, mobile closed, and mobile open screenshots.
- Store the final evidence under `docs/superpowers/qa/` with descriptive filenames.

## Non-Goals

- Rebranding the product or replacing the current mark.
- Adding new navigation destinations.
- Adding search, account controls, dropdown navigation, themes, or command palettes.
- Introducing a UI, icon, animation, or JavaScript framework.
- Changing hero content, page sections, installation commands, or analytics semantics.
