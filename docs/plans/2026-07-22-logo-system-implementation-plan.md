# Logo System Implementation Plan

## Goal

Replace every public `F` placeholder with the approved geometric Flutter Design Engineer mark and verify it across website, favicon, Flutter goldens, and repository presentation.

## Tasks

1. Create a canonical SVG mark under `docs/assets/brand/` with dark, blue, cyan, and lime semantic colors.
2. Replace header and footer letter marks with accessible SVG applications and add the SVG favicon link.
3. Implement the same normalized geometry in Flutter with `CustomPainter` and use it in compact and expanded Product Studio navigation.
4. Regenerate and inspect all Product Studio goldens, then synchronize website evidence assets.
5. Add the mark to README presentation and document the logo contract in `AGENTS.md`.
6. Run Flutter analyzer/tests, repository validation/tests, browser checks at 390/768/1024/1440, console checks, and favicon verification.
7. Commit, push, and wait for successful Validate and Pages deployments.
