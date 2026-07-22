# Workflow 3D Icon System — Design Specification

## Objective

Add a coherent set of seven premium 3D icons to the public website workflow section. The icons must make the seven specialist stages easier to scan while preserving the headline, copy, accessibility, responsiveness, and restrained dark editorial identity.

## Approved Direction

Use custom pre-rendered 3D bitmap assets. The approved visual reference is the Audit concept: graphite and dark ceramic construction, controlled off-white highlights, one restrained chartreuse accent, an upper-left studio key light, a soft rim light, and a three-quarter isometric camera.

The set must feel like one industrial product family rather than seven independently illustrated objects. Avoid colorful emoji styling, inflated toy forms, neon glow, decorative particles, brand logos, text inside the renders, and continuous animation.

## Icon Metaphors

1. **Audit:** a magnifying lens inspecting a modular interface tile.
2. **Design:** a precision cursor shaping a wireframe surface.
3. **System:** interlocking semantic modules connected around a central token.
4. **Build:** structured construction blocks assembling into a mobile interface.
5. **Motion:** two controlled forms following a clear motion path.
6. **Access:** an inclusive human-form control surrounded by focus and scale guides.
7. **Verify:** a rendered mobile surface passing through a calibrated check gate.

Each metaphor must remain identifiable at the final displayed size without relying on text.

## Asset Production Contract

- Generate every icon with the same camera angle, focal character, lighting direction, backdrop color, material palette, object scale, and empty-space ratio.
- Use a square master composition with the object centered optically and fully contained.
- Match the website's deep navy environment and allow the outer background to fall smoothly into the workflow card surface.
- Produce no embedded text, letters, logos, watermarks, floor seams, or cropped geometry.
- Inspect all seven masters together before integration. Regenerate any outlier whose brightness, silhouette, lime coverage, camera, or perceived scale breaks the family.
- Save optimized website derivatives as WebP files under `docs/assets/workflow/` using stable stage names.
- Keep each delivered WebP small enough for responsible page loading; target 80 KB or less and do not exceed 120 KB per icon without documented justification.

## Website Integration

Each workflow list item receives one decorative image between the lime stage label and the stage description. The semantic stage name and description remain the accessible content, so icon images use empty alternative text and do not introduce duplicate screen-reader announcements.

On wide screens, icons display at approximately 72–88 CSS pixels with a consistent visual baseline. At four- and two-column breakpoints, the icons remain prominent without increasing card height materially. In the single-column mobile layout, each icon moves into a compact side composition so the workflow does not become seven tall image cards.

The assets must use explicit intrinsic dimensions to prevent layout shift. Native lazy loading is not required for this above-the-fold section because delayed appearance would weaken the staged workflow; decoding may remain asynchronous if it does not cause visible popping.

## Interaction and Motion

Desktop pointer hover may add a restrained lift, a two- to three-degree tilt, and a subtle chartreuse reflection or shadow. Transitions use transforms and opacity only, complete in roughly 220–320 ms, and return smoothly.

Keyboard focus must not depend on decorative icon motion. Touch layouts remain static. `prefers-reduced-motion: reduce` disables icon transforms and animated reflection while preserving the final visual state.

## Visual and Technical QA

- Verify the workflow at desktop seven-column, tablet four-column, compact two-column, and mobile single-column breakpoints.
- Confirm that titles and descriptions keep their current reading order and do not collide with icons.
- Confirm that the outer pixels of every asset blend into the card background without visible square boundaries.
- Compare perceived icon size, highlight intensity, and lime-accent coverage across the full set.
- Confirm no hover-only information, no layout shift, no horizontal overflow, and no motion when reduced motion is enabled.
- Run the repository validator and existing tests after integration.
- Capture a rendered desktop screenshot and at least one mobile screenshot before claiming visual completion.

## Scope

This change affects only the workflow section, its seven new image assets, and the CSS required for placement and restrained interaction. It does not redesign the surrounding page, alter workflow copy, add a 3D runtime, introduce WebGL, or change product behavior.
