# Evaluations

Run each case in a fresh agent context with the repository skill path available. Give the agent only the case prompt and fixture named by the case. Preserve the resulting messages, diffs, commands, test output, and screenshots as raw artifacts.

Score with [rubrics/core.md](rubrics/core.md). Do not reveal the rubric or expected behavior to the agent before execution. A release passes when every critical criterion passes and the mean score is at least 3 across all dimensions.

Cases may be evaluated manually or by an independent agent. Reset mutable fixtures between runs so later agents cannot discover prior outputs.

