# Evidence-Led Growth Redesign — Implementation Plan

## 1. Outcome-first hero

- Update the hero headline and supporting copy in `docs/index.html`.
- Preserve the install command as the primary control.
- Replace the source secondary action with a Star action linking to the repository.
- Preserve existing verified-results navigation and analytics conventions.

## 2. Proof rail

- Add a semantic three-item proof rail directly after the hero.
- Link the skills proof to `#skills`, source proof to GitHub, and golden QA proof to `#evidence`.
- Add placement-specific analytics attributes without introducing runtime API calls.
- Implement desktop, tablet, and stacked mobile layouts in `docs/assets/install-guide.css`.

## 3. Workflow continuity

- Refine workflow heading/copy to describe one connected chain.
- Add a compact final Evidence outcome to the workflow framing without creating an eighth skill.
- Preserve the seven existing workflow cards and their source assets.

## 4. Verifiable evidence captions

- Extend evidence screenshot figures with concise producer/state/proof metadata.
- Add explicit `Inspect output` links to committed GitHub golden files.
- Retain and clarify the Visual QA error-state evidence.
- Avoid invented performance, usage, or adoption claims.

## 5. Conversion sequence

- Add a compact Star CTA after meaningful evidence.
- Preserve Sponsor in the header and support/footer section.
- Keep all install CTAs and the lower install guide intact.
- Add placement-specific analytics for hero, proof rail, evidence, and support actions.

## 6. Motion and state feedback

- Introduce shared `--ease-out` and `--ease-in-out` tokens.
- Reduce scroll reveal to `360ms`, `translateY(10px)`.
- Reduce and consolidate hero screenshot entrance timing.
- Gate hover transforms behind fine-pointer hover capability.
- Add a stable copy-success icon/label transition without changing control dimensions.
- Add a short opacity/blur transition for skill-panel changes only if it can remain interruptible and layout-stable.
- Preserve color/opacity feedback under reduced motion while removing positional movement.

## 7. Validation contract

- Extend `scripts/validate_repository.py` for the new hero statement, proof rail, Star placements, evidence inspect links, and honest-metrics constraints.
- Update/add unit assertions only where the existing validator test pattern requires them.

## 8. Verification

- Run `git diff --check`.
- Run `python3 scripts/validate_repository.py`.
- Run `python3 -m unittest discover -s tests -v`.
- Serve `docs/` locally and inspect 1440×900, 1024×768, 768×1024, 390×844, and 320×700.
- Verify keyboard focus, menu behavior, skill tabs, copy success, reduced motion, hover/touch behavior, external links, console logs, and horizontal overflow.

## 9. Publication

- Commit only intentional files in the isolated worktree.
- Push `codex/evidence-led-hybrid` and open a ready PR.
- Wait for all checks, squash merge, wait for the matching Pages deployment, and verify the public HTML.
