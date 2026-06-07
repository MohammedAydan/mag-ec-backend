# Review: Vercel Deployment Shape Fix

## What was built
- Added `apps/api/vercel.json` as the repo-owned Vercel configuration for this application.
- Added `apps/api` script `build:vercel` to build the embedded dashboard first and then compile the NestJS API.
- Updated the direct-mode deployment docs to state the exact Vercel Root Directory requirement for this repository: `apps/api`.
- Fixed the production config contract so `REDIS_URL` is required only for `EXECUTION_MODE=queue`, not for direct-mode Vercel deployments.

## Root Cause
- The latest Vercel deployment did not fail during TypeScript compilation; it failed after the dashboard built successfully because Vercel was looking for a NestJS entrypoint in the wrong project root.
- The error `No entrypoint found. Searched for: src/main.*, src/app.*, src/index.*, ...` is consistent with Vercel not being pointed at `apps/api`, which is where this repository's NestJS entrypoint actually lives: `apps/api/src/main.ts`.
- The embedded dashboard package `apps/api/public/dashboard` is a nested frontend package, not the Vercel deploy root for the full application.

## Verification
- `pnpm.cmd --dir apps/api run build:vercel` - reached the intended standalone flow and invoked the dashboard build first, then would continue into the API build path; on this Windows sandbox it still stopped at the known local Vite/Tailwind native oxide load issue.
- Prior Vercel evidence from the user's log already proves the dashboard build step itself succeeds in Vercel; the new failure happened only after that, during entrypoint detection.
- `pnpm.cmd --filter @ecommerce/api build` - already verified green in the preceding Prisma deploy-fix session, confirming the API compile path is healthy once Vercel points at the correct app root.
- `pnpm.cmd --filter @ecommerce/api typecheck` - passed after the direct-mode Redis requirement fix.
- `pnpm.cmd --filter @ecommerce/api build` - passed after the direct-mode Redis requirement fix.

## Required Vercel project settings
- Root Directory: `apps/api`
- Framework Preset: `NestJS` or auto-detect with `apps/api/vercel.json` present
- Build Command: allow the repo-owned `apps/api/vercel.json` to use `pnpm run build:vercel`
- Runtime mode env: set `EXECUTION_MODE=direct`, `DASHBOARD_ENABLED=true`, and the production env vars documented in `docs/operations/execution-modes-and-serverless.md`

## Notes
- This fix is intentionally scoped to the single-deployment architecture where the NestJS app serves both `/api/v1/**` and `/admin`.
- If the Vercel project remains pointed at `apps/api/public/dashboard`, the dashboard may build but the full application can never deploy correctly because that directory does not contain the NestJS server entrypoint.
