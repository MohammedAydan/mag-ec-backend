# Context: Vercel Prisma Build Fix

## Files to Create / Modify
- `package.json` - ensure the workspace build path generates Prisma before compile steps
- `apps/api/package.json` - add Prisma generation to API-local compile paths if needed
- `plans/vercel-prisma-build-fix/review.md` - capture root cause, fix, and verification
- `plans/context.md` - update active feature/status
- `plans/SESSION_LOG.md` - append handoff entry

## Source Inputs
- User-provided Vercel build log from 2026-06-07
- `package.json`
- `apps/api/package.json`
- `prisma/schema.prisma`

## New Dependencies
- None expected

## Env Vars Needed
- None for the build-fix itself

## Open Questions
- Whether to also commit a pnpm `allowBuilds` policy for Prisma-related packages, or rely only on explicit generation in repo scripts
