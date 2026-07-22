# Header Action Icons — Implementation Plan

## Goal

Implement the approved paired semantic glyphs treatment for the GitHub and Install header actions without changing destinations, analytics, navigation behavior, or responsive structure.

## Tasks

### 1. Upgrade semantic markup

- Add an inline, decorative GitHub mark before the GitHub label.
- Retain and visually subordinate the external-link cue.
- Replace the Install down-arrow character with an inline tray-download SVG.
- Preserve visible labels and existing analytics attributes.

### 2. Refine the paired controls

- Normalize icon boxes, gaps, button heights, and optical alignment.
- Add restrained secondary and primary hover/press treatments.
- Preserve focus-visible and reduced-motion behavior.
- Keep the mobile menu labels and icon system intact.

### 3. Verify and publish

- Run repository validation, unit tests, and `git diff --check`.
- Inspect desktop and mobile rendered headers for overflow and alignment.
- Save visual QA evidence.
- Commit, push the feature branch, open the required PR, merge after checks pass, and verify the public site.

## Files

- `docs/index.html`
- `docs/assets/install-guide.css`
- desktop and mobile evidence under `docs/superpowers/qa/`

## Acceptance Criteria

- Both buttons share one coherent icon and spacing system.
- The GitHub and Install labels remain accessible and immediately legible.
- No new runtime dependency or asset request is introduced.
- Existing navigation and analytics behavior remains unchanged.
- Desktop and mobile views have no header overflow.
