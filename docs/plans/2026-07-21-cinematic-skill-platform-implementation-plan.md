# Cinematic Skill Platform Implementation Plan

## Goal

Replace the current GitHub Pages composition with the approved cinematic developer-product experience while preserving the public route, validated install commands, accessibility behavior, and repository evidence.

## Task 1: Rebuild the semantic page structure

Files:

- `docs/index.html`

Work:

- Replace the existing hero with the approved split cinematic hero.
- Preserve skip navigation and semantic landmarks.
- Add verified facts, connected workflow, interactive skill registry, real Flutter evidence, agent installation, technical proof, and final install sections.
- Keep existing source links and valid installation commands.
- Use only committed Flutter golden images as product screenshots.
- Add image dimensions, lazy-loading below the fold, complete alternatives, metadata, and social preview metadata.

Verification:

- Validate heading order and unique IDs.
- Confirm no placeholder links or unsupported claims.
- Confirm visible copy contains no em dash characters.

## Task 2: Build the cinematic visual system

Files:

- `docs/assets/install-guide.css`

Work:

- Replace the existing style sheet with a locked dark cool-neutral theme and coral accent.
- Implement the asymmetric hero and real phone composition.
- Add distinct layouts for facts, workflow, registry, evidence, agent installation, and proof.
- Define explicit 1024, 768, and 620 pixel responsive behavior.
- Keep controls at least 44 pixels on mobile and prevent horizontal overflow.
- Add restrained transform/opacity motion and reduced-motion overrides.

Verification:

- Inspect 390, 768, 1024, and 1440 pixel renderings.
- Check hero fit, button contrast, command overflow, focus states, and phone-image legibility.

## Task 3: Extend interactions without dependencies

Files:

- `docs/assets/install-guide.js`

Work:

- Preserve copy-button behavior and polite status feedback.
- Support two independent accessible tab systems: skill registry and agent installation.
- Implement ArrowLeft, ArrowRight, Home, and End navigation within each tablist.
- Add mobile navigation toggle with correct expanded state and Escape handling.
- Use IntersectionObserver for optional section reveal behavior.
- Avoid scroll listeners and animation libraries.

Verification:

- Run a static JavaScript syntax check.
- Exercise all controls by keyboard in the browser.
- Confirm core content remains available without JavaScript.

## Task 4: Align repository-facing content

Files:

- `README.md`

Work:

- Keep the README technical and install-first.
- Reframe the barbershop fixture as one verification example rather than a primary product story.
- Link the redesigned public guide and evidence section.

Verification:

- Run repository validation and unit tests.
- Check all local paths and public links.

## Task 5: Rendered QA and publication

Files:

- `docs/assets/site-preview/desktop.png`
- `docs/assets/site-preview/mobile.png`

Work:

- Run the local docs server.
- Capture and inspect desktop and mobile screenshots.
- Fix visual defects, overflow, contrast, broken assets, and interaction problems.
- Run the full pre-flight checklist from the approved design specification.
- Commit the implementation separately from QA artifacts.
- Push only after all checks pass.

Verification:

- `python3 scripts/validate_repository.py`
- `python3 -m unittest discover -s tests`
- `git diff --check`
- browser console has no errors
- GitHub Pages build completes on the published commit
