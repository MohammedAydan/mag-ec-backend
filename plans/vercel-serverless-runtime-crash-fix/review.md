# Review: Vercel Serverless Runtime Crash Fix

## What was built
- Relaxed production validation for inactive optional integrations so Vercel direct-mode deployments can cold-start without S3 or Resend credentials when those providers are disabled.
- Kept core production boot requirements fail-closed for `DATABASE_URL`, `JWT_ACCESS_SECRET`, `JWT_REFRESH_SECRET`, and `MAINTENANCE_SECRET`.
- Added config validation coverage for:
  - Vercel-style production direct mode with local report storage and disabled email
  - Missing S3 settings when `REPORT_STORAGE_MODE=s3`
  - Missing Resend settings when `EMAIL_PROVIDER=resend`

## Root Cause
- The reported Vercel deployment had already passed build, then failed at request time with `FUNCTION_INVOCATION_FAILED`.
- Current production config validation required S3 and Resend settings unconditionally in production, even for a direct-mode deployment using `REPORT_STORAGE_MODE=local` and `EMAIL_PROVIDER=disabled`.
- That can crash NestJS during cold start before any route can respond, producing Vercel's generic serverless function crash page.

## Required Vercel Environment
- `NODE_ENV=production`
- `EXECUTION_MODE=direct`
- `DATABASE_URL=<production MySQL or PostgreSQL URL>`
- `JWT_ACCESS_SECRET=<32+ character secret>`
- `JWT_REFRESH_SECRET=<32+ character secret>`
- `MAINTENANCE_SECRET=<32+ character secret>`
- Optional: `DASHBOARD_ENABLED=true` if the embedded dashboard should be served at `/admin`
- Optional: `REPORT_STORAGE_MODE=s3` plus all `S3_*` values only if S3-backed report/object storage is enabled
- Optional: `EMAIL_PROVIDER=resend` plus `EMAIL_FROM` and `EMAIL_API_KEY` only if Resend email sending is enabled

## Verification
- `pnpm.cmd --filter @ecommerce/api test:integration -- app-config.spec.ts` - passed
- `pnpm.cmd --filter @ecommerce/api typecheck` - passed
- `pnpm.cmd --filter @ecommerce/api build` - passed

## Notes
- If Vercel still shows `FUNCTION_INVOCATION_FAILED` after redeploy, inspect the serverless logs for the next cold-start blocker. The likely remaining candidates are an invalid `DATABASE_URL`, pending migrations caught by `SCHEMA_GUARD_ENABLED=true`, or missing core production secrets.
