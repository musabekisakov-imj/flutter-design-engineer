# GitHub Sponsors integration

## Goal

Make the newly approved GitHub Sponsors profile discoverable without weakening the website's primary install journey.

## Approved direction

Use GitHub Sponsors as the single funding provider. Add GitHub's native repository Sponsor button through `.github/FUNDING.yml`, then add one compact support section between the final install CTA and the footer. Do not add popups, payment forms, Stripe embeds, Wise details, or invented funding claims.

## Website composition

The support section uses the existing dark product language and a contained two-column panel. The left side explains that sponsorship funds new Flutter workflows, deterministic fixtures, and visual-QA research. The right side contains one lime `Sponsor on GitHub` action with a heart icon and a short trust note stating that payment is handled by GitHub Sponsors.

On narrow screens the panel stacks, the button becomes full-width, and reading order remains copy then action. The link must have a visible focus state, a descriptive accessible label, and a privacy-safe `sponsor_open` analytics event.

## Repository integration

Create `.github/FUNDING.yml` with `musabekisakov-imj` as the GitHub Sponsors account. Add a small support entry to the README so users who never visit the website can still find the official profile.

## Verification

- Run repository validation and unit tests.
- Confirm the funding configuration contains only the approved GitHub username.
- Inspect the website at desktop and mobile widths for overflow, hierarchy, focus, and readable stacking.
- Verify the public Sponsors URL and GitHub Pages deployment after merge.

