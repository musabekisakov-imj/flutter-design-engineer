# Header Action Icons — Design Specification

## Objective

Upgrade the desktop and mobile header actions so GitHub and Install read as a deliberate paired control system. Add recognizable, accessible icons without introducing an icon library, changing destinations, or increasing header clutter.

## Approved Direction

Use the selected **paired semantic glyphs** treatment:

- **GitHub:** official GitHub mark on the left, `GitHub` label in the middle, and the existing external-link cue on the right.
- **Install:** `Install` label on the left and a custom tray-download symbol on the right.

Both actions retain their current hierarchy: GitHub remains the outlined secondary action and Install remains the chartreuse primary action.

## Icon System

- Embed both icons as inline SVG so they inherit the button color and require no additional request or dependency.
- Use a filled GitHub mark at approximately 18–20 CSS pixels.
- Use a 20–22 CSS pixel tray-download symbol with round caps and joins, visually aligned to the GitHub mark rather than mathematically centered.
- Keep the external-link arrow smaller and quieter than the GitHub mark.
- Mark all icon SVGs `aria-hidden="true"`; the visible labels remain the accessible names.
- Avoid emoji, font glyphs, icon fonts, and generic downward arrows.

## Button Refinement

- Increase the internal gap enough to separate icon, label, and external cue without widening the header excessively.
- Keep the two controls equal in height and optically balanced despite different content widths.
- Preserve the existing navy outlined surface for GitHub and chartreuse fill for Install.
- On hover, lift each button by one pixel and strengthen its appropriate edge or highlight.
- On press, use a restrained scale or vertical compression.
- Preserve the visible keyboard focus ring and disable nonessential movement under reduced motion.

## Responsive Behavior

Desktop keeps the actions inline at the right edge of the navigation. The mobile menu keeps full text labels and icons; neither control becomes icon-only. The Install action remains the last and strongest item in the mobile navigation.

## Scope and Verification

This change is limited to `docs/index.html`, `docs/assets/install-guide.css`, and responsive visual QA evidence. It does not change navigation destinations, analytics attributes, copy, header structure, or installation behavior.

Verify:

- desktop and mobile header rendering;
- icon alignment and consistent button heights;
- hover, pressed, focus-visible, and reduced-motion behavior;
- no overflow at existing breakpoints;
- no duplicated accessible names;
- repository validation and tests.
