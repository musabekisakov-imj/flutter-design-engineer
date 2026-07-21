# Community launch copy

Use these drafts only after checking each community's current self-promotion rules.

## Flutter community / Reddit

**Title:** I open-sourced a design-engineering skill system for Flutter coding agents

I built Flutter Design Engineer because most agent design workflows are web-first and jump from a vague brief directly to widget code.

The idea is “same model, same prompt, different workflow”: the skills add product discovery, explicit states, adaptive implementation, accessibility, and rendered QA around the coding model. A reproducible benchmark protocol is included; model-specific results remain pending until controlled baseline and skill-guided runs are complete.

It is a set of seven self-contained skills covering product/UI audit, visual direction, semantic design systems, adaptive implementation, motion, accessibility, and screenshot-based visual QA. The repository includes eval rubrics, a safe installer, CI, and a real Connected Command Center fixture with deterministic compact, expanded, and recovery-state golden screenshots.

The project is new, so I am looking for honest feedback rather than claiming adoption. I would especially value reports from teams using Cupertino patterns, RTL/localization, foldables, desktop Flutter, Riverpod, or Bloc.

Repository: https://github.com/musabekisakov-imj/flutter-design-engineer

### Recommended Reddit technical deep dive

**Title:** I built a deterministic Flutter booking fixture to test whether AI design skills improve the workflow, not just the screenshot

I maintain an open-source set of seven Flutter design-engineering skills for coding agents. The earlier repository demo proved adaptive composition, but it did not prove a complete mobile transaction. I agreed with that criticism and added a second fixture.

The new example is a five-step customer booking journey: service, barber, real availability, review and details, then confirmation. It also includes loading, empty availability, recoverable failure, a slot becoming unavailable, inline validation, duplicate-submit prevention, a tablet recomposition, RTL structural checks, reduced motion, and a 200% text-scale golden.

The important part for me was the verification loop. The first golden pass exposed fallback-font blocks. A later pass exposed portrait assets that existed in the widget tree but were not painted in the golden renderer. Both defects were fixed before the screenshots were documented.

Implementation details:

- local immutable fixtures and a small `ChangeNotifier` controller;
- no routing, state-management, network, or animation package;
- semantic theme roles with bundled OFL/Roboto fonts;
- phone single-column and tablet decision-plus-summary layouts;
- eight inspected golden screenshots plus controller, widget, semantics, RTL, reduced-motion, and text-scale tests.

Limitations: it is a deterministic light-theme fixture, not a production booking backend. There is no payment, authentication, notification delivery, or integration test against a real API.

I would value concrete criticism on three points: does the booking hierarchy feel credible for a real consumer app, is the tablet recomposition useful, and which state or accessibility case is still missing?

Repository and Flutter evidence: https://github.com/musabekisakov-imj/flutter-design-engineer/tree/main/examples/barbershop-booking

### Flutter Community / Discord variant

I added a production-like Flutter booking case study to Flutter Design Engineer after realizing the previous dashboard fixture did not demonstrate a complete mobile workflow.

It now covers service → barber → availability → customer details → confirmation, plus retry, empty day, invalidated slot, validation, submission locking, phone/tablet adaptation, 200% text, RTL structure, reduced motion, and eight deterministic goldens.

The visual QA loop caught two real issues before publication: test-font fallback and local portraits that were present but not rendered. The README documents both the evidence and the limits. This remains a local fixture, not a backend-connected production app.

I would appreciate feedback on the booking hierarchy, the expanded composition, and missing accessibility or state cases:
https://github.com/musabekisakov-imj/flutter-design-engineer/tree/main/examples/barbershop-booking

## Threads / X

I open-sourced Flutter Design Engineer: seven modular skills that make coding agents inspect the product, define visual direction and states, implement adaptive/accessibile Flutter UI, then verify rendered screenshots before claiming polish.

Same model. Same prompt. Different workflow. The benchmark protocol is public; no model leaderboard claims without controlled evidence.

Includes evals, CI, installer, and a real adaptive Flutter Command Center connecting workspace, finance, travel, and AI actions. Feedback welcome:
https://github.com/musabekisakov-imj/flutter-design-engineer

## LinkedIn

Today I released Flutter Design Engineer, an open-source skill system for improving how coding agents design and implement Flutter interfaces.

The premise is “same model, same prompt, different workflow.” It is not a Claude-vs-Codex-vs-Grok leaderboard: the repository now includes a reproducible protocol that requires matched baseline and skill-guided runs before any model result can be published.

The central idea is simple: an agent should not jump from “make this screen premium” directly to widget code. It should inspect the product and repository, establish a coherent visual direction, enumerate states, implement within the existing architecture, verify accessibility and adaptive behavior, render representative screens, and refine material issues.

The repository contains seven self-contained skills, evaluation rubrics, deterministic validation, a safe installer, and a real multi-domain Flutter fixture with committed golden screenshots. The project is new and I am actively looking for rigorous feedback and contributors.

https://github.com/musabekisakov-imj/flutter-design-engineer
