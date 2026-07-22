# Plan

## Overview
Evolve the existing static GitHub Pages site through four reversible releases: improve the installation funnel, publish a controlled Codex benchmark, add only verifiable social proof, and permit later expansion only when aggregate evidence supports it. Preserve the current identity, logo geometry, Product Studio Flutter goldens, progressive enhancement, and repository quality gates.

## Scope
- In:
  - Conversion-focused recomposition of `docs/index.html`.
  - Cookie-free, provider-isolated aggregate analytics.
  - Codex-only baseline-versus-skill-guided benchmark execution and publication.
  - Append-only benchmark artifacts, JSON Schemas, blinded scoring, consistency validation, and CI-generated static pages.
  - Build-time GitHub proof, trademark attribution, and consented testimonials with omission fallbacks.
  - Browser, accessibility, rendered visual QA, Flutter evidence, installation, deployment, and smoke-test gates.
  - Evidence-gated selection of at most one later static surface.
- Out:
  - Framework migration, runtime backend, accounts, billing, email capture, or client-side benchmark calculation.
  - Initial benchmarks for Claude Code, Gemini CLI, Cursor, Grok, or other agents.
  - New branding, altered logo geometry, generated marketing mockups, or replacement Product Studio screenshots.
  - Fabricated results, testimonials, partnerships, compatibility, adoption, or absolute conversion targets.
  - Skill behavior changes unless approved under a separate product contract.

## Phases

### Phase 1: Conversion-Focused Static Homepage

**Goal**: Improve installation and evidence discovery while retaining the static architecture, existing identity, seven-skill workflow, four installation routes, and genuine Flutter outputs.

#### Task 1.1: Lock identity and rendered-evidence invariants
- Location: `docs/assets/brand/mark.svg`, `docs/assets/product-studio/`, `examples/product-studio/demo/goldens/`, `examples/product-studio/demo/lib/product_studio_widgets.dart`, `tests/test_site_contract.py`, `scripts/validate_repository.py`
- Description: Add deterministic safeguards before changing homepage composition.
- Estimated Tokens: 3,500
- Dependencies: None
- Steps:
  - Record the approved SVG mark as the website identity invariant without changing its geometry.
  - Validate that the six phone workflow images, error image, and tablet image under `docs/assets/product-studio/` are byte-identical to their source goldens.
  - Add repository checks for required intrinsic image dimensions, source links, alt text, favicon availability, and canonical install commands.
  - Keep the Flutter `StudioMarkPainter` implementation and Product Studio goldens unchanged unless a separately approved identity update regenerates and inspects them together.
- Acceptance Criteria:
  - Validation fails when the website mark is replaced or a published Product Studio image diverges from its golden.
  - All eight published images resolve to committed Flutter evidence.
  - No plain `F`, generated mockup, or unsupported evidence claim is introduced.

#### Task 1.2: Recompose the homepage funnel
- Location: `docs/index.html`, `docs/assets/install-guide.css`
- Description: Implement the approved decision sequence as an evolution of the current dark, cyan, lime, and coral presentation.
- Estimated Tokens: 7,000
- Dependencies: Task 1.1
- Steps:
  - Reorder content into hero, audience paths, workflow and skills, rendered evidence, benchmark status, open-source trust, and installer.
  - Retain the two real Product Studio hero renders and make `Install all 7 skills` the primary command-copy action.
  - Replace the current hero source link with `See verified results`; place qualified GitHub links after evidence.
  - Replace the decorative facts strip with four concise audience paths for Flutter developers, technical leads, product teams, and AI-platform builders.
  - Preserve the seven skill panels, six-screen workflow, recoverable error proof, adaptive tablet proof, technical evidence, and four direct installation routes.
  - Add a static benchmark section describing the ready protocol and pending Codex measurement without scores or conclusions.
  - Add direct source, validation, CI, benchmark-method, and contribution links; render no GitHub metric or testimonial placeholder.
  - Normalize color roles so lime marks primary conversion and verified success, cyan marks identity/information, and coral is restricted to warnings or editorial attention.
- Acceptance Criteria:
  - The first viewport contains the product promise, selectable install command, copy enhancement, verified-results link, and real Flutter proof.
  - All primary content, commands, evidence links, benchmark status, and installation routes remain readable without JavaScript.
  - The page contains no unsupported benchmark, adoption, endorsement, compatibility, or partnership claim.
  - The mark and Product Studio evidence remain unchanged.

#### Task 1.3: Isolate progressive interaction and analytics
- Location: `docs/assets/install-guide.js`, `docs/assets/analytics.js`, `docs/assets/analytics-plausible.js`, `docs/index.html`
- Description: Keep interaction logic independent from a cookie-free analytics adapter that safely no-ops without valid provider configuration.
- Estimated Tokens: 5,500
- Dependencies: Task 1.2
- Steps:
  - Keep `install-guide.js` responsible for menus, tabs, copy behavior, manual-copy fallback, live-region feedback, and optional reveals.
  - Scope collapsed navigation and inactive-panel hiding beneath the `.js` class so no-JavaScript visitors see navigation and every installation path.
  - Add a provider-independent `track(event, properties)` adapter with exception isolation and an allowlist.
  - Add a Plausible binding that remains disabled when no verified site-domain configuration exists; provider load or dispatch failure must not escape to interaction code.
  - Instrument only `install_copy`, `verified_results_open`, `benchmark_artifact_open`, `github_open`, `audience_path_select`, and `install_success_help_open`.
  - Permit bounded route, audience, and placement values only; exclude command text, free-form text, email addresses, persistent identifiers, and fingerprinting data.
  - Emit `install_copy` only after a successful clipboard operation; announce manual selection when copying fails.
- Acceptance Criteria:
  - Copy, links, tabs, and menus work when analytics is absent, blocked, misconfigured, or throws.
  - Clipboard rejection leaves the command selectable and announces an accessible fallback.
  - No-JavaScript mode exposes primary navigation and all installation commands.
  - Automated tests prove that unapproved events and properties never reach the provider.

#### Task 1.4: Establish website and release gates
- Location: `package.json`, `package-lock.json`, `playwright.config.js`, `tests/site/homepage.spec.js`, `tests/site/homepage.visual.spec.js`, `tests/site/snapshots/`, `scripts/smoke_site.py`, `.github/workflows/validate.yml`, `.github/pull_request_template.md`
- Description: Add repeatable browser, accessibility, evidence-integrity, and deployment checks.
- Estimated Tokens: 8,000
- Dependencies: Tasks 1.1–1.3
- Steps:
  - Add Playwright and Axe coverage for headings, landmarks, keyboard tabs, menu dismissal, copy success/failure, no-JavaScript content, analytics no-op behavior, links, and console errors.
  - Test 200% zoom, reduced motion, visible focus, and document-level overflow at 390, 768, 1024, 1440, and wide-desktop widths.
  - Capture approved screenshots for the hero, audience paths, evidence, benchmark status, and installer after human inspection.
  - Preserve the Connected Command Center CI job and add Product Studio analyzer, widget, accessibility, and supported-platform golden checks.
  - Verify the cross-agent command and four direct installation routes in clean temporary destinations.
  - Add a smoke script for the deployed HTML, favicon, CSS, JavaScript, Product Studio assets, install command, evidence anchor, benchmark status, and GitHub link.
  - Capture pre-change Lighthouse performance, accessibility, and SEO results and reject unexplained regressions rather than lowering gates.
- Acceptance Criteria:
  - Repository validation, Python tests, browser tests, accessibility checks, and both Flutter fixture jobs pass in CI.
  - Product Studio goldens remain unchanged and are visually inspected on the pinned rendering platform.
  - Every target width passes overflow, zoom, keyboard, reduced-motion, and screenshot review.
  - The independently deployed Phase 1 site passes the production smoke test.

### Phase 2: Controlled Codex Benchmark

**Goal**: Produce and statically publish one auditable Codex baseline-versus-skill-guided pair under equal declared conditions, with no browser-side calculation or invented findings.

#### Task 2.1: Define the immutable run contract
- Location: `benchmarks/connected-command-center/README.md`, `benchmarks/connected-command-center/RUNBOOK.md`, `benchmarks/connected-command-center/shared-prompt.md`, `benchmarks/connected-command-center/rubric.md`, `benchmarks/connected-command-center/starter/`, `benchmarks/connected-command-center/runs/README.md`
- Description: Evolve the current pending protocol into a Codex-only, append-only run package.
- Estimated Tokens: 7,000
- Dependencies: Phase 1 release
- Steps:
  - Freeze a minimal Flutter starter containing deterministic models and callbacks but no completed Command Center interface.
  - Document preparation of two isolated worktrees from the same starter commit.
  - Prevent the baseline arm from loading Flutter Design Engineer skills; give the guided arm only the declared published skill revision.
  - Freeze the prompt, rubric, starter, and skill revision with SHA-256 digests.
  - Define each pair under `benchmarks/connected-command-center/runs/{run_id}/` with `manifest.json`, `baseline/`, `skill-guided/`, `scoring/`, `redactions.json`, and `summary.json`.
  - Require per-arm `source/`, `screenshots/`, `checks/`, `logs/`, `prompts/`, and `manifest.json`.
  - Record Codex CLI/model identifiers, versions, UTC dates, starter commit, environment class, Flutter/Dart versions, tools, limits, retry policy, execution order, interventions, and unavoidable differences.
  - Keep the existing pending manifests as non-publishable historical protocol fixtures; only `runs/` is publication input.
  - Define finalized `complete` and `incomplete` run directories as immutable; corrections use a new run ID and `supersedes` reference.
- Acceptance Criteria:
  - A reviewer can reconstruct both starting environments and identify skill availability as the sole intended arm difference.
  - The run layout accounts for source, logs, checks, identical states and viewports, scoring, redactions, and static summaries.
  - Existing showcase screenshots are not reused as controlled evidence.
  - Public protocol text describes Codex only and makes no model-ranking claim.

#### Task 2.2: Add schemas and semantic validation
- Location: `benchmarks/connected-command-center/schemas/pair-manifest.schema.json`, `benchmarks/connected-command-center/schemas/arm-manifest.schema.json`, `benchmarks/connected-command-center/schemas/check-result.schema.json`, `benchmarks/connected-command-center/schemas/screenshot-manifest.schema.json`, `benchmarks/connected-command-center/schemas/score.schema.json`, `benchmarks/connected-command-center/schemas/summary.schema.json`, `scripts/validate_benchmarks.py`, `scripts/validate_repository.py`, `tests/test_benchmark_validation.py`, `tests/fixtures/benchmarks/`, `package.json`
- Description: Reject malformed, unequal, incomplete, unsafe, or selectively reported benchmark packages.
- Estimated Tokens: 10,000
- Dependencies: Task 2.1
- Steps:
  - Define strict, versioned JSON Schemas with required fields, enums, score ranges, digest formats, relative-path rules, and controlled additional properties.
  - Keep Python validation standard-library-only for artifact and semantic checks; use a pinned development-time JSON Schema validator in CI for formal schema evaluation.
  - Validate unique run IDs, pair/arm agreement, prompt and rubric hashes, equal conditions, artifact existence and hashes, and screenshot state/viewport parity.
  - Represent analyzer, test, accessibility, and golden checks as `pass`, `fail`, or `unavailable`; require a reason for unavailable evidence.
  - Require incomplete reasons and forbid comparative numerical conclusions for pending, invalid, or incomplete pairs.
  - Reject absolute paths, traversal, escaping symlinks, unsafe URLs, raw renderer HTML, and likely secrets.
  - Treat source, logs, scorer notes, and model output as untrusted data that CI stores but never executes.
  - Add positive and negative fixtures for unequal conditions, missing evidence, invalid scores, stale hashes, unsafe paths, incomplete runs, and malicious text.
- Acceptance Criteria:
  - Formal schema and semantic validation pass a complete reference fixture and fail every invalid fixture deterministically.
  - Missing evidence is never converted to success or silently omitted.
  - Renderer-consumed fields cannot inject markup or escape their run directory.
  - A schema-invalid run cannot enter a deployment artifact.

#### Task 2.3: Enforce append-only history
- Location: `scripts/check_benchmark_append_only.py`, `tests/test_benchmark_append_only.py`, `.github/workflows/validate.yml`
- Description: Prevent modification, deletion, rename, or replacement of previously committed run artifacts.
- Estimated Tokens: 3,500
- Dependencies: Task 2.2
- Steps:
  - Compare pull requests against their merge base and main-branch pushes against the previous commit.
  - Reject deleted, modified, or renamed paths under existing `benchmarks/connected-command-center/runs/{run_id}/` directories.
  - Allow only newly added run IDs; reject run-ID collisions and duplicate summaries.
  - Require corrections to create a new immutable run with a machine-readable `supersedes` relationship.
  - Fetch sufficient Git history in CI for deterministic comparisons.
- Acceptance Criteria:
  - Tests prove that addition succeeds while edit, deletion, rename, and collision fail.
  - Previously published raw evidence cannot be silently rewritten.
  - Superseded runs remain inspectable and clearly identified.

#### Task 2.4: Execute and blindly score the Codex pair
- Location: `scripts/prepare_benchmark_run.py`, `scripts/blind_benchmark.py`, `benchmarks/connected-command-center/runs/{run_id}/`
- Description: Run the actual controlled sessions, preserve failures, and score observable output without exposing arm identity.
- Estimated Tokens: 12,000
- Dependencies: Tasks 2.1–2.3
- Steps:
  - Create both manifests before execution and randomize the recorded arm order.
  - Run fresh Codex sessions with the same prompt, model/CLI version, host class, tools, limits, retry policy, Flutter environment, and viewport matrix.
  - Capture prompts, outputs, commands, source snapshots, diffs, interventions, test logs, accessibility checks, goldens, and identical screenshot states.
  - Mark timed-out, failed, or partial pairs `incomplete`; do not retry only one arm outside the declared policy.
  - Scan for secrets and personal data; preserve a redaction ledger without changing outcome evidence.
  - Generate neutral A/B packets that remove arm paths and explicit skill identifiers.
  - Seal scorer submissions and cited artifact paths before revealing the mapping.
  - Store rubric scores, `unverified` entries, scorer notes, reveal mapping, and a bounded `summary.json`.
- Acceptance Criteria:
  - Equal declared conditions are demonstrated for both arms except skill availability.
  - Every score cites an artifact or is `unverified`.
  - The blinded packets, sealed scores, notes, reveal map, failures, interventions, and redactions are inspectable.
  - At least one complete pair is required for Phase 2 acceptance; incomplete attempts remain honest artifacts but do not satisfy the release goal.
  - No conclusion extends beyond the recorded Codex configuration and task.

#### Task 2.5: Generate and deploy static benchmark output
- Location: `scripts/build_site.py`, `docs/index.html`, `docs/benchmark/index.template.html`, `docs/assets/install-guide.css`, `build/site/`, `tests/test_site_rendering.py`, `tests/site/benchmark.spec.js`, `.github/workflows/pages.yml`, `.github/workflows/validate.yml`
- Description: Validate committed summaries and render finished static HTML before GitHub Pages deployment.
- Estimated Tokens: 9,000
- Dependencies: Tasks 2.2–2.4
- Steps:
  - Add inert render boundaries for the homepage benchmark summary and a detailed benchmark page.
  - Make `build_site.py` validate first, copy `docs/` into `build/site/`, HTML-escape all data, and render the latest valid complete run.
  - Keep Phase 1’s pending status when no valid complete run exists; represent valid partial runs only as `Incomplete`.
  - Link conclusions to the manifest, prompt, rubric, source snapshots, screenshots, checks, scores, and notes.
  - Add an Actions-based Pages workflow that builds, validates, browser-tests, uploads, deploys, and smoke-tests the generated artifact.
  - Stop deployment on benchmark validation failure so the last valid site remains live.
  - Confirm the browser receives complete HTML and never fetches benchmark data or calculates scores at runtime.
- Acceptance Criteria:
  - Repeated builds from the same commit produce equivalent static output.
  - JavaScript-disabled browsing exposes benchmark status, bounded findings, and artifact links.
  - Pending, incomplete, complete, and malicious fixtures render according to contract.
  - No numerical comparison appears for missing, invalid, or incomplete data.
  - The generated Pages artifact passes all Phase 1 gates and the post-deploy smoke test.

### Phase 3: Authentic Social Proof

**Goal**: Add verifiable GitHub signals and consented testimonials without runtime dependencies, zero placeholders, or implied endorsements.

#### Task 3.1: Audit attribution and compatibility language
- Location: `docs/assets/agents/`, `docs/ATTRIBUTIONS.md`, `docs/index.html`, `tests/test_site_contract.py`
- Description: Verify every third-party mark and keep descriptive compatibility distinct from endorsement.
- Estimated Tokens: 3,000
- Dependencies: Phase 2 release
- Steps:
  - Record source, owner, permitted use, and retrieval date for each displayed agent logo.
  - Use `Works with` or installation-route language and add a concise non-endorsement statement.
  - Remove any logo whose source or permission cannot be verified; retain an accessible text-labelled route.
  - Keep `docs/assets/brand/mark.svg` visually and semantically distinct from third-party marks.
- Acceptance Criteria:
  - Every displayed third-party image has documented provenance and usage basis.
  - Text-only fallback leaves every installation route understandable.
  - No wording implies partnership with OpenAI, Anthropic, Google, Cursor, Flutter, or Dart.

#### Task 3.2: Add resilient build-time GitHub proof
- Location: `scripts/fetch_github_proof.py`, `scripts/build_site.py`, `docs/index.html`, `docs/assets/install-guide.css`, `tests/test_github_proof.py`, `tests/fixtures/github-proof/`, `.github/workflows/pages.yml`
- Description: Render only verified repository facts into static HTML and omit unavailable values independently.
- Estimated Tokens: 6,500
- Dependencies: Task 3.1
- Steps:
  - Fetch Stars, Forks, contributors, releases, and CI status with read-only build credentials.
  - Validate repository identity, response types, source links, retrieval time, and freshness.
  - Render available values with direct GitHub verification links and build-time freshness context.
  - Treat timeouts, rate limits, malformed responses, stale data, and missing fields as unavailable.
  - Omit affected values rather than showing zero or stale cached claims; retain repository, release, contributor, and Actions links.
  - Escape all network-derived values before rendering.
- Acceptance Criteria:
  - Every displayed value links to an appropriate GitHub source.
  - Partial or unavailable responses produce no zero placeholder, empty card, broken layout, or failed deployment.
  - GitHub API failure cannot remove installation, evidence, benchmark, or repository links.
  - No browser-side GitHub request is required.

#### Task 3.3: Add consent-gated testimonials
- Location: `docs/data/testimonials.json`, `docs/data/testimonials.schema.json`, `docs/benchmark/index.template.html`, `docs/index.html`, `scripts/build_site.py`, `tests/test_testimonials.py`, `tests/fixtures/testimonials/`, `CONTRIBUTING.md`
- Description: Support authentic attributed testimonials while rendering nothing when none qualify.
- Estimated Tokens: 5,000
- Dependencies: Task 3.2
- Steps:
  - Require exact quote, displayed identity, source URL, consent date, and opaque consent-record reference; make role or organization optional.
  - Keep private consent evidence outside the public repository.
  - Validate source URLs, consent fields, duplicates, attribution, revocation state, and safe display length.
  - Render the entire section only when at least one valid consented record exists.
  - Document correction and revocation procedures; testimonial data remains removable because consent overrides historical display.
  - Add contribution guidance for reproducible benchmark runs and examples without promising acceptance or adoption.
- Acceptance Criteria:
  - With no verified testimonial data, no testimonial heading, container, or placeholder appears.
  - A valid fixture renders the exact quote, identity, attribution, and source link.
  - Missing consent, invalid attribution, unsafe content, or revoked consent prevents rendering.
  - Testimonial removal does not mutate benchmark history.

#### Task 3.4: Release social proof independently
- Location: `tests/site/social-proof.spec.js`, `tests/site/homepage.visual.spec.js`, `.github/workflows/pages.yml`, `scripts/smoke_site.py`
- Description: Validate complete, partial, and unavailable proof states before deployment.
- Estimated Tokens: 2,500
- Dependencies: Tasks 3.1–3.3
- Steps:
  - Test complete GitHub data, partial data, API failure, no testimonials, valid testimonials, and revoked testimonials.
  - Inspect responsive wrapping, accessible names, focus behavior, 200% zoom, no-JavaScript output, and visual snapshots.
  - Deploy and compare displayed GitHub facts against their linked sources.
- Acceptance Criteria:
  - Production contains no unsupported metric, empty proof block, unverifiable testimonial, or endorsement language.
  - All prior conversion and evidence gates remain green.
  - Attribution links and the post-deploy smoke test pass.

### Phase 4: Evidence-Led Expansion

**Goal**: Use privacy-safe aggregate evidence and public demand to decide whether one additional static surface is justified; make no expansion when evidence is insufficient.

#### Task 4.1: Produce a privacy-safe measurement report
- Location: `analytics/aggregate-export.schema.json`, `scripts/summarize_analytics.py`, `tests/test_analytics_summary.py`, `docs/decisions/website-expansion-decision.md`
- Description: Compare the first complete analytics week with the following 30 days without storing visitor-level data or inventing a target.
- Estimated Tokens: 4,000
- Dependencies: Phase 1 analytics operating correctly; Phases 2–3 deployment dates recorded; complete observation windows
- Steps:
  - Accept only aggregate visits and allowlisted event counts by date, route, audience, and placement.
  - Reject IP addresses, user IDs, persistent identifiers, command text, free-form properties, and other visitor-level fields.
  - Calculate `install_copy / unique visits` and report verified-result, benchmark-artifact, qualified GitHub, audience-path, and install-help activity with denominators.
  - Record deployment dates, provider outages, bot filtering, analytics blocking, and other confounders.
  - Distinguish command-copy intent from successful installation and GitHub visits from Stars or adoption.
  - Correlate aggregate signals with public issues and contribution requests without claiming causality.
- Acceptance Criteria:
  - The report is reproducible from a schema-valid aggregate export.
  - It contains no personal data, fabricated value, installation-success claim, or absolute target.
  - Insufficient traffic or unavailable analytics yields a documented no-decision state.

#### Task 4.2: Apply a bounded expansion decision
- Location: `docs/decisions/website-expansion-decision.md`, conditionally `docs/guides/index.html`, `docs/gallery/index.html`, `docs/changelog/index.html`, `docs/skills/index.html`, or an extension under `docs/benchmark/`
- Description: Select at most one static surface that addresses an observed user need.
- Estimated Tokens: 5,000
- Dependencies: Task 4.1
- Steps:
  - Rank candidate surfaces using secondary-conversion activity and repeated public requests.
  - Require the selected surface to solve a documented comprehension or navigation problem that the homepage cannot address cleanly.
  - Record evidence, alternatives, limitations, decision, and rollback boundary before implementation.
  - Build only the selected static HTML/CSS/progressive-JavaScript surface, reusing the existing identity, analytics adapter, and evidence rules.
  - Preserve install-copy as the primary funnel action and avoid framework, backend, account, or speculative platform work.
  - If evidence does not clearly select one surface, publish the no-expansion decision and change no product code.
- Acceptance Criteria:
  - At most one new surface is released.
  - The decision cites actual aggregate and qualitative evidence without an invented threshold.
  - A no-go decision is valid completion when evidence is insufficient or conflicting.
  - Any selected page remains fully usable without JavaScript and introduces no unsupported claim.

#### Task 4.3: Validate the expansion or no-go release
- Location: `tests/site/`, `scripts/smoke_site.py`, `.github/workflows/validate.yml`, `.github/workflows/pages.yml`
- Description: Apply every existing gate to the conditional release.
- Estimated Tokens: 2,500
- Dependencies: Task 4.2
- Steps:
  - Extend link, accessibility, snapshot, no-JavaScript, analytics allowlist, reduced-motion, zoom, and breakpoint tests only for the selected surface.
  - Re-run repository, Flutter evidence, benchmark, social-proof, Pages-build, and production smoke checks.
  - Confirm event names and meanings remain comparable with the baseline period.
- Acceptance Criteria:
  - All previous phase gates remain green.
  - The homepage install action, verified evidence, benchmark history, and source links remain intact.
  - The expansion can be reverted without removing analytics reports or immutable benchmark evidence.

## Testing Strategy

| Area | Automated tests | Rendered/manual verification | Release gate |
| --- | --- | --- | --- |
| Repository | `python3 scripts/validate_repository.py`; `python3 -m unittest discover -s tests -v`; `git diff --check` | Review changed contract links and claims | Every phase |
| Static site | Playwright semantic, interaction, link, console, and no-JavaScript tests | Inspect 390, 768, 1024, 1440, and wide desktop | Every phase |
| Accessibility | Axe, headings, landmarks, keyboard order, zoom, and overflow assertions | Visible focus, screen-reader labels, 200% text, localization-safe wrapping | Every phase |
| Motion | Reduced-motion emulation | Confirm nonessential movement is disabled and content is never concealed | Every phase |
| Visual regression | Pinned hero, evidence, benchmark, proof, and installer snapshots | Human comparison with approved contracts | Every phase |
| Product Studio | `flutter analyze`; widget/accessibility tests; supported-platform goldens | Inspect six phones, error state, and tablet golden | Every phase |
| Connected Command Center | Existing analyzer and non-golden tests | Inspect only when its fixture or evidence changes | Every phase |
| Installation | Installer unit tests and isolated clean-destination checks | Confirm displayed commands match executed commands | Phase 1 and command changes |
| Analytics | Allowlist, provider failure, missing config, payload rejection, and clipboard tests | Inspect deployed requests for cookie-free aggregate fields only | Phases 1 and 4 |
| Benchmark | JSON Schema, equality, artifact hash, path safety, append-only, blinding, scoring, and rendering tests | Inspect screenshots, failures, scorer citations, and bounded claims | Phase 2 onward |
| Social proof | Complete, partial, stale, unavailable, absent, valid, and revoked fixtures | Verify production facts, sources, attribution, and omission states | Phase 3 onward |
| Lighthouse | Performance, accessibility, and SEO checks against preview output | Investigate regressions without weakening thresholds | Every phase |
| Deployment | Build `build/site/`, validate generated HTML, and run local smoke checks | Post-deploy navigation, copy, assets, benchmark, GitHub links, and console inspection | Every phase |

## Risks
- Hosted Codex behavior or tool availability may drift between arms. Mitigation: run arms close together in randomized order, record exact versions and timestamps, disclose differences, and bound conclusions to the recorded pair.
- Blinding may be imperfect because output structure can reveal the guided arm. Mitigation: remove explicit identifiers, use sealed independent scoring, disclose the limitation, and never call the process double-blind.
- Append-only storage makes corrections cumbersome. Mitigation: use immutable superseding runs and keep the renderer explicit about current versus superseded evidence.
- Analytics measures copy intent, not installation or continued use. Mitigation: preserve precise event names and prohibit adoption inference.
- Provider blockers and low traffic can make Phase 4 inconclusive. Mitigation: report denominators and gaps and treat no-expansion as a valid outcome.
- Moving Pages publication from direct `docs/` serving to an Actions-built artifact adds operational risk. Mitigation: preview the generated artifact, record the last production commit, and switch publication only after all checks pass.
- Build-time GitHub data can be stale, partial, or rate-limited. Mitigation: validate freshness and omit affected metrics while keeping direct links.
- Third-party agent logo provenance may be insufficient. Mitigation: default to text-only routes unless source and usage terms are documented.
- Browser screenshots and Flutter goldens can be platform-sensitive. Mitigation: pin versions and rendering platforms, separate deterministic comparisons from human inspection, and never update goldens broadly.
- Self-critique: The plan adds Playwright, Axe, JSON Schema tooling, multiple Python utilities, and an Actions-based site build to a small static site. This may create excessive maintenance burden; implementation should retain each dependency only when it enforces a named contract gate that cannot be covered by the existing standard-library validation.
- Self-critique: Independent blinded scoring is required but no scorer is currently identified. Without an available scorer who remains unaware of the reveal mapping, Phase 2 cannot honestly publish scored findings and must remain incomplete.
- Self-critique: Phase 4 deliberately avoids a numeric uplift target, reducing false precision but leaving room for post-hoc interpretation. The decision record must expose denominators, confounders, contrary evidence, and the no-go option.

## Rollback Plan
- Record the production commit before every phase and deploy only completed phase boundaries.
- Phase 1: revert `docs/index.html`, CSS, interaction, analytics, and browser-test changes to the prior Pages commit. Keep the mark and Product Studio goldens untouched; disabling analytics requires removing only the provider binding/configuration.
- Phase 2: redeploy the last Phase 1 artifact and restore the prior Pages publication mode if necessary. Never delete or edit committed runs; retract a finding through a new superseding record and remove only generated publication references.
- Phase 3: disable GitHub/testimonial rendering and redeploy the direct-link fallback. Remove revoked testimonials while retaining private consent audit records; do not retain stale generated metrics.
- Phase 4: revert only the selected page, navigation entry, and event hooks. Preserve the aggregate report, prior phases, and immutable benchmark history.
- After any rollback, rerun repository validation, browser checks, Flutter evidence checks, generated-site validation, and the production smoke test.

## Edge Cases
- JavaScript is disabled: navigation, audience content, skill panels, commands, evidence, benchmark status, GitHub links, and installation routes remain readable.
- Clipboard access is denied or unavailable: commands remain selectable, manual-copy feedback is announced, and no successful `install_copy` event fires.
- Analytics is missing, blocked, delayed, or throws: user actions complete with no uncaught error.
- Analytics configuration is absent: measurement does not start and Phase 4 defers expansion.
- Rapid repeated clicks occur: events remain bounded and never include command text.
- A benchmark arm fails, times out, or lacks evidence: the run is sealed as `Incomplete`; missing evidence is `unverified`.
- Conditions differ between arms: validation blocks complete comparative publication.
- A prior run is modified, renamed, or deleted: append-only CI fails.
- A run ID collides: validation rejects the new package.
- Artifact paths contain traversal, absolute paths, or escaping symlinks: validation rejects the bundle.
- Logs, scorer notes, testimonials, or API values contain HTML: the renderer escapes content and rejects unsafe links.
- The newest benchmark is invalid: deployment stops and the last valid production site remains live.
- GitHub returns zero, stale, malformed, partial, or rate-limited data: affected metrics are omitted independently.
- No authentic testimonial exists: no testimonial section is rendered.
- Testimonial consent is revoked: the entry disappears on the next deployment without changing benchmark evidence.
- A third-party logo lacks verified usage rights: its installation route becomes text-only.
- Long commands, names, localized copy, or 200% zoom wrap: controls remain reachable without document-level horizontal scrolling.
- Website evidence diverges from Product Studio goldens: repository validation blocks release.
- Analytics traffic is insufficient or affected by major deployment confounders: Phase 4 records no decision and ships no expansion.
- Candidate expansion signals tie or conflict: no new surface is selected.

## Open Questions
- None. Missing analytics configuration, complete benchmark evidence, blinded scoring, GitHub data, attribution evidence, testimonials, or expansion evidence follows the specified no-op, incomplete, omission, or no-expansion path.