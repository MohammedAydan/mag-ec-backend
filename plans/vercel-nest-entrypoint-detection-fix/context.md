# Context: Vercel Nest Entrypoint Detection Fix

## Files to Create / Modify
- `apps/api/src/main.ts` - direct NestJS import for Vercel detection
- `plans/vercel-nest-entrypoint-detection-fix/review.md` - root cause, fix, verification
- `plans/context.md` - active feature/status update
- `plans/SESSION_LOG.md` - append handoff entry

## Source Inputs
- User-provided Vercel log from 2026-06-07 07:38 UTC
- `apps/api/src/main.ts`
- `apps/api/src/bootstrap/create-api-application.ts`
- Vercel NestJS entrypoint detection docs

## New Dependencies
- None

## Env Vars Needed
- None

## Open Questions
- None. Vercel explicitly found `src/main.ts` but rejected it because direct NestJS imports were not visible in that file.
