# Context: Vercel Serverless Runtime Crash Fix

## Files to Create / Modify
- `apps/api/src/config/app.config.ts` - relax validation for inactive optional integrations while preserving core fail-closed production checks
- `apps/api/src/config/app.config.spec.ts` or existing config test location - add Vercel-style production config coverage
- `plans/vercel-serverless-runtime-crash-fix/review.md` - outcome and deployment notes
- `plans/context.md` - active feature/status update
- `plans/SESSION_LOG.md` - append handoff entry

## Source Inputs
- User-provided deployed Vercel runtime error:
  - `500: INTERNAL_SERVER_ERROR`
  - `Code: FUNCTION_INVOCATION_FAILED`
  - Vercel region/id: `fra1::z9npb-1780952543409-aaae49584fec`
- Current Vercel app root: `apps/api`
- Current Vercel build path: `pnpm run build:vercel`
- Current production config validation in `apps/api/src/config/app.config.ts`

## New Dependencies
- None

## Env Vars Needed
- Core production boot still requires:
  - `DATABASE_URL`
  - `JWT_ACCESS_SECRET`
  - `JWT_REFRESH_SECRET`
  - `MAINTENANCE_SECRET`
- Optional integrations:
  - S3 values only when S3-backed storage/reporting is enabled
  - Resend values only when `EMAIL_PROVIDER=resend`

## Open Questions
- The exact Vercel function log is not available in this session; the fix targets the most likely cold-start crash visible from current config.
