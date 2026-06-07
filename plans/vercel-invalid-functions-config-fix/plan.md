# Plan: Vercel Invalid Functions Config Fix

## Goal
Remove the invalid Vercel `functions` pattern and keep dashboard source out of Vercel's postbuild scan through the build pipeline instead.

## Acceptance Criteria
- [ ] `apps/api/vercel.json` no longer defines a `functions` pattern for `src/main.ts`
- [ ] Vercel build command removes `public/dashboard` only after dashboard/API build steps complete
- [ ] The prune step is safe and skips outside Vercel by default
- [ ] API typecheck and build pass locally
- [ ] Session state documents the corrected Vercel approach

## Approach
1. Remove the unsupported `functions.src/main.ts` block.
2. Add a small Node script that prunes `public/dashboard` only when `VERCEL=1`.
3. Run the prune script at the end of `build:vercel`, after `public/admin` has been generated and copied.
4. Verify API compile and config syntax.

## Scope: IN
- `apps/api/vercel.json`
- `apps/api/package.json`
- `apps/api/scripts/prune-vercel-dashboard-source.mjs`
- Vercel deployment docs/plans

## Scope: OUT
- Moving dashboard source folders
- Rewriting the NestJS deployment model
- Deleting repository source files locally

## Dependencies
- Existing dashboard build output: `apps/api/public/admin`
- Existing Vercel environment variable: `VERCEL=1`

## Estimated Complexity: S
