# Premium sticky header

## Goal

Turn the existing navigation into a persistent conversion surface that remains legible, compact, and useful while preserving the site's dark editorial identity.

## Approved design

- Use a floating, sticky glass surface with a restrained border and tinted shadow.
- Increase the brand mark slightly and add a compact `7 skills` descriptor.
- Keep Workflow, Skills, Evidence, and Benchmark as section navigation.
- Show the currently visible section with an accessible active state.
- Keep GitHub secondary and make Install the single lime conversion action.
- Reduce header height after scrolling without moving content or hiding navigation.
- On narrow screens, expose the same links in a composed dropdown controlled by the existing Menu button.
- Preserve keyboard focus, reduced-motion behavior, and the no-JavaScript navigation fallback.

## Behavior

The header receives a compact state after the page leaves the top. An intersection observer updates `aria-current="location"` on section links. Anchor navigation remains native and smooth. Mobile navigation closes after selection or Escape.

## Verification

Validate desktop and mobile dimensions, scroll state, active-link state, keyboard operation, zero horizontal overflow, no console errors, and the repository contract tests.
