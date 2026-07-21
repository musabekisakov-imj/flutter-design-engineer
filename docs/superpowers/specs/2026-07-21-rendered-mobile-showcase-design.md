# Rendered Mobile Showcase Design

## Goal

Upgrade the interactive install guide with visible proof of the Flutter product
quality that the skill system expects. The section must immediately communicate
that Flutter Design Engineer is for mobile application work, while preserving
the repository's evidence standard: every displayed application screen is a
committed Flutter golden-test output, not an AI-generated concept image.

## Placement

Insert the showcase directly after the hero and before the Agent Command Center.
The visitor sees the product result first, then chooses how to install the
workflow that supports that quality bar.

## Chosen Direction

Use the approved **Cinematic Device Wall** composition:

- a compact mobile golden is the foreground focal point;
- an expanded tablet/desktop golden forms the supporting wide plane;
- the two screens overlap on wide layouts to create depth;
- the existing navy, coral, cool-gray, and green status language continues;
- decorative framing stays subordinate to the rendered Flutter UI.

The headline is **One Flutter product. Every useful size.** Supporting copy must
state that both images come from one adaptive Flutter codebase.

## Evidence Content

Use these existing, reviewed assets as the source of truth:

- `examples/connected-command-center/demo/goldens/compact-command-center.png`;
- `examples/connected-command-center/demo/goldens/expanded-command-center.png`;
- `examples/connected-command-center/demo/goldens/error-command-center.png`.

Copy the three files into `docs/assets/showcase/` so the Pages artifact is
self-contained. Do not transform, retouch, regenerate, or place fabricated UI
inside the application screenshots. CSS may provide neutral device frames,
shadows, labels, and background surfaces around them.

## Section Structure

### Cinematic wall

The primary block contains:

- operational label `RENDERED EVIDENCE / 02`;
- headline and concise adaptive-product explanation;
- mobile frame in the visual foreground;
- expanded frame behind and to the right;
- visible `Golden test verified` status with text and icon;
- links to the demo source and golden-test file.

Section numbering after this insertion advances by one so the page maintains a
single sequential operational narrative.

### Recoverable error state

Below the main wall, add one compact evidence card containing the error-state
golden, the title **Recovery is part of the design**, and copy explaining that
the same fixture includes a recoverable connected-source failure rather than
showing only the happy path.

This is supporting proof, not a third competing hero image.

## Responsive Behavior

### Desktop

Use a bounded composition with the mobile frame overlapping the left edge of
the expanded frame. Preserve enough visible application content that both
screens are recognizable without opening them.

### Tablet

Reduce overlap and frame depth while retaining a clear mobile-first hierarchy.

### Mobile

Remove overlap. Present the compact golden first, the expanded golden second,
and the error card third in one vertical flow. Images use their natural aspect
ratios and never force horizontal page overflow.

## Interaction

The section is readable without JavaScript. Each primary image is also a link to
the original full-resolution repository asset. Hover may add a subtle frame
lift, but no information or action depends on hover. Motion is disabled under
`prefers-reduced-motion: reduce`.

## Accessibility

- Alt text identifies the compact, expanded, and recoverable error-state Flutter
  screens without repeating nearby captions.
- The verification status includes readable text and is not color-only.
- Links have descriptive accessible names.
- Source order matches the mobile reading order.
- Image frames preserve contrast against the page background.
- No text is embedded into a new generated image.

## Honesty and Claims

The section must say that the screens are committed Flutter golden-test outputs.
It must not say or imply that Claude, Codex, Gemini, Cursor, the skills, or an
image model autonomously generated the application. It may describe the fixture
as the repository's demonstrated quality standard.

Higgsfield and the available image-generation tool are intentionally excluded
because generated mobile screens would weaken the evidence claim. They remain
appropriate for non-evidentiary decorative artwork in a separate future scope.

## Technical Changes

- Extend `docs/index.html` with one semantic showcase section.
- Extend `docs/assets/install-guide.css` with isolated showcase framing and
  responsive rules.
- Add the three copied golden files under `docs/assets/showcase/`.
- Do not add JavaScript, dependencies, a build step, or analytics.
- Preserve the existing install, tabs, copy controls, and navigation behavior.

## Failure Handling

- If an image cannot load, alt text and the evidence caption preserve meaning.
- If CSS is unavailable, source order still presents compact, expanded, then
  error evidence with repository links.
- If Pages deployment fails, the existing README golden images and install
  instructions remain available.

## Verification

Before publication:

1. Confirm all three copied files match their source files byte-for-byte.
2. Run repository validation and unit tests.
3. Run JavaScript syntax validation and `git diff --check`.
4. Validate image paths, alt attributes, unique IDs, heading order, and links.
5. Capture and inspect desktop and mobile screenshots for clipping, unreadable
   overlap, excessive empty space, and horizontal overflow.
6. Check the no-JavaScript and reduced-motion rendering.
7. Confirm the existing agent tabs and copy controls still work.
8. Push to `main`, wait for the exact commit to reach Pages `built`, and confirm
   the public guide returns HTTP 200 with all three showcase images.

## Scope Boundaries

This change adds rendered application evidence to the existing GitHub Pages
guide. It does not change the Flutter fixture, regenerate goldens, alter skill
behavior, introduce benchmark results, or create a new fictional mobile app.
