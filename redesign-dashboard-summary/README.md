# Dashboard Redesign Summary Package

This folder is a handoff package for the embedded admin dashboard redesign in `apps/api/public/dashboard`.

It is intended for another AI agent that needs to:

- understand what was changed,
- understand which official HeroUI guidance informed the work,
- know what has already been verified,
- see the important dashboard file map,
- continue fixing or refining the dashboard without reconstructing session history.

## Recommended reading order

1. `01-project-context.md`
2. `02-work-completed.md`
3. `03-heroui-research.md`
4. `04-dashboard-file-map.md`
5. `05-verification.md`
6. `06-open-issues-and-next-steps.md`
7. `07-next-agent-prompt.md`

## Scope of this package

- Dashboard redesign and dashboard-specific bug-fix work only
- HeroUI theming, forms, dialogs, and structured action-flow migration
- Build and lint verification relevant to the dashboard

## Important boundary

This repository is still primarily a backend workspace. Dashboard work must stay inside:

- `apps/api/public/dashboard`
- generated static output at `apps/api/public/admin`
- Nest-served `/admin` deployment path

## Important caution

The repository worktree contains many unrelated changes outside this package's scope. Use this folder plus the matching planning artifacts under `plans/dashboard-theme-form-system/` before touching unrelated files.
