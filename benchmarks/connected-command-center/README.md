# Connected Command Center Workflow Benchmark

This benchmark measures the effect of the Flutter Design Engineer workflow, not which language model is best.

## Controlled comparison

Each model completes two independent runs from the same starter commit:

1. **Baseline:** receive only [`shared-prompt.md`](shared-prompt.md).
2. **Skill-guided:** receive the same prompt plus the repository's seven installed skills.

Both runs must use the same model version, host, tools, turn or time budget, viewport matrix, and retry policy. A model row remains unpublished until both manifests are complete and the raw artifacts are committed or permanently linked.

## Reproduce

1. Create two clean worktrees from the declared starter commit.
2. Record the environment in each arm's `manifest.json` before starting.
3. Run the exact shared prompt in fresh sessions.
4. Preserve prompts, outputs, diffs, commands, test logs, interventions, and screenshots.
5. Score observable evidence with [`rubric.md`](rubric.md).
6. Run repository and Flutter validation.
7. Change both manifests to `complete` only when every required evidence path exists.
8. Add the factual row to [`results.md`](results.md).

## Current status

The protocol is ready. No Claude, Codex, or Grok result is currently published because a controlled pair of runs has not yet been completed. The existing showcase demonstrates the target workflow but is not retroactively presented as benchmark evidence.

## Integrity rules

- Do not hand-author or intentionally degrade a baseline.
- Do not retry only one arm unless the retry policy permits both arms the same opportunity.
- Do not hide failed analyzer, test, rendering, or accessibility results.
- Do not compare different model versions as if they were one controlled pair.
- Do not convert missing evidence into a zero score; mark it unverified.
