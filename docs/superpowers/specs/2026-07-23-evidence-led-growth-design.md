# Evidence-Led Growth Redesign

## Objective

Improve the Flutter Design Engineer website for four connected outcomes, in this order:

1. earn GitHub Stars through credibility;
2. convert qualified visitors into skill installs;
3. invite sponsorship only after value is demonstrated;
4. strengthen the repository as evidence for ecosystem and Claude-related promotion.

The redesign must remain honest. It must not invent Star counts, download counts, user counts, testimonials, live AI capabilities, or production-backend claims.

## Approved Direction

Use the **Evidence-led hybrid** direction. Preserve the existing dark precision-glass identity, but change the content hierarchy from “describe the skill collection” to “promise an outcome, prove the workflow, then ask for action.”

The primary journey is:

`Understand outcome → inspect proof → understand workflow → Star → install → optionally Sponsor`

## Information Architecture

### Hero

- Replace the current headline with the outcome-first message: **From product intent to verified Flutter UI.**
- Explain that seven connected specialists audit, design, implement, and verify adaptive Flutter interfaces.
- Keep the install command as the dominant control.
- Keep two secondary actions: **See verified results** and **Star repository**.
- Do not show a dynamic Star counter in the hero.

### Proof rail

Place a compact proof rail immediately after the hero with three honest anchors:

- **7 connected skills** — links to the skills registry;
- **Real source** — links to the public GitHub repository;
- **Golden-test QA** — links to evidence.

The rail summarizes proof; it does not add unverifiable metrics.

### Workflow

Present the workflow as one continuous chain:

`Intent → Audit → Design system → Implementation → Motion → Accessibility → Visual QA → Evidence`

The existing seven skills remain intact. Copy and visual connectors should make the handoff between stages explicit.

### Evidence

Treat every screenshot as a verifiable artifact rather than decoration. Each evidence item must identify:

- the producing or validating skill;
- the rendered state or breakpoint;
- what the artifact proves;
- an **Inspect output** link to the corresponding committed GitHub file.

Retain the Visual QA error state. It demonstrates that one unavailable check does not erase safe audit and design-system results.

### Conversion moments

- After visitors encounter meaningful evidence, show a compact **Useful? Star the repository** action.
- Keep install actions near workflow completion and in the install section.
- Make copy success unmistakable through a check icon and short content transition.
- Keep Sponsor available in the header and support/footer section, but do not insert a dominant Sponsor request before evidence.

## Visual System

- Preserve the current canvas, precision-glass surfaces, lime accent, typography, and compact radii.
- Use icons only where they clarify meaning: proof, source, verification, install, copy success, Star, and Sponsor.
- Do not add decorative icon grids, gradients unrelated to hierarchy, floating badges, or fake social-proof widgets.
- Keep Install visually dominant; Star is the strongest secondary action; Sponsor remains tertiary until the support section.

## Motion System

The site should feel faster through restraint, not through more movement.

### Tokens

- `--ease-out: cubic-bezier(.23, 1, .32, 1)` for entrances and direct feedback.
- `--ease-in-out: cubic-bezier(.77, 0, .175, 1)` only for elements visibly moving between settled positions.
- Button press feedback: `100–160ms` and approximately `scale(.97–.985)` according to control size.

### Approved motion

- Scroll reveal: `opacity` plus `translateY(10px)`, `360ms`, `--ease-out`.
- Hero screenshot entrance: one explanatory sequence around `520ms`, with `60ms` between screens.
- Copy success: `opacity` plus at most `blur(2px)`, `180ms`; no layout movement.
- Skill-panel state change: `opacity` plus at most `blur(2px)`, `180ms`; panel dimensions stay stable.
- Hover transforms run only inside `(hover: hover) and (pointer: fine)`.

### Motion deliberately excluded

- infinite screenshot movement;
- cursor-following effects;
- heavy parallax;
- animated Star counters;
- floating CTA motion;
- keyboard-navigation animation;
- decoration that moves functional evidence while it is being read.

## Responsive Behavior

- Desktop: proof rail uses three columns and evidence captions sit with their artifacts.
- Tablet: proof rail may retain three compact columns or wrap without truncation.
- Mobile: proof rail becomes a vertical or horizontally scroll-free stack; conversion actions become full-width when needed.
- All interactive controls keep at least a 44 px target.
- No horizontal overflow at 320 px.

## Accessibility

- Use native anchors and buttons.
- Decorative SVGs are hidden from assistive technology; visible labels form accessible names.
- Preserve visible focus indication and logical keyboard order.
- Under `prefers-reduced-motion: reduce`, remove position movement while retaining brief `160–200ms` color and opacity feedback that explains state.
- Do not rely on color or motion alone to communicate copy success, selected tabs, or external destinations.

## Data and Failure Behavior

- Do not require GitHub API data for the page to function.
- If live repository metrics are introduced later, unavailable or rate-limited data must be omitted rather than replaced with zero or fabricated values.
- Existing analytics remain local-event contracts. Extend them for the new Star and proof-rail placements without adding third-party analytics dependencies.
- All external destinations remain usable without JavaScript.

## Validation

- Extend the repository validator to enforce hero copy, proof-rail destinations, evidence inspect links, and analytics placement contracts.
- Run `python3 scripts/validate_repository.py`.
- Run `python3 -m unittest discover -s tests -v`.
- Perform visual QA at 1440, 1024, 768, 390, and 320 px.
- Check keyboard order, visible focus, hover/touch behavior, copy success, tab switching, reduced motion, console errors, broken links, and horizontal overflow.
- Compare the rendered result with the approved direction before publishing.

## Scope Boundaries

- No Flutter demo redesign.
- No new JavaScript framework or motion dependency.
- No live backend, authentication, payment integration, or GitHub API requirement.
- No fabricated adoption metrics or testimonials.
- No broad rebranding; the existing visual identity is refined rather than replaced.
