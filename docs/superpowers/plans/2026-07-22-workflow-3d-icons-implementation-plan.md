# Workflow 3D Icon System — Implementation Plan

## Goal

Produce, integrate, and verify seven optimized 3D workflow icons under the approved design contract without changing surrounding website behavior or copy.

## Tasks

### 1. Produce the coherent master set

- Generate one square master for Audit, Design, System, Build, Motion, Access, and Verify.
- Hold camera, lighting, materials, backdrop, object scale, chartreuse coverage, and negative space constant.
- Review the seven masters as a set and regenerate outliers before integration.
- Acceptance: every metaphor is recognizable at small size and the family reads as one product system.

### 2. Prepare web assets

- Create `docs/assets/workflow/`.
- Downscale and encode each approved master as a stable stage-named WebP.
- Confirm dimensions, format, visual integrity, and file-size limits.
- Acceptance: every file is at most 120 KB, with an 80 KB target, and has no visible background seam at intended size.

### 3. Integrate semantic markup and responsive layout

- Add decorative intrinsic-size images to the seven existing workflow list items in `docs/index.html`.
- Add focused styles in `docs/assets/install-guide.css` for desktop, intermediate, and mobile compositions.
- Add pointer-capable hover polish with transform-only animation and a reduced-motion/static fallback.
- Bump the stylesheet asset version so the deployed static page does not reuse stale CSS.
- Acceptance: source order and workflow copy remain unchanged; images have empty alt text; no layout shift or overflow is introduced.

### 4. Validate and visually inspect

- Run repository validation, Python tests, and relevant static checks.
- Serve the static site and capture desktop and mobile workflow screenshots.
- Inspect card rhythm, icon scale, edge blending, text collisions, reduced motion, and responsive borders.
- Apply one targeted refinement pass if the renders reveal a material issue.
- Acceptance: checks pass and screenshots provide evidence for both desktop and mobile layouts.

## Files

- `docs/index.html`
- `docs/assets/install-guide.css`
- `docs/assets/workflow/audit.webp`
- `docs/assets/workflow/design.webp`
- `docs/assets/workflow/system.webp`
- `docs/assets/workflow/build.webp`
- `docs/assets/workflow/motion.webp`
- `docs/assets/workflow/access.webp`
- `docs/assets/workflow/verify.webp`
- Desktop and mobile QA screenshots under `docs/superpowers/qa/`

## Verification Commands

- `python3 scripts/validate_repository.py`
- `python3 -m unittest discover -s tests`
- `git diff --check`
- Browser screenshot capture at approximately 1440 px and 390 px viewport widths
