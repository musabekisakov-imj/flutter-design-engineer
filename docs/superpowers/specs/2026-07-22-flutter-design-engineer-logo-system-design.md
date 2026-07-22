# Flutter Design Engineer Logo System

Date: 2026-07-22  
Status: Approved direction

## Purpose

Replace the generic letter `F` placeholder with an ownable, scalable identity mark that connects Flutter interface construction with AI-assisted quality work.

## Core Metaphor

The symbol combines two ideas:

- two offset Flutter-like planes represent adaptive interface construction;
- one small square represents the AI quality signal that completes the system.

The negative space between the planes suggests an `F` without drawing a literal letter. The mark must remain recognizable as geometry at favicon size and must not imitate the official Flutter trademark.

## Geometry

- Base canvas: square.
- Container radius: 27.5% of the canvas size.
- Upper plane: compact horizontal quadrilateral aligned to the upper-left optical center.
- Lower plane: longer diagonal quadrilateral that creates forward movement.
- Signal pixel: small square positioned at the upper-right of the lower plane.
- Minimum internal clear space: 12.5% of the canvas.
- No strokes, gradients, shadows, or internal text.

## Color Variants

Primary dark variant:

- container: Product Studio Ink `#121921`;
- upper plane: AI Blue `#6D8CFF`;
- lower plane: Flutter-adjacent cyan `#54C5F8`;
- signal pixel: Signal Lime `#D9FF67`.

Website dark-surface variant uses the same mark without a container when the surrounding surface already provides sufficient dark contrast.

Monochrome variant uses white geometry on Ink and is reserved for very small or single-color contexts.

## Wordmark

The text remains `Flutter Design Engineer` using the existing website sans-serif. The mark and wordmark are separate elements. The mark must never contain the initials or the full name.

## Applications

The same geometry must be used in:

- website header and footer;
- browser favicon;
- Product Studio Flutter fixture and regenerated golden screenshots;
- website hero and evidence screenshots through those goldens;
- README identity treatment where practical.

SVG is the source of truth for website uses. Flutter draws the same normalized geometry with `CustomPainter` so the mark remains sharp and does not depend on raster assets.

## Accessibility

- Website logo links retain the accessible name `Flutter Design Engineer home`.
- Decorative SVGs are hidden from assistive technology when adjacent wordmark text already names the product.
- The Flutter mark exposes one semantic label at standalone use and excludes its internal shapes.
- Color is not required to recognize the silhouette.

## Acceptance Criteria

- The mark is legible at 16, 30, 40, and 64 pixels.
- Header and footer use exactly the same SVG geometry.
- Flutter goldens use the same normalized construction.
- No plain `F` placeholder remains in public website or Product Studio screens.
- Favicon loads without browser-console errors.
- Website remains overflow-free at 390, 768, 1024, and 1440 pixels.
- Flutter analyzer, widget tests, golden tests, repository validation, and Pages deployment pass.
