# Context: Vercel Runtime Diagnostics

## Files to Create / Modify
- `apps/api/api/diagnostics.ts` - standalone Vercel Function that does not import NestJS, Prisma, or app modules
- `plans/vercel-runtime-diagnostics/review.md` - usage and verification notes
- `plans/context.md` - active feature/status update
- `plans/SESSION_LOG.md` - append handoff entry

## Source Inputs
- User-provided deployed Vercel runtime error:
  - `500: INTERNAL_SERVER_ERROR`
  - `Code: FUNCTION_INVOCATION_FAILED`
  - ID: `fra1::hllmf-1780953914781-e37186fc4ebd`
- Current crash still occurs after commit `b199753 fix(vercel): allow direct-mode cold starts`

## New Dependencies
- None

## Env Vars Needed
- None for diagnostics to run.
- Diagnostic output checks presence/readiness for `DATABASE_URL`, JWT secrets, maintenance secret, execution mode, dashboard setting, optional providers, and schema guard setting.

## Open Questions
- The exact Vercel function logs are still not available locally.
