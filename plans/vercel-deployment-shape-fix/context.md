# Context: Vercel Deployment Shape Fix

## Files to Create / Modify
- `apps/api/package.json` - add a standalone Vercel build script for the API-root deployment
- `apps/api/vercel.json` - repo-owned Vercel config for the intended deploy root
- `docs/operations/execution-modes-and-serverless.md` - document the exact Vercel root-directory expectation
- `plans/vercel-deployment-shape-fix/review.md` - capture root cause, fix, and verification
- `plans/context.md` - update active feature/status
- `plans/SESSION_LOG.md` - append handoff entry

## Source Inputs
- User-provided Vercel log from 2026-06-07 07:09 UTC
- `apps/api/vercel.direct.example.json`
- Vercel NestJS entrypoint detection docs
- Existing direct-mode execution docs

## New Dependencies
- None expected

## Env Vars Needed
- Same direct-mode Vercel env vars already documented for `apps/api`

## Open Questions
- None in code; the Vercel project root must point to `apps/api` for the app-root config to apply
