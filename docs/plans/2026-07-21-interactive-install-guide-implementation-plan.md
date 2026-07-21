# Interactive Install Guide Implementation Plan

## Objective

Ship the approved Technical Command Center as a dependency-free GitHub Pages
site, link it from the README, verify it visually and functionally, and confirm
the public URL is live.

## Tasks

1. Create `docs/index.html` with semantic landmarks, the recommended install
   route, agent tabs, workflow, seven skill summaries, maintenance guidance,
   troubleshooting, and the first-run prompt.
2. Create `docs/assets/install-guide.css` with the approved navy/coral tokens,
   responsive layouts, visible focus states, reduced-motion handling, and
   horizontal command overflow protection.
3. Create `docs/assets/install-guide.js` with accessible tab navigation,
   clipboard success feedback, and manual-copy fallback.
4. Copy the current Claude, Codex, and Gemini icons into
   `docs/assets/agents/`; retain the official Cursor asset URL with a textual
   fallback.
5. Add an `Open Interactive Install Guide` CTA to the README without removing
   the working CLI route.
6. Run repository tests, source-level HTML checks, link checks, and installer
   checks for all four destinations.
7. Serve the site locally and capture desktop and mobile screenshots. Review
   layout, clipping, focus, interaction, reduced motion, and no-JavaScript
   behavior; correct defects and repeat screenshots where necessary.
8. Commit and push to `main`, configure GitHub Pages to publish `/docs`, then
   verify the canonical URL returns HTTP 200.

## Completion Criteria

- All approved content and interactions are present.
- Core installation information remains usable without JavaScript.
- Tests pass and all four installers produce seven skills.
- Desktop and mobile screenshots pass visual review.
- README links to a publicly reachable GitHub Pages guide.
