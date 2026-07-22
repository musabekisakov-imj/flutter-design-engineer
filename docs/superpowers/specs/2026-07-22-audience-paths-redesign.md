# Audience paths redesign

## Goal

Make the audience section feel like a useful decision point rather than a passive responsibility matrix.

## Approved design

- Replace the abstract headline with `Built for every role that ships Flutter.`
- Add one short instruction that explains why the user should choose a path.
- Use an asymmetric 7/5 then 5/7 grid on desktop and a single column on mobile.
- Give every path a concrete outcome, supporting sentence, and directional arrow.
- Use restrained monochrome numbering; reserve lime for the outcome and active interaction.
- Add clear hover, pressed, and keyboard-focus feedback without adding JavaScript.
- Keep the existing destination anchors and analytics attributes unchanged.

## Verification

Check link destinations, readable hierarchy, hover and focus states, 1440/768/390 px layouts, zero horizontal overflow, and repository validation.
