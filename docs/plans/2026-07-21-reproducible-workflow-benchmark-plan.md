# Reproducible Workflow Benchmark Implementation Plan

## Objective

Clarify the Flutter-only adaptive showcase and establish a benchmark package that can support honest same-model baseline versus skill-guided comparisons.

## Tasks

1. Rewrite the README hero around `Same model. Same prompt. Different workflow.`
2. Relabel rendered outputs as Flutter Mobile and Flutter Tablet/Desktop.
3. Add a compact evidence table explaining what the workflow changes.
4. Create the Connected Command Center benchmark protocol, shared prompt, rubric, run manifests, and results template.
5. Add deterministic validation for benchmark completeness and unsupported claims.
6. Update launch copy to explain model-agnostic positioning.
7. Run repository checks, open a PR, verify CI, merge, and publish a documentation release.

## Evidence boundary

Do not publish a model result until both arms have raw artifacts and complete manifests. The initial implementation may publish the protocol as ready while model result rows remain explicitly pending.
