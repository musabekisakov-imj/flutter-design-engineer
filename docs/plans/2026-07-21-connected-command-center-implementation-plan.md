# Connected Command Center Implementation Plan

## Objective

Replace the booking fixture with a universal connected workspace, strengthen the seven skill workflows with cross-domain state and evidence requirements, regenerate real Flutter goldens, and publish the verified update.

## Workstream 1: Demo migration

1. Rename the example to `examples/connected-command-center`.
2. Replace booking models, screen composition, tests, and package metadata.
3. Implement populated, loading, error, and empty states with shared deterministic fixtures.
4. Build compact feed and expanded command-center grid from the same component set.
5. Add semantic labels, focusable actions, text-scaling resilience, and reduced-motion behavior.

## Workstream 2: Skill upgrade

1. Add a connected-product workflow reference covering cross-domain hierarchy, shared state, and adaptive information architecture.
2. Route the relevant design, implementation, accessibility, and visual-QA skills to that reference.
3. Replace booking-specific behavioral eval prompts with domain-neutral connected-product cases.
4. Keep every specialist self-contained and validate copied references.

## Workstream 3: Evidence and documentation

1. Regenerate compact and expanded Flutter goldens.
2. Build a README hero from actual rendered outputs.
3. Update README, contributing guidance, roadmap, launch copy, and active example links.
4. Preserve historical release notes and design records as immutable history.

## Workstream 4: Verification and publication

1. Run repository validation and Python tests.
2. Run Flutter formatting, analyzer, smoke tests, and golden tests.
3. Inspect every new rendered image.
4. Commit on a feature branch, push, open a pull request, verify CI, merge, and publish the next release.
5. Prepare platform-specific community posts; request confirmation immediately before posting to each external account.
