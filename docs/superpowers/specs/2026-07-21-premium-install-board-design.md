# Premium Install Board Design

## Goal

Replace the functional but visually sparse README installation section with a
full-width, guided install board. A first-time visitor must immediately know
which command is recommended, which agents are supported, whether installation
is global or project-local, and what to do after the command finishes.

## Chosen Direction

Use the approved **Guided premium board** direction. Keep the GitHub-native
visual language: dark-mode-safe borders, restrained surfaces, compact type,
real product icons, and copyable code blocks. Do not imitate a marketing
landing page or depend on unsupported CSS and JavaScript.

## Information Hierarchy

1. Lead with one full-width **Recommended** route using the open skills CLI.
2. Explain that it installs all seven skills and lets the user choose a
   supported agent interactively.
3. Show a four-card agent matrix for Claude Code, Codex, Gemini CLI, and Cursor.
4. Follow with concise advanced sections for selected skills, updates,
   verification, troubleshooting, and a first prompt.

The recommended route must be visually and semantically stronger than the
manual alternatives. Native commands remain available for users who do not
want to use the skills CLI.

## Recommended Route

The primary command is:

```bash
npx skills add musabekisakov-imj/flutter-design-engineer
```

The board must state:

- recommended for most users;
- works with the four documented agents;
- installs all seven skills;
- requires Node.js and `npx`;
- a new agent session is required after installation.

Keep the `--list` command as a secondary browse-before-installing action.

## Agent Cards

Use a two-by-two HTML table so GitHub renders a stable full-width matrix without
custom CSS. Each cell contains the current product icon, agent name, scope,
best-use explanation, destination, and direct installation command.

### Claude Code

- Scope: **Personal · all projects**.
- Destination: `~/.claude/skills`.
- Explain that this is the direct native path for Claude Code users.

### Codex

- Scope: **Personal · all projects**.
- Destination: `~/.codex/skills`.
- Explain that skills become available to new Codex sessions.

### Gemini CLI

- Scope: **Project · current repository**.
- Destination: `.gemini/skills`.
- Explain that the configuration travels with the project when committed.

### Cursor

- Scope: **Project · current repository**.
- Destination: `.cursor/skills`.
- Use the current official Cursor app icon from the Cursor brand kit.
- Explain that Cursor discovers the skills inside the opened repository.

## Supporting Sections

### Install selected skills

Retain the existing `--skill` example and state that it is useful when a user
needs only the orchestrator or one specialist workflow.

### Update safely

Explain that the installer refuses to overwrite existing skills unless
`--force` is supplied. Show an intentional update example instead of leaving
the flag unexplained.

### Verify installation

Show a portable directory listing command for each scope and tell the user to
expect seven skill directories. Do not claim that a host has loaded a skill
until a new session has started.

### Troubleshooting

Cover only credible failure modes:

- `npx` unavailable: install Node.js or use the direct Python path;
- destination already exists: review it, then rerun with `--force` only when an
  overwrite is intended;
- skills not discovered: start a new agent session and verify the destination;
- SSH failure: the documented direct commands use HTTPS and do not require
  GitHub SSH keys.

### First prompt

End with one concise Flutter example that invokes `$flutter-design` and asks for
design, implementation, accessibility, and rendered verification in sequence.

## GitHub Rendering Constraints

- Use supported Markdown and HTML only.
- Do not use inline CSS, scripts, hover behavior, or controls that GitHub strips.
- Keep code lines short enough to avoid excessive horizontal scrolling.
- Use repository-local images for Claude, Codex, and Gemini.
- Use the official current Cursor brand-kit asset.
- Every icon requires meaningful alt text.
- Preserve readable structure when images fail to load.

## Verification

Before publication:

1. Run repository validation and unit tests.
2. Run `git diff --check`.
3. Test all four installer destinations in isolated temporary directories and
   confirm seven installed skill folders for each.
4. Verify that every image URL or repository asset returns successfully.
5. Inspect the rendered GitHub README in both narrow and desktop layouts.
6. Confirm that the recommended command and all direct commands remain
   copyable and semantically accurate.

## Scope Boundaries

This change affects only README installation guidance and related static icon
assets. It does not change skill behavior, the Python installer, benchmark
claims, or host capabilities.
