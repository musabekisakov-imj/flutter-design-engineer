# Reproducible Workflow Benchmark Design

## Goal

Make the value of Flutter Design Engineer immediately understandable without implying that the repository is a web dashboard or claiming that one LLM is superior. The README will compare a one-shot baseline with the skill-guided workflow using controlled, reproducible evidence.

## Core Claim

Use the headline:

> Same model. Same prompt. Different workflow.

The benchmark evaluates workflow quality, not model ranking. Every published comparison must use the same model, starting repository, user prompt, tool access, time or turn budget, and rendering environment for both runs.

## Hero Structure

The README hero presents:

1. a concise statement that the project is a model-agnostic Flutter design-engineering workflow;
2. a side-by-side baseline and skill-guided screenshot;
3. an evidence row comparing hierarchy, adaptive coverage, state coverage, accessibility checks, and rendered QA;
4. clearly labelled Flutter Mobile and Flutter Tablet/Desktop outputs;
5. the caption `One Flutter codebase · adaptive across screen sizes`.

Avoid the labels `web app`, `web dashboard`, or any language implying separate implementations.

## Benchmark Package

Add `benchmarks/connected-command-center/` containing:

- `README.md`: method, environment, limitations, and reproduction steps;
- `shared-prompt.md`: the exact prompt used by both runs;
- `rubric.md`: observable scoring criteria;
- `baseline/`: raw output summary, test evidence, and screenshots;
- `skill-guided/`: raw output summary, test evidence, and screenshots;
- `results.md`: factual comparison with no invented metrics.

Raw prompts, committed code references, commands, screenshots, and failures are evidence. Subjective visual scores must include their rubric and reviewer status.

## First Benchmark

The initial public benchmark uses one available agent for both arms. The existing Connected Command Center is the skill-guided arm only after its run provenance is documented. If equivalent baseline provenance cannot be established, generate both arms again from the same minimal Flutter starter rather than presenting the current demo as controlled evidence.

Do not label a hand-authored mockup as an LLM baseline. Do not infer how Claude, Codex, or Grok would perform without running the controlled experiment.

## Multi-Model Expansion

Claude Code, Codex, and Grok may be added as independent benchmark rows only when each model completes both arms under a documented environment. Model names and trademarks appear descriptively, without logos in the primary hero and without endorsement claims.

Report model version/date, host, tools, limits, retries, human interventions, test results, and unavailable capabilities. Never combine results from different model versions into one comparison.

## Verification

Before publication:

1. validate all benchmark links and required evidence;
2. confirm both arms use the declared controlled inputs;
3. run Flutter analyzer and tests for committed code outputs;
4. inspect all screenshots;
5. scan README and launch posts for unsupported superiority or autonomy claims;
6. pass repository validation and CI.

## Launch Positioning

External posts lead with the workflow comparison and link directly to the benchmark method. They invite reproduction and critique. They do not claim that the project makes every model better, guarantees premium UI, or establishes a leaderboard.
