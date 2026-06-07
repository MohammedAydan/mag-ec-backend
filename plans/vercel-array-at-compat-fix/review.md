# Review: Vercel Array.at Compatibility Fix

## What was built
- Replaced `items.at(-1)` cursor extraction in catalog admin product pagination with ES2020-compatible indexed access.
- Replaced `items.at(-1)` cursor extraction in payment admin pagination with ES2020-compatible indexed access.
- Confirmed no `.at()` calls remain under `apps/api/src`.

## Root Cause
- The Vercel build progressed through dashboard build, API build, dashboard source prune, and then failed in the postbuild TypeScript scan.
- That scan reported `Array.prototype.at` as unavailable, even though the repository base tsconfig targets `ES2023`.
- Avoiding `.at()` in deploy-scanned API source is the lowest-risk fix because it preserves behavior without depending on Vercel's scan lib settings.

## Verification
- `rg "\.at\(" apps/api/src -n` - no matches
- `pnpm.cmd --filter @ecommerce/api typecheck` - passed
- `pnpm.cmd --filter @ecommerce/api build` - passed

## Notes
- The next Vercel build should progress past `catalog-admin.service.ts(93,50)`.
- If Vercel reports another postbuild scan error, treat that log as authoritative because it is now past the repo-owned build command.
