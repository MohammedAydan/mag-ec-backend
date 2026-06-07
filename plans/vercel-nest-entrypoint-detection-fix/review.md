# Review: Vercel Nest Entrypoint Detection Fix

## What was built
- Updated `apps/api/src/main.ts` to directly import `NestFactory` from `@nestjs/core`.
- Kept `createApiApplication()` as the single runtime app creation path.
- Added a short comment explaining that the direct import exists for Vercel static entrypoint detection.

## Root Cause
- Vercel correctly found `src/main.ts`, but rejected it with `No entrypoint found which imports nestjs`.
- The repository's NestJS app creation is intentionally delegated to `src/bootstrap/create-api-application.ts`, where `NestFactory` is imported.
- Vercel's zero-config NestJS detector only scans the entrypoint file itself for NestJS imports, so the indirect bootstrap import was invisible to the platform detector.

## Verification
- `pnpm.cmd --filter @ecommerce/api typecheck` - passed
- `pnpm.cmd --filter @ecommerce/api build` - passed

## Notes
- The next Vercel build should progress past NestJS entrypoint detection.
- This change does not alter runtime bootstrap behavior; it only makes the existing entrypoint detectable by Vercel.
