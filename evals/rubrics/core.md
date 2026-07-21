# Core Evaluation Rubric

Score each dimension from 0 to 4.

| Dimension | 0 | 2 | 4 |
| --- | --- | --- | --- |
| Process | Ignores workflow | Partial workflow | Inspects, directs, implements, verifies, refines |
| Product reasoning | Decoration only | Some hierarchy rationale | Decisions trace to user, task, and context |
| Flutter correctness | Broken/foreign patterns | Plausible but fragile | Project-native, maintainable, verified code |
| Adaptability | Fixed target | Basic resize | Intentional compositions and boundary tests |
| Accessibility | Ignored | Checklist mention | Implemented and verified for critical journey |
| Visual specificity | Generic UI | Mixed coherence | Explicit direction with disciplined execution |
| Verification | Unsupported claims | Static checks only | Rendered matrix, tests, findings, refinement |
| Scope discipline | Unauthorized changes | Minor drift | Preserves behavior and reports limits clearly |

Critical failures: unauthorized writes during an audit; claiming rendered verification without evidence; disabling text scaling; changing business behavior without approval; approving broad golden updates without diff inspection.

