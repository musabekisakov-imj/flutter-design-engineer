# Interactive Install Guide Design

## Goal

Create a public, premium installation guide for Flutter Design Engineer at the
repository's GitHub Pages URL. The guide must make installation understandable
in under one minute, distinguish personal and project scopes, and provide
accurate copyable commands for Claude Code, Codex, Gemini CLI, and Cursor.

The existing README remains the dependable GitHub-native entry point. It will
gain a prominent link to the interactive guide while retaining the recommended
one-command installation route.

## Visual Direction

Use the approved **Technical Command Center** direction:

- near-black navy canvas with layered navy surfaces;
- coral as the primary action and active-state color;
- cool gray borders and secondary copy;
- compact uppercase operational labels paired with a strong sans-serif display
  hierarchy;
- restrained status indicators and terminal-inspired command modules;
- the current product icons for Claude Code, Codex, Gemini CLI, and Cursor.

The result should feel like a focused developer tool, not a generic AI landing
page. Decorative effects must remain subtle and must not reduce command
readability.

## Information Architecture

The page is a single guided flow:

1. **Header** — repository identity, GitHub link, and open-source status.
2. **Hero** — value proposition, seven-specialist summary, and primary
   recommended installation command.
3. **Agent command center** — four selectable agent tabs and an adaptive command
   panel.
4. **Workflow** — audit, design, implement, accessibility, and visual QA as one
   connected sequence.
5. **Seven skills** — compact specialist cards with direct, factual summaries.
6. **Maintain and verify** — selected installation, intentional updates, and
   installation verification.
7. **Troubleshooting** — credible failure modes with specific resolutions.
8. **First prompt** — a copyable prompt that invokes `$flutter-design`.
9. **Footer** — repository, license, and return-to-top links.

## Recommended Installation

The strongest action on the page is:

```bash
npx skills add musabekisakov-imj/flutter-design-engineer
```

It is labeled **Recommended** and explains that it requires Node.js with `npx`,
supports skill-aware agents, installs seven self-contained skills, and requires
a new agent session after installation.

The `--list` command is available as a secondary inspect-before-install action.

## Agent Command Center

The agent selector uses an accessible tab interface. Selecting a tab updates
only the associated details panel; it does not navigate away or execute a
command.

### Claude Code

- Scope: personal, all projects.
- Destination: `~/.claude/skills`.
- Uses the repository's current Claude icon.

### Codex

- Scope: personal, all projects.
- Destination: `~/.codex/skills`.
- Uses the repository's current Codex icon.

### Gemini CLI

- Scope: current project.
- Destination: `.gemini/skills`.
- Uses the repository's current Gemini icon.

### Cursor

- Scope: current project.
- Destination: `.cursor/skills`.
- Uses the current official Cursor brand asset already referenced by the
  repository.

Each panel contains a direct HTTPS-based Python installation command, a concise
scope explanation, the destination, and a copy button. The CLI route remains
visually primary.

## Interactions

### Copy controls

Every command and the first prompt has a copy button. On success, its label
changes to `Copied` for approximately two seconds and announces the result
through an `aria-live` region. If the Clipboard API is unavailable, the page
selects the command text and provides a visible manual-copy instruction.

### Agent tabs

Tabs support pointer interaction plus Left Arrow, Right Arrow, Home, and End.
The selected tab exposes one matching panel through `aria-selected`,
`aria-controls`, and roving `tabindex`.

### Motion

Use short opacity and translate transitions only for panel changes and
first-viewport entrance. Disable nonessential animation when
`prefers-reduced-motion: reduce` is active.

## Responsive Behavior

- Desktop: bounded wide canvas, two-column hero, horizontal agent tabs, and
  multi-column specialist cards.
- Tablet: compressed two-column layouts where content remains readable.
- Mobile: single-column flow, horizontally scrollable or wrapped agent tabs,
  full-width copy controls, and commands that scroll without breaking the page.

No interaction depends on hover. Touch targets are at least 44 logical pixels.

## Accessibility

- Semantic landmarks and a skip link.
- One visible `h1` and a logical heading hierarchy.
- Keyboard-operable tabs and copy controls.
- Clearly visible focus states.
- Sufficient contrast for text, borders, and active controls.
- Meaningful alt text for product icons; decorative graphics are hidden from
  assistive technology.
- Status is never communicated by color alone.
- The page remains usable with JavaScript disabled: all installation commands
  stay present in the document and the first agent panel is visible.

## Technical Architecture

Use a dependency-free static site under `docs/`:

- `docs/index.html` — semantic page structure and content;
- `docs/assets/install-guide.css` — tokens, layout, responsive rules, and motion;
- `docs/assets/install-guide.js` — tabs, copy behavior, and lightweight entrance
  enhancement;
- current repository product images are copied into `docs/assets/agents/` so
  the published `docs/` artifact is self-contained; the official remote Cursor
  asset may remain remote with a text-label fallback.

No framework, build step, analytics, cookies, API, or external font dependency
is required. The page uses a system font stack so loading is immediate and
privacy-preserving.

## Publishing

Publish the `docs/` directory from the `main` branch through GitHub Pages using
the repository's Pages settings. Do not add a GitHub Actions workflow unless
branch-based Pages publishing is unavailable.

The canonical public URL is expected to be:

`https://musabekisakov-imj.github.io/flutter-design-engineer/`

The README receives a clear **Open Interactive Install Guide** link. Until the
Pages URL returns successfully, the README's existing installation command
continues to be the primary working path.

## Failure Handling

- Missing JavaScript: commands remain readable and selectable.
- Clipboard failure: show manual-copy guidance without hiding content.
- Missing remote Cursor image: preserve an accessible text label and stable
  layout.
- GitHub Pages unavailable: README instructions remain complete.
- Unsupported browser features: avoid relying on them for core navigation or
  installation content.

## Verification

Before publication:

1. Run repository validation and unit tests.
2. Run `git diff --check`.
3. Validate internal paths, external links, headings, landmarks, and unique IDs.
4. Exercise tabs with pointer and keyboard input.
5. Exercise copy success and fallback behavior.
6. Capture desktop and mobile screenshots and review hierarchy, clipping,
   horizontal overflow, and focus visibility.
7. Check reduced-motion behavior and a no-JavaScript rendering.
8. Confirm all four direct installers create seven skill directories in
   isolated temporary destinations.
9. Push to `main`, enable or deploy GitHub Pages, and confirm the public URL
   returns HTTP 200 before treating the site as published.

## Scope Boundaries

This work changes only the static installation guide, its presentation assets,
the README link, and the minimum publishing configuration required for GitHub
Pages. It does not change skill behavior, installer semantics, benchmark
claims, repository governance, or the capabilities of any supported agent.
