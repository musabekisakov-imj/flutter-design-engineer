# Hero Proof Actions — Implementation Plan

1. Update the two hero anchors in `docs/index.html` with semantic inline SVG icons and dedicated component classes while preserving destinations and analytics attributes.
2. Add scoped button, icon, interaction, reduced-motion, and narrow-mobile rules to `docs/assets/install-guide.css` using existing design tokens.
3. Extend `scripts/validate_repository.py` so the hero action classes, destinations, and analytics placement remain contractual.
4. Run diff checks, repository validation, and the full unit-test suite.
5. Serve the site locally and verify desktop, tablet, 390 px, and 320 px renderings, including focus and overflow behavior.
6. Commit the implementation, push a feature branch, open a pull request, wait for checks, merge, wait for GitHub Pages, and verify the public HTML.
