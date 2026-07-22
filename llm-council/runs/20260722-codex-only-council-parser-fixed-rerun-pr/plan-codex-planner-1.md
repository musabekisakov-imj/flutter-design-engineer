# Plan

## Overview
Evolve the existing static GitHub Pages site through four reversible releases: improve installation conversion, publish a controlled Codex benchmark, add only verifiable social proof, and permit further expansion only after privacy-safe analytics provides sufficient evidence. Preserve the current identity, brand-mark geometry, Product Studio goldens, progressive enhancement, and repository quality gates throughout.

## Scope
- In:
  - Conversion-focused reordering and refinement of `docs/index.html`.
  - Cookie-free aggregate event measurement through a provider-isolated adapter.
  - Codex-only baseline-versus-skill-guided benchmark runs under equal declared conditions.
  - Append-only benchmark artifacts, JSON schemas, blinded scoring, validation, and CI-generated static pages.
  - Build-time GitHub proof and consent-backed testimonials with omission fallbacks.
  - Accessibility, reduced-motion, rendered visual QA, installation verification, CI deployment, and post-deploy smoke tests.
  - A documented evidence gate for any later static-page expansion.
- Out:
  - Framework migration, runtime backend, accounts, billing, email capture, or client-side benchmark calculation.
  - Changes to `docs/assets/brand/mark.svg`, Flutter mark geometry, or existing Product Studio evidence unless separately approved and regenerated.
  - Non-Codex benchmark rows in the first measured release.
  - Invented benchmark outcomes, testimonials, adoption figures, partnerships, endorsements, or absolute conversion targets.
  - Speculative documentation, gallery, changelog, skill-detail, or multi-agent benchmark pages without supporting evidence.

## Phases
### Phase 1: Conversion-Focused Static Homepage

**Goal**: Make installation-command copy the primary action, place verified Flutter evidence immediately behind it, and instrument aggregate conversions without changing the site’s identity or requiring JavaScript.

#### Task 1.1: Recompose the homepage decision sequence
- Location: `docs/index.html`, `docs/assets/install-guide.css`, `docs/assets/brand/mark.svg`, `docs/assets/product-studio/`, `examples/product-studio/demo/goldens/`
- Description: Evolve the existing page in place to match the approved promise → audience → mechanism → evidence → benchmark status → trust → installer sequence.
- Estimated Tokens: 3200
- Dependencies: None
- Steps:
  - Retain the current header, mark, seven-skill registry, Product Studio imagery, technical proof, four installation routes, and dark/cyan/lime/coral visual roles.
  - Change the hero actions to “Install all 7 skills” and “See verified results”; keep the install command readable and selectable without JavaScript.
  - Add four in-page audience paths for Flutter developers, technical leads, product teams, and AI-platform builders.
  - Condense repeated copy while preserving the workflow gates, six Product Studio screens, recoverable error state, tablet composition, and deterministic-fixture disclaimer.
  - Add a Codex benchmark status section that links to the protocol and explicitly says measured results remain pending; render no numbers.
  - Add an open-source trust section containing only stable repository, CI, validation, source, and contribution links.
  - Move the full installer after evidence and trust while retaining a repeated primary install command near the hero and final CTA.
  - Use semantic sections, landmarks, heading order, native links, and source-order content that remains coherent when scripts are disabled.
- Acceptance Criteria:
  - The first viewport contains the product promise, selectable installation command, primary copy action, secondary verified-results link, and two unchanged real Flutter outputs.
  - All four audience paths are present as in-page content, not separate pages.
  - The homepage sequence matches the primary contract and contains no benchmark figures, testimonials, adoption claims, or partnership language.
  - `docs/assets/brand/mark.svg`, `examples/product-studio/demo/lib/product_studio_widgets.dart`, Product Studio goldens, and their website copies remain unchanged and synchronized.
  - All seven skills and four direct installation routes remain available without JavaScript.

#### Task 1.2: Isolate progressive interactions and analytics
- Location: `docs/assets/install-guide.js`, `docs/assets/analytics-adapter.js`, `docs/index.html`, `docs/decisions/analytics-provider.md`
- Description: Keep tabs, navigation, copy feedback, and event dispatch progressively enhanced while isolating the optional analytics provider.
- Estimated Tokens: 2400
- Dependencies: Task 1.1
- Steps:
  - Preserve the interaction controller for skill tabs, installer tabs, mobile navigation, copy controls, and reduced-motion reveal behavior.
  - Fix the mobile navigation CSS so links remain visible or naturally wrapped without the `.js` class; show the menu button only when JavaScript can operate it.
  - Add an analytics adapter with a stable `track(name, properties)` interface and a silent no-op default.
  - Allow only `install_copy`, `verified_results_open`, `benchmark_artifact_open`, `github_open`, `audience_path_select`, and `install_success_help_open`.
  - Allow only enumerated route properties such as `all`, `single-skill`, `claude`, `codex`, `gemini`, and `cursor`; reject arbitrary strings, command contents, URLs, and user-entered data.
  - Record the selected cookie-free provider and reviewed configuration in `docs/decisions/analytics-provider.md`; leave the adapter disabled if an approved provider account is unavailable.
  - Dispatch analytics only after the user-facing action has been attempted; provider exceptions must never interrupt navigation or clipboard fallback.
- Acceptance Criteria:
  - Every link and command remains usable with JavaScript disabled, analytics blocked, or the clipboard API rejected.
  - Copy failure leaves the command selectable and announces an accessible manual-copy instruction.
  - No cookies, local storage, fingerprinting, email addresses, command text, or persistent cross-site identifiers are introduced.
  - Unknown events and properties are dropped by the adapter.
  - Reduced-motion users receive no nonessential spatial animation.

#### Task 1.3: Add static-site verification and deploy gates
- Location: `package.json`, `package-lock.json`, `playwright.config.js`, `lighthouserc.json`, `tests/site/homepage.spec.js`, `tests/site/snapshots/`, `scripts/build_site.py`, `scripts/smoke_site.py`, `scripts/validate_repository.py`, `tests/test_repository.py`, `.github/workflows/validate.yml`, `.github/workflows/pages.yml`
- Description: Establish deterministic browser, evidence-integrity, deployment, and post-deploy checks before releasing the conversion update.
- Estimated Tokens: 3400
- Dependencies: Tasks 1.1–1.2
- Steps:
  - Add locked development dependencies for Playwright, Axe integration, and Lighthouse CI; introduce no browser runtime dependency.
  - Build the deployable site by copying the static `docs/` tree into ignored `build/site/`.
  - Add tests for semantic structure, unique IDs, internal links, tab keyboard behavior, menu behavior, copy success/failure, no-JavaScript rendering, analytics no-op behavior, 200% zoom, reduced motion, and document overflow.
  - Compare each published Product Studio image byte-for-byte with its corresponding committed Flutter golden.
  - Extend CI with Product Studio analysis, widget tests, and platform-controlled golden verification rather than validating only Connected Command Center.
  - Deploy the tested static artifact through GitHub Pages Actions and run smoke tests against the deployed commit.
- Acceptance Criteria:
  - Repository validation, Python tests, both Flutter demo analyzers and widget suites, Product Studio goldens, Playwright, Axe, Lighthouse, and screenshot checks pass.
  - Screenshots at 390, 768, 1024, 1440, and wide desktop widths are visually inspected and show no document-level horizontal overflow.
  - A clean temporary environment verifies the recommended and direct installation paths.
  - The deployed page exposes the expected title, install command, verified-results target, assets, and repository links for the exact tested commit.
  - Failure in validation, build, deployment, or smoke testing prevents Phase 1 release.

### Phase 2: Controlled Codex Benchmark

**Goal**: Publish one reproducible Codex comparison with immutable artifacts, equal declared conditions, blinded scoring, bounded conclusions, and build-time static rendering.

#### Task 2.1: Define the append-only benchmark data contract
- Location: `benchmarks/connected-command-center/README.md`, `benchmarks/connected-command-center/results.md`, `benchmarks/connected-command-center/schemas/pair.schema.json`, `benchmarks/connected-command-center/schemas/arm.schema.json`, `benchmarks/connected-command-center/schemas/checks.schema.json`, `benchmarks/connected-command-center/schemas/score.schema.json`, `benchmarks/connected-command-center/schemas/summary.schema.json`, `requirements/benchmark.txt`, `scripts/validate_benchmarks.py`, `scripts/check_benchmark_append_only.py`, `tests/test_benchmark_pipeline.py`, `.gitignore`
- Description: Replace the current minimal pending-manifest validation with a complete, versioned pair-and-artifact contract.
- Estimated Tokens: 3800
- Dependencies: Phase 1 released
- Steps:
  - Preserve the existing pending manifests as legacy protocol placeholders; exclude them from measured rendering.
  - Define immutable packages under `benchmarks/connected-command-center/runs/<run-id>/`.
  - Require a pair manifest containing Codex CLI/model identifier, starting commit, exact prompt hash, environment class, tools, resource limits, retry policy, viewport/state matrix, dates, and unavoidable differences.
  - Require arm manifests for `baseline` and `skill-guided`, source snapshots, command logs, screenshots, machine-readable analyze/test/accessibility/golden results, interventions, status, and incomplete reason.
  - Support `incomplete` and `complete`; do not translate missing evidence into a numeric score.
  - Pin the JSON Schema validator in `requirements/benchmark.txt` and validate schema versions, paths, hashes, pair equality, artifact presence, status consistency, and summary-to-score consistency.
  - Add a merge-base check that rejects modification or deletion of any previously committed `runs/<run-id>/` file. Draft work remains in ignored `.benchmark-staging/`; retries receive new run IDs.
  - Change `results.md` to a Codex-only publication state while retaining future multi-agent protocol language in documentation.
- Acceptance Criteria:
  - Valid complete, valid incomplete, missing-artifact, unequal-condition, invalid-score, traversal-path, duplicate-ID, and modified-history fixtures are covered by tests.
  - A complete pair cannot validate unless both arms share every controlled field except the declared skill configuration.
  - Files committed under `runs/` cannot be edited or deleted in later pull requests.
  - Existing pending placeholders remain factual and do not appear as measured rows.

#### Task 2.2: Execute and capture the controlled Codex pair
- Location: `benchmarks/connected-command-center/shared-prompt.md`, `benchmarks/connected-command-center/rubric.md`, `benchmarks/connected-command-center/runs/<run-id>/manifest.json`, `benchmarks/connected-command-center/runs/<run-id>/baseline/`, `benchmarks/connected-command-center/runs/<run-id>/skill-guided/`
- Description: Run baseline and skill-guided Codex sessions from clean copies under the finalized protocol without reusing the authored showcase as evidence.
- Estimated Tokens: 7000
- Dependencies: Task 2.1; frozen starter commit; declared equal run budget
- Steps:
  - Freeze the starter repository commit and shared prompt before either run.
  - Create two clean worktrees with identical Flutter/Dart versions, host class, tools, viewport matrix, state fixtures, retry policy, and Codex model/CLI version.
  - Ensure the baseline has no Flutter Design Engineer skills and the guided arm uses the published repository skill workflow; record this as the intended independent variable.
  - Execute both sessions with the same declared resource limits and preserve all prompts, outputs, diffs, commands, failures, retries, and human interventions.
  - Run identical analyzer, widget, accessibility, golden, and screenshot capture commands against both outputs.
  - Capture compact, expanded, and recoverable-error screenshots at identical dimensions; record unavailable states as incomplete evidence.
  - Finalize and commit the whole immutable package once; if interrupted, publish an immutable incomplete run and use a new run ID for any retry.
- Acceptance Criteria:
  - Both arms identify the same Codex configuration, prompt, starter commit, environment, tools, limits, retry policy, and capture matrix.
  - Every recorded check is traceable to raw logs and machine-readable output.
  - Existing Product Studio and Connected Command Center showcases are not substituted for either benchmark arm.
  - No cost, speed, cross-model, or general-superiority conclusion is introduced.

#### Task 2.3: Blind, score, and summarize the run
- Location: `scripts/prepare_blinded_score.py`, `benchmarks/connected-command-center/runs/<run-id>/scoring/`, `benchmarks/connected-command-center/runs/<run-id>/summary.json`, `tests/test_benchmark_pipeline.py`
- Description: Create an auditable blinded scoring packet and bounded static summary.
- Estimated Tokens: 3000
- Dependencies: Task 2.2
- Steps:
  - Copy only normalized screenshots and comparable check evidence into opaque candidate A/B scoring packets; remove filenames and metadata that directly identify the arm.
  - Keep the candidate mapping outside the scorer packet until scoring is signed, then commit the mapping, source hashes, scorer identity or role, date, rubric version, notes, and disclosed limitations.
  - Score only rubric criteria backed by artifacts; use `unverified` for missing evidence and list analyzer or test failures independently.
  - Generate `summary.json` from validated manifests and scores, not manual marketing copy.
  - State that conclusions apply only to the recorded Codex configuration and controlled task.
- Acceptance Criteria:
  - Reversing candidate order yields the same mapped totals and conclusions.
  - Every score references an existing immutable artifact and rubric criterion.
  - The published package discloses scorer independence limitations and any plausible arm-identification leakage.
  - An incomplete run produces no aggregate success claim.

#### Task 2.4: Generate and deploy static benchmark output
- Location: `scripts/build_site.py`, `scripts/render_benchmark_site.py`, `scripts/templates/benchmark-section.html`, `scripts/templates/benchmark-page.html`, `docs/index.html`, `.github/workflows/validate.yml`, `.github/workflows/pages.yml`, `tests/site/benchmark.spec.js`
- Description: Render benchmark content during CI and publish only validated static markup.
- Estimated Tokens: 3200
- Dependencies: Tasks 2.1–2.3
- Steps:
  - Extend the site build to render a homepage benchmark summary and `benchmarks/index.html` into `build/site/`.
  - Resolve all displayed values and artifact links at build time; prohibit browser-side fetches, score calculation, or GitHub API calls.
  - Show the newest valid complete Codex pair, while retaining links to earlier immutable runs and explicitly listing newer incomplete runs.
  - Abort deployment on invalid schema or inconsistent artifacts so the prior valid Pages deployment remains live.
  - Add `benchmark_artifact_open` tracking to static artifact links through the existing adapter.
- Acceptance Criteria:
  - Built HTML contains only values present in a validated `summary.json`.
  - Invalid data fails CI and cannot replace the last valid deployment.
  - With no complete run, the static fallback says “Incomplete” or “Protocol ready” and contains no numerical claim.
  - Benchmark content and artifacts remain readable and navigable without JavaScript.

### Phase 3: Authentic Social Proof

**Goal**: Add verifiable GitHub signals and consent-backed testimonials without runtime dependencies, endorsement implications, or empty placeholders.

#### Task 3.1: Render verified GitHub and compatibility proof
- Location: `scripts/fetch_github_proof.py`, `scripts/render_social_proof.py`, `tests/fixtures/github-proof/`, `tests/test_social_proof.py`, `docs/assets/agents/ATTRIBUTION.md`, `docs/index.html`, `.github/workflows/pages.yml`
- Description: Fetch allowlisted repository facts during the Pages build and omit unavailable or stale values.
- Estimated Tokens: 3000
- Dependencies: Phase 1; Task 2.4 only for placement beside benchmark links
- Steps:
  - Fetch Stars, Forks, contributors, releases, and current CI status through the build workflow’s least-privilege GitHub token.
  - Store fetched data only in the ephemeral build directory with source URL and retrieval timestamp.
  - Render each metric only when retrieval succeeds, freshness passes, and its value is semantically meaningful; otherwise retain direct repository links without a numeric placeholder.
  - Label values with their last-checked time and avoid “live” wording.
  - Audit existing agent images, add ownership/source attribution, use “Works with” language, and fall back to text-only labels when attribution cannot be verified.
  - Add tests proving API failure, rate limiting, malformed payloads, stale data, and zero/missing values cannot break the build.
- Acceptance Criteria:
  - GitHub API failure produces a complete site with repository links and no fake zero values.
  - Metrics are traceable to build-time API responses and never fetched by the browser.
  - No logo, badge, or wording implies endorsement or partnership.
  - The workflow retains read-only repository permissions outside the Pages deployment job.

#### Task 3.2: Add testimonial and reproduction contribution contracts
- Location: `social-proof/README.md`, `social-proof/testimonials.schema.json`, `social-proof/testimonials.json`, `benchmarks/connected-command-center/CONTRIBUTING.md`, `.github/ISSUE_TEMPLATE/benchmark-reproduction.yml`, `scripts/render_social_proof.py`, `tests/test_social_proof.py`
- Description: Permit authentic testimonials and community benchmark reproductions while keeping both absent until their evidence is complete.
- Estimated Tokens: 2400
- Dependencies: Task 3.1
- Steps:
  - Define testimonial fields for approved quote, display identity, role or organization when authorized, source link, consent attestation, approval date, and attribution limits.
  - Keep `testimonials.json` empty initially; render no testimonial heading, spacing, carousel, or placeholder when no valid entry exists.
  - Reject entries without consent attestation, source URL, attribution, or exact approved wording.
  - Document that private consent records remain outside the public repository and that repository data contains no email address or private contact detail.
  - Add a contribution path for reproducible benchmark packages using new run IDs and the same schema, append-only, and claim-boundary requirements.
- Acceptance Criteria:
  - Empty, absent, or invalid testimonial data results in complete section omission.
  - Any rendered quote has consent, identity, attribution, and source metadata.
  - Community benchmark submissions cannot overwrite existing runs or bypass schema and scoring validation.
  - No testimonial or community result is invented to exercise the renderer; tests use clearly marked fixtures only.

### Phase 4: Evidence-Led Expansion

**Goal**: Make “no expansion” the default and approve at most one isolated static addition only when aggregate analytics and community evidence justify it.

#### Task 4.1: Establish the expansion decision gate
- Location: `docs/decisions/website-expansion-template.md`, `docs/decisions/website-expansion-<date>.md`, `docs/decisions/analytics-provider.md`
- Description: Evaluate the first complete analytics week and subsequent 30-day period without creating absolute traffic or conversion targets.
- Estimated Tokens: 1800
- Dependencies: Phase 1 analytics operating without material outage; Phases 2–3 data where relevant
- Steps:
  - Export only aggregate unique visits and approved event counts from the selected provider.
  - Calculate install-copy, verified-result, benchmark-artifact, qualified GitHub, audience-path, and install-help rates with denominators and collection limitations disclosed.
  - Check for outages, bot contamination, instrumentation changes, insufficient sample size, and inconsistent event definitions before comparing periods.
  - Combine analytics with reproducible issues and contribution requests; do not treat raw traffic alone as product demand.
  - Record a decision of `no change`, `instrumentation repair`, or one named static expansion with its evidence and rollback boundary.
- Acceptance Criteria:
  - No expansion proceeds without a committed decision record containing the observation windows, formulas, limitations, and evidence links.
  - Provider failure, incomplete baseline data, or insufficient sample produces `no change` or `instrumentation repair`.
  - The decision uses relative rates and uncertainty, not invented adoption figures or absolute conversion targets.

#### Task 4.2: Ship at most one justified static expansion
- Location: `docs/index.html`, `docs/<approved-page>/index.html`, `docs/assets/install-guide.css`, `scripts/build_site.py`, `tests/site/<approved-page>.spec.js`, `.github/workflows/pages.yml`
- Description: Implement only the single page or section named by the approved Phase 4 decision record.
- Estimated Tokens: 3200
- Dependencies: Task 4.1 decision of one named expansion; a focused approved design addendum
- Steps:
  - Create a focused design addendum defining the selected page’s audience, conversion, content source, evidence, navigation, no-JavaScript behavior, and removal boundary.
  - Reuse the existing static tokens, mark, interaction adapter, build pipeline, accessibility behavior, and analytics taxonomy.
  - Add no framework, backend, account system, speculative multi-agent comparison, or unverified content.
  - Release the expansion independently and compare its aggregate behavior without changing earlier event definitions.
- Acceptance Criteria:
  - The expansion maps directly to the committed evidence and design addendum.
  - Removing its page, navigation entry, styles, and tests restores the Phase 3 site without data migration.
  - All existing validation, rendered QA, accessibility, installation, deployment, and smoke gates remain mandatory.
  - If Task 4.1 does not approve an expansion, Phase 4 completes with the decision record and no product code change.

## Testing Strategy

| Area | Automated checks | Manual/release checks |
| --- | --- | --- |
| Repository | `python3 scripts/validate_repository.py`; `python3 -m unittest discover -s tests -v`; broken-link, schema, append-only, and evidence-sync checks | Review contract and claim-boundary diffs |
| Flutter evidence | `flutter analyze`; widget tests; Product Studio and Connected Command Center golden tests | Inspect every affected golden; verify logo geometry remains synchronized |
| Static HTML | Heading/landmark, unique-ID, link, command, fallback-content, and generated-output tests | Read page linearly with CSS and JavaScript disabled |
| Interaction | Playwright tab, menu, copy-success, copy-failure, focus, Escape, Home/End, and analytics no-op tests | Keyboard-only and screen-reader spot checks |
| Accessibility | Axe, 200% zoom, reduced motion, focus visibility, target size, and overflow assertions | Inspect at 390, 768, 1024, 1440, and wide desktop widths |
| Visual regression | Stable Playwright screenshots for hero, evidence, benchmark, trust, and installer | Compare approved snapshots before each phase release |
| Analytics | Event/property allowlist, provider-absent, provider-throwing, and no-storage tests | Inspect browser storage/network traffic and provider aggregate events |
| Benchmark | Schema fixtures, equal-condition invariants, artifact hashes, incomplete-state handling, blinded mapping, summary consistency, and append-only history | Audit prompts, interventions, screenshots, scorer notes, and claim wording |
| Social proof | Mocked success, absent, malformed, stale, rate-limited, and empty GitHub/testimonial inputs | Verify attribution, source links, consent, and non-endorsement wording |
| Installation | Local installer unit tests and isolated temporary destinations for all routes | Execute every published command in a clean release environment |
| Deployment | Build artifact validation and exact-commit Pages deployment | Post-deploy checks for title, assets, install command, evidence, benchmark, GitHub links, console errors, and responsive overflow |
| Performance/SEO | Lighthouse CI against the local production artifact | Recheck the deployed URL after each phase |

## Risks
- CI-generated Pages deployment adds more operational surface than the current direct `docs/` publication. Mitigation: keep `docs/` independently usable, build with Python and static files only, retain the prior deployment until smoke tests pass, and isolate Pages permissions to the deployment job.
- Playwright, Lighthouse, JSON Schema validation, and macOS golden checks can increase CI time and flakiness. Mitigation: pin lockfiles and Flutter tooling, separate jobs by concern, cache safely, and never convert a failed gate into a warning.
- Blinding may be imperfect because the guided output can reveal workflow characteristics. Mitigation: blind only normalized screenshots and comparable checks, withhold the arm map until scoring is signed, and disclose likely inference and scorer independence limitations.
- Append-only packages can preserve mistakes permanently. Mitigation: validate in ignored staging, commit complete packages atomically, publish corrections as new run IDs, and link superseding records without deleting history.
- Build-time GitHub metrics may be stale, rate-limited, or unavailable. Mitigation: apply freshness rules, omit values on any uncertainty, and keep direct source links.
- Aggregate analytics can still be misleading under low traffic, bot activity, or instrumentation changes. Mitigation: disclose denominators and outages, require stable collection windows, and default Phase 4 to no expansion.
- Testimonial consent may later be withdrawn. Mitigation: remove the testimonial from future generated output and retain only the minimum internal audit record; do not expose private consent data.
- Self-critique: The plan introduces a comparatively heavy browser and build-time toolchain for a small static site; maintenance cost could outweigh conversion insight. The Phase 1 release should retain each tool only if it catches a concrete contract risk and keep runtime output dependency-free.
- Self-critique: The Phase 4 implementation cannot name an exact page without violating the evidence-first contract, so its final engineering scope is intentionally contingent. This reduces upfront estimate precision and requires a new focused design addendum before code changes.
- Self-critique: A single controlled Codex pair has limited external validity even when executed perfectly. The site must present it as one recorded task and configuration, not as proof of broad model or workflow superiority.

## Rollback Plan
- Phase 1: Revert the homepage, CSS, interaction, analytics, test, and Pages workflow commits as one release unit. Restore the previous Pages artifact; brand assets and Product Studio evidence require no rollback because they remain unchanged.
- Phase 2: Disable benchmark rendering and restore the pending protocol block while retaining all immutable run artifacts. Roll back `scripts/build_site.py` and Pages templates to the Phase 1 artifact; never delete or rewrite published run packages.
- Phase 3: Disable GitHub/testimonial inputs and revert the trust renderer; the homepage falls back to stable repository and contribution links. Remove unverified logos from output without affecting installation text.
- Phase 4: Revert the isolated page, navigation link, scoped styles, event hook, and tests. Retain the decision record and aggregate measurement notes for auditability.
- For every phase, deploy the prior known-good commit, rerun repository and site validation, and complete post-deploy smoke tests before declaring rollback complete.

## Edge Cases
- JavaScript, analytics, clipboard access, IntersectionObserver, or the optional provider is unavailable.
- Mobile navigation is viewed without JavaScript or with CSS partially loaded.
- Commands wrap at 200% zoom or on a 390-pixel viewport.
- A tab references a missing panel, an artifact link is broken, or generated IDs collide.
- The newest benchmark is incomplete while an older complete run remains valid.
- One benchmark arm fails analysis, tests, accessibility checks, or screenshot capture.
- Both arms finish but differ in model version, starter commit, tools, limits, retry policy, viewport, or human intervention.
- A scorer can infer the arm despite anonymization, or no independent scorer is available.
- A pull request modifies or deletes an existing immutable run.
- GitHub returns missing, stale, partial, zero, malformed, or rate-limited metric data.
- A testimonial is absent, invalid, unattributed, unconsented, source-inaccessible, or withdrawn.
- Agent-logo attribution cannot be verified.
- Analytics collection starts late, changes event definitions, experiences an outage, or receives insufficient legitimate traffic.
- A Pages build succeeds but the deployed URL serves the prior commit or omits generated benchmark output.
- Flutter rasterization differs across runner platforms despite bundled fonts.

## Open Questions
- None for planning. Analytics-provider availability, benchmark completion, testimonial consent, and the Phase 4 expansion choice are explicit release gates and must not be filled with assumptions.