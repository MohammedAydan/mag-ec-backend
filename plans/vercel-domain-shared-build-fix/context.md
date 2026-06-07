# Context: Vercel Domain Shared Build Fix

## Files to Create / Modify
- `apps/api/package.json` - include `@ecommerce/domain-shared` build in `build:vercel`
- `plans/vercel-domain-shared-build-fix/review.md` - root cause, fix, verification
- `plans/context.md` - active feature/status update
- `plans/SESSION_LOG.md` - append handoff entry

## Source Inputs
- User-provided Vercel log from 2026-06-07 07:27 UTC
- `packages/domain-shared/package.json`
- `tsconfig.base.json`
- `apps/api/src/modules/storage/object-storage.service.ts`

## New Dependencies
- None

## Env Vars Needed
- None

## Open Questions
- None; the build dependency is explicit from the current TypeScript path mapping.
