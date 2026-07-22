# Sponsor header action design

## Objective

Make the approved GitHub Sponsors profile discoverable throughout the website without obscuring content or competing visually with the primary installation action.

## Selected direction

Use option A from the real-site preview: add a dedicated `Sponsor` action to the existing sticky Precision Glass header. Keep the existing support section, footer link, README link, and native GitHub repository Sponsor button. The header action is an additional discovery path, not a replacement.

## Desktop behavior

Place `Sponsor` inside `.nav-actions`, between `GitHub` and `Install`. Use an outlined lime treatment with a heart icon. It must be more visible than the neutral GitHub action but less dominant than the filled Install action. The three actions express a clear hierarchy: inspect source, support the project, install the skills.

The link opens the public profile at `https://github.com/sponsors/musabekisakov-imj`. It uses the existing `sponsor_open` analytics event with `header` placement and a descriptive accessible label.

## Responsive behavior

At tablet widths, the label may collapse only if required to avoid crowding while the accessible name remains complete. At the existing mobile breakpoint, Sponsor moves into the expanded navigation with GitHub and Install. It must not become a floating overlay, must not cover page content, and must retain at least a 44-pixel touch target.

The mobile action grid should give Sponsor a complete row or an intentional layout that keeps all three actions readable. Closing the menu after link activation continues to use the existing navigation behavior.

## Visual and interaction states

- Default: subtle lime border, low-opacity lime surface, lime text and heart.
- Hover: slightly brighter surface and one-pixel lift.
- Active: existing pressed transform.
- Keyboard focus: existing high-contrast focus ring.
- Reduced motion: existing global reduced-motion rule removes transitions.

## Validation

- Extend the site contract to require the header Sponsor action and official URL.
- Run repository validation and unit tests.
- Inspect desktop, tablet, and mobile screenshots.
- Verify no horizontal overflow, action collision, clipped labels, or console errors.
- Confirm `sponsor_open` receives `placement: header` without persistent client storage.

