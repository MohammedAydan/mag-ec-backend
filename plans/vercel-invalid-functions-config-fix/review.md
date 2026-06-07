# Review: Vercel Invalid Functions Config Fix

## What was built
- Removed the invalid `functions.src/main.ts` block from `apps/api/vercel.json`.
- Added `apps/api/scripts/prune-vercel-dashboard-source.mjs`, a Vercel-only cleanup script that removes `public/dashboard` after dashboard assets have already been built into `public/admin` and copied for the API build.
- Updated `build:vercel` to run the prune script as the final step.
- Corrected the Vercel deployment docs, ADR-019, and the embedded SPA pattern so they no longer recommend `vercel.json.functions` for `src/main.ts`.

## Root Cause
- Vercel accepts `functions` configuration only for Serverless Functions inside an `api` directory.
- The NestJS framework detector accepts `src/main.ts` as the application entrypoint, but `functions.src/main.ts` is not a valid function pattern.
- The previous config therefore failed before dependency install or build command execution.

## Verification
- `Get-Content apps/api/vercel.json | ConvertFrom-Json | Out-Null` - passed
- `node scripts/prune-vercel-dashboard-source.mjs` from `apps/api` - passed and skipped outside Vercel
- `pnpm.cmd --filter @ecommerce/api typecheck` - passed
- `pnpm.cmd --filter @ecommerce/api build` - passed
- `pnpm.cmd --dir apps/api run build:vercel` - reached the dashboard build step but failed locally on the known Windows Tailwind oxide native-load issue; this is not the Vercel-reported config failure, and Vercel Linux logs already show the dashboard build passes there

## Notes
- The next Vercel build should no longer fail with `The pattern "src/main.ts" defined in functions doesn't match any Serverless Functions inside the api directory`.
- After the Vercel build command completes, `public/dashboard` should be removed from the ephemeral build directory so Vercel's later scan cannot compile dashboard `.tsx` source as API code.
