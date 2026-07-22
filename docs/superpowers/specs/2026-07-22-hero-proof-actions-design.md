# Hero Proof Actions — Design Specification

## Goal

Turn the two text links beneath the hero install command into clear, premium secondary actions. They should explain their destinations at a glance, improve click affordance, and preserve the install command as the hero's primary action.

## Approved Direction

Use two compact 44 px outlined action buttons:

- **See verified results** is the higher-priority secondary action. It uses a shield-check icon, lime text and border accents, and a small downward arrow indicating an in-page jump to `#evidence`.
- **Inspect the source** uses the GitHub mark, a neutral glass surface, and a small northeast arrow indicating an external destination.

The icons are semantic rather than decorative. Both buttons retain visible text; icon-only variants are out of scope.

## Visual Hierarchy

The install command and its filled copy/install control remain dominant. The verified-results action is visually stronger than the source action but quieter than the install control. The source action uses the same dark glass language as other secondary controls.

Both buttons use the site's existing radius, border, color, and easing tokens. No new color system or dependency is introduced.

## Interaction

- Minimum height: 44 px.
- Hover on verified results: subtle lime border/background lift; the trailing down arrow moves down by 2 px.
- Hover on source: brighter neutral border; the northeast arrow moves 2 px up and right.
- Active: restrained 1 px press/scale response.
- Keyboard focus: existing global `:focus-visible` treatment remains clearly visible.
- With `prefers-reduced-motion: reduce`, movement is removed while color/border feedback remains.

## Responsive Behavior

- Desktop and tablet: actions sit in one wrapping row with a compact gap.
- Narrow mobile: each action may expand to full width for reliable tapping and balanced composition.
- Labels never truncate and the layout must not cause horizontal overflow at 320 px.

## Accessibility and Semantics

- Keep both controls as native anchors.
- SVG icons are `aria-hidden="true"`; the visible labels provide the accessible names.
- The evidence action remains an in-page link to `#evidence`.
- The source action retains the GitHub repository URL.
- Existing analytics event names and `data-analytics-placement="hero"` remain unchanged.

## Validation

- Repository validator confirms both hero destinations and analytics attributes remain present.
- Run the full unit-test suite and repository validator.
- Visually check desktop, tablet, 390 px mobile, and 320 px mobile.
- Confirm keyboard focus, hover behavior, reduced motion, and absence of horizontal overflow.

## Scope Boundaries

This change affects only the two hero secondary actions and their validation. It does not redesign the install command, hero artwork, header actions, evidence section, or analytics implementation.
