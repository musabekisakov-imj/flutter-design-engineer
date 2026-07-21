# Rendered Mobile Showcase Implementation Plan

## Objective

Add the approved Cinematic Device Wall and recoverable error-state proof to the
published install guide using only existing Flutter golden-test outputs.

## Tasks

1. Copy the compact, expanded, and error goldens into
   `docs/assets/showcase/`; verify each copy is byte-identical to its source.
2. Insert a semantic rendered-evidence section after the hero and before the
   Agent Command Center, with repository links and explicit golden-test copy.
3. Add isolated desktop, tablet, and mobile CSS for the overlapping device wall
   and vertical responsive fallback.
4. Advance the operational section numbers after the new `/ 02` section.
5. Validate HTML references, image alt text, link targets, JavaScript syntax,
   repository tests, and unchanged agent interactions.
6. Capture and inspect desktop and mobile screenshots, correcting overlap,
   clipping, overflow, and spacing defects.
7. Commit and push to `main`, wait for the exact Pages build, and confirm the
   public page and all three images return HTTP 200.

## Completion Criteria

- The app reads clearly as Flutter mobile and adaptive.
- Every displayed screen is an unchanged committed golden-test output.
- The showcase stacks cleanly on mobile and has no horizontal page overflow.
- Existing install and agent controls continue to work.
- The exact release commit is live on GitHub Pages.
