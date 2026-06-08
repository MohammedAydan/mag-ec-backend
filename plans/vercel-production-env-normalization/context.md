# Context: Vercel Production Environment Normalization

## Files to Create / Modify
- `apps/api/src/config/app.config.ts` - env normalization, effective production detection, direct-mode Redis config, derived JWT secrets
- `apps/api/src/app.module.ts` - validate normalized env
- `apps/api/test/integration/app-config.spec.ts` - regression tests for Vercel production env without `NODE_ENV`
- `apps/api/api/diagnostics.ts` - report Vercel env/effective production metadata
- `plans/vercel-production-env-normalization/review.md` - outcome and Vercel evidence
- `plans/context.md` - active feature/status update
- `plans/SESSION_LOG.md` - append handoff entry

## Vercel MCP Evidence
- Project: `mag-ec`
- Project ID: `prj_hyV0gDSDW9ttiDaOSvutHNg25TDl`
- Team ID: `team_Qq3tsxscpbLD8lNXb8QoxjOc`
- Latest deployment: `dpl_7KncRDjZ1pBmA8EvHXiQDP2Yvg2Y`
- `/api/diagnostics` returns 200, proving Vercel routing and standalone Node functions work.
- Diagnostics showed:
  - `nodeEnv`: `development`
  - `executionMode`: `direct`
  - `databaseUrl.valid`: `true`
  - `jwtAccessSecret.length`: `2`, invalid
  - `jwtRefreshSecret.length`: `2`, invalid
  - `maintenanceSecret.valid`: `true`
- Runtime logs for `/admin` and `/` show 500s with `redis://localhost` fragments, indicating development/direct-mode defaults are leaking into serverless production bootstrap.

## New Dependencies
- None

## Env Vars Needed
- Required: valid `DATABASE_URL`
- Required: strong `MAINTENANCE_SECRET` or `CRON_SECRET`
- Recommended: explicit strong `JWT_ACCESS_SECRET` and `JWT_REFRESH_SECRET`; if absent/empty, the app derives stable JWT secrets from the maintenance secret.

## Open Questions
- Exact full Vercel log message remains truncated by the MCP table output, but diagnostics and log fragments identify the production-env normalization problem.
