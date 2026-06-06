# Project Context

## Repository

- Repo: `D:\Projects\NodeJS-Projects\e-commerce-api-d`
- Main product: modular monolith e-commerce backend API
- Embedded dashboard location: `apps/api/public/dashboard`
- Built dashboard output: `apps/api/public/admin`
- Served route: `/admin`

## Dashboard goal

Refine the embedded admin dashboard into a HeroUI-first application with:

- persistent light, dark, and system themes,
- accessible structured forms and dialogs,
- removal of raw JSON-style action entry,
- cleaner shell and login experience,
- compatibility with the locally installed HeroUI v3 contract.

## Current status

The dashboard redesign feature is complete in planning terms and verified by lint, typecheck, dashboard build, and workspace build.

## Constraints

- No new backend API scope was introduced as part of the redesign.
- Dashboard work must remain embedded in the existing backend workspace.
- Existing large frontend chunk warning is not yet solved.
- Browser-based visual QA was not run during the redesign session.

## Relevant planning artifacts

- `plans/dashboard-theme-form-system/plan.md`
- `plans/dashboard-theme-form-system/tasks.md`
- `plans/dashboard-theme-form-system/context.md`
- `plans/dashboard-theme-form-system/review.md`
- `plans/context.md`
- `plans/SESSION_LOG.md`

## Worktree caveat

The repo has many unrelated modified and untracked files outside the dashboard redesign scope. Do not assume every dirty file is part of this package.
