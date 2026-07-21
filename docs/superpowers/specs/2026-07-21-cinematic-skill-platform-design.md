# Cinematic Skill Platform Design

Date: 2026-07-21
Status: Approved design direction, pending written-spec review

## Objective

Redesign the public `flutter-design-engineer` website so it presents the repository as a serious developer product: seven connected Flutter design-engineering specialists that work across Claude Code, OpenAI Codex, Gemini CLI, and Cursor.

The page must communicate two ideas within the initial viewport:

1. The repository provides a connected, professional workflow rather than a collection of prompts.
2. The workflow produces real Flutter interfaces, demonstrated with committed Flutter golden-test outputs.

The visual standard is a mature, well-funded developer platform. The site must feel designed by a senior product, brand, frontend, and mobile team without making unsupported commercial, adoption, or performance claims.

## Design Read

Page type: open-source developer-tool landing page and installation guide.

Audience: Flutter developers, mobile product teams, and users of AI coding agents.

Visual language: cinematic product presentation combined with precise technical documentation.

Design dials:

- Design variance: 7/10
- Motion intensity: 4/10
- Visual density: 5/10

The composition is expressive in the hero and progressively more structured below it. Motion supports hierarchy and interaction feedback only.

## Product Positioning

Primary message:

> A senior Flutter design team, inside your agent.

Supporting message:

> Seven connected specialists turn product intent into adaptive, accessible, screenshot-verified Flutter interfaces.

Primary action: copy the repository's recommended `npx skills add` command.

Secondary action: inspect the repository on GitHub.

Real mobile screens appear beside the value proposition as evidence. They are not presented as the product itself, and the barbershop example never becomes the site's brand or narrative.

## Information Architecture

### 1. Navigation

Keep navigation at or below 72 pixels and on one line at desktop widths.

Links:

- Workflow
- Skills
- Evidence
- Install
- GitHub

The wordmark remains `Flutter Design Engineer`. No invented company identity or fake corporate navigation is introduced.

### 2. Cinematic Hero

Use a dark, cool-neutral environment with a restrained coral accent inherited from the current site.

Desktop composition:

- Left: headline, supporting sentence, recommended install command, GitHub secondary link.
- Right: two overlapping real Flutter phone goldens with restrained depth and one technical proof caption.
- The primary install action remains visible without scrolling at a 900-pixel viewport height.

Mobile composition:

- Copy first, command second, phone composition third.
- No horizontal clipping.
- The phone images remain legible and do not force the headline below the first screen unnecessarily.

Hero constraints:

- Headline uses no more than two lines on a 1440-pixel desktop viewport.
- Supporting copy stays under 20 words after final copy editing.
- No decorative version label, status dot, trust strip, or fake usage claim inside the hero.
- The command includes a functional copy control with confirmation feedback.

### 3. Verified Facts Strip

Present only facts supported by the repository:

- 7 focused skills
- 4 documented agent targets
- connected workflow
- MIT license

Test counts can appear only if calculated from the current test suite during the build or explicitly updated with the implementation. Avoid creating a stale permanent claim.

### 4. Connected Workflow

Show the seven skills as one connected sequence, not seven identical marketing cards:

1. `flutter-audit`
2. `flutter-design`
3. `flutter-design-system`
4. `flutter-implementation`
5. `flutter-motion`
6. `flutter-accessibility`
7. `flutter-visual-qa`

The section should explain what decision or artifact moves from one specialist to the next. Desktop may use a horizontal progression; mobile becomes a readable vertical sequence.

### 5. Interactive Skill Registry

The registry is the core product-explanation surface. A developer can select a skill and see:

- when it should activate;
- what it inspects or produces;
- its main quality gate;
- its individual install command;
- the path to its `SKILL.md` source.

Use a compact list plus one detail panel rather than seven equal cards. Keyboard selection and visible focus are required.

### 6. Real Flutter Output

Use committed golden outputs from repository examples. The section contains:

- a compact sequence of real phone screens;
- one expanded/tablet composition;
- one recoverable error state;
- one 200% text-scale result.

The barbershop booking fixture may supply some of these images, but its identity remains in captions and links only. The section headline speaks about verified Flutter output, not barbershop booking.

Every screenshot must link to its source or golden-test file. Captions clearly label outputs as committed Flutter goldens. No Figma exports, generated UI mockups, or hand-built HTML replicas are presented as application proof.

### 7. Agent Installation

Provide four agent choices using current, recognizable brand assets:

- Claude Code
- OpenAI Codex
- Gemini CLI
- Cursor

The recommended cross-agent `npx skills add` command remains the default. Agent-specific panels explain scope, destination, restart requirements, update behavior, and troubleshooting. Never imply an official partnership or endorsement.

### 8. Technical Proof

Show the repository's trust signals without invented enterprise language:

- self-contained `SKILL.md` packages;
- progressive references;
- repository validation;
- Flutter widget and golden tests;
- accessibility and adaptive-layout coverage;
- transparent installation and uninstall paths;
- honest limitations.

This section uses source links and concise excerpts. It does not use fake dashboards or decorative test terminals.

### 9. Final Action and Footer

Repeat the exact recommended install command once. The CTA wording remains consistent with the hero.

Footer links:

- README
- Skills source
- Contributing
- License
- GitHub

No newsletter, fake company address, version stamp, or unsupported community count is added.

## Visual System

### Color

Use one dark theme across the page.

- Canvas: cool off-black/navy
- Elevated surfaces: slightly lighter blue-charcoal
- Primary text: cool off-white
- Secondary text: blue-grey with WCAG AA contrast
- Accent: restrained coral used for primary actions, focus, and small semantic emphasis
- Success: reserved for genuine passing states

No purple AI gradients, section-level theme flips, neon outer glows, or unrelated accent colors.

### Typography

Use a modern sans display and readable sans body family. Monospace is reserved for commands, paths, and compact technical metadata.

The hierarchy relies on scale, weight, spacing, and contrast. Avoid repeated uppercase eyebrows and section numbering.

### Shape and Depth

- Containers: 12-16 pixel radius
- Commands and compact controls: 8-10 pixel radius
- Buttons may use the same compact control radius
- Phone frames follow their native rounded geometry

Depth comes from tinted shadows, controlled overlap, and surface contrast. Avoid glassmorphism as the default material.

### Imagery

The hero and evidence sections use real Flutter golden-test images already committed to the repository. Image generation is not used to fabricate application screens.

### Motion

Allowed motion:

- short hero entrance sequence communicating hierarchy;
- phone composition settling into place;
- skill-registry selection transition;
- copy-button and tab feedback;
- restrained viewport reveals for major sections.

Animate only transform and opacity. Honor `prefers-reduced-motion`, where all content appears immediately and state changes remain understandable.

## Responsive Behavior

Required verification widths:

- 390 pixels
- 768 pixels
- 1024 pixels
- 1440 pixels

Every multi-column section defines an explicit mobile collapse. Navigation becomes a compact menu when its links no longer fit. Installation commands scroll internally when necessary and never expand the page width.

The page must have no horizontal overflow at any required width.

## Accessibility

- Semantic landmarks and heading order
- Skip link
- Keyboard-operable skill and agent selectors
- Visible focus with minimum 3:1 focus-indicator contrast
- WCAG AA text and control contrast
- Descriptive screenshot alternatives
- Minimum 44-pixel touch targets where controls are used on mobile
- Reduced-motion behavior
- Copy feedback announced through a polite live region

## Performance

- Static HTML, CSS, and lightweight JavaScript remain acceptable and preferred for the existing repository.
- Reserve image dimensions to prevent layout shift.
- Load only hero-critical images eagerly; defer evidence images below the fold.
- Avoid scroll listeners and large animation dependencies.
- Target LCP below 2.5 seconds and CLS below 0.1 on a typical mobile connection.

## Content Rules

- No claim of a $100 million valuation, revenue, customer base, or adoption.
- No model-performance comparison until a reproducible benchmark exists.
- No star solicitation in product copy.
- No fabricated testimonials, company logos, download counts, or precision metrics.
- No em dash characters in visible page copy.
- Use plain technical language and one consistent voice.

## Validation

Before publication:

1. Run repository validation and unit tests.
2. Exercise copy buttons, tabs, keyboard navigation, and internal anchors.
3. Inspect screenshots at all required widths.
4. Test reduced motion.
5. Check heading structure, alternatives, focus order, and contrast.
6. Confirm every install command against the repository's actual packaging.
7. Confirm every screenshot and source link resolves publicly.
8. Run an automated Lighthouse or equivalent audit where the local environment permits it.

## Scope

In scope:

- redesign `docs/index.html` and its local assets;
- refine public-facing README ordering if needed to match the new positioning;
- use existing verified Flutter outputs as visual proof;
- preserve the current GitHub Pages route and repository identity.

Out of scope:

- changing the seven skills' behavior;
- creating another demo mobile application;
- inventing a benchmark or model comparison;
- changing repository ownership, route, or licensing;
- publishing community posts as part of the redesign implementation.
