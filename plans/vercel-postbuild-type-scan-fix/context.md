# Context: Vercel Postbuild Type Scan Fix

## Files to Create / Modify
- `apps/api/tsconfig.json` - exclude nested dashboard source/output from API scans
- `apps/api/tsconfig.build.json` - preserve scan exclusions for build config consumers
- `apps/api/vercel.json` - exclude dashboard source from the Nest function bundle and include built admin assets
- `apps/api/src/modules/persistence/services/prisma-schema-guard.service.ts` - remove unsupported `Error` overload usage
- `plans/vercel-postbuild-type-scan-fix/review.md` - outcome and verification
- `plans/context.md` - active feature/status update
- `plans/SESSION_LOG.md` - append handoff entry

## Source Inputs
- User-provided Vercel log from 2026-06-07 07:44 UTC
- `apps/api/tsconfig.json`
- `apps/api/tsconfig.build.json`
- `apps/api/src/modules/persistence/services/prisma-schema-guard.service.ts`

## New Dependencies
- None

## Env Vars Needed
- None

## Open Questions
- None. The latest log shows the dashboard package already builds successfully; the failure is Vercel's postbuild API scan including nested dashboard source files.
