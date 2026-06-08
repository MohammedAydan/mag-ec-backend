# Review: Vercel Production Environment Normalization

## What was built
- Vercel production deployments now resolve `nodeEnv=production` from `VERCEL_ENV=production` even when `NODE_ENV` is missing or incorrectly set to `development`.
- `ConfigModule` validation now runs against normalized env values, including quoted-empty strings such as `""`.
- Direct mode no longer defaults `redisUrl` to `redis://localhost:6379`; Redis remains empty unless queue mode is selected or `REDIS_URL` is explicitly set.
- JWT access and refresh secrets are derived as stable SHA-256 labels from a strong maintenance secret when explicit JWT env vars are absent or quoted-empty.
- Weak non-empty JWT secrets still fail validation.
- `/api/diagnostics` now reports raw/effective node environment, Vercel env, and effective JWT readiness.
- Root `prisma:generate` now uses provider-aware `prisma.config.ts` instead of hardcoding the MySQL schema.
- Explicit provider scripts remain available as `prisma:generate:mysql`, `prisma:generate:pg`, `prisma:validate:mysql`, and `prisma:validate:pg`.
- `prisma.config.ts` now treats `VERCEL_ENV=production` as production for Prisma CLI fail-closed behavior.
- The temporary standalone Vercel `/api/diagnostics` function was removed after production boot was confirmed, because it reserved the `/api/*` namespace before the Nest function.
- API TypeScript coverage is back to the Nest source and test tree only.

## Vercel MCP Evidence
- Project: `mag-ec` (`prj_hyV0gDSDW9ttiDaOSvutHNg25TDl`)
- Latest deployment before the fix: `dpl_7KncRDjZ1pBmA8EvHXiQDP2Yvg2Y`
- `/api/diagnostics` returned `200`, proving standalone Vercel Node functions work.
- `/admin` returned `FUNCTION_INVOCATION_FAILED`, proving the crash was inside NestJS bootstrap.
- Diagnostics showed `NODE_ENV=development`, `VERCEL_ENV=production`, direct mode, valid `DATABASE_URL`, invalid quoted-empty JWT secrets, and valid maintenance secret.
- Runtime logs for `/` and `/admin` showed `redis://localhost` fragments, confirming development/default Redis config leaked into serverless production startup.
- After the environment fix deployed, `/api/diagnostics` showed effective production mode and valid core readiness, but `/admin` still returned `500`.
- Local source-level bootstrap with a Vercel-style Postgres `DATABASE_URL` reproduced the remaining crash as a Prisma adapter/provider mismatch: runtime selected `@prisma/adapter-pg`, while the generated client came from `prisma/schema.prisma`.
- Vercel build logs showed `apps/api` calls `pnpm --dir ../.. prisma:generate`, and the root script previously forced `--schema prisma/schema.prisma`.
- Commit `31269b3` deployed successfully and Vercel build logs showed `prisma/schema.postgresql.prisma` was selected.
- Production `/admin` returned `200`, proving the serverless crash page was cleared.
- Production `/api/v1/health/liveness` then returned Vercel `404`, proving the temporary standalone diagnostics function was shadowing the Nest `/api/*` namespace.

## Verification
- `pnpm.cmd --filter @ecommerce/api test:integration -- app-config.spec.ts` - passed
- `pnpm.cmd --filter @ecommerce/api typecheck` - passed
- `pnpm.cmd --filter @ecommerce/api build` - passed
- Built `/api/diagnostics` invocation with Vercel-style env returned `200` and reported `nodeEnvEffective=production`
- Live verification after commit `7800d5b` showed `NODE_ENV=development` was explicitly present on Vercel, so the follow-up patch makes `VERCEL_ENV=production` override `NODE_ENV=development`.
- `DATABASE_URL=postgresql://... VERCEL_ENV=production pnpm.cmd prisma:generate` - passed and loaded `prisma/schema.postgresql.prisma`
- `DATABASE_URL=postgresql://... VERCEL_ENV=production pnpm.cmd --filter @ecommerce/api typecheck` - passed
- `DATABASE_URL=postgresql://... VERCEL_ENV=production pnpm.cmd --filter @ecommerce/api test:integration -- app-config.spec.ts` - passed
- `DATABASE_URL=postgresql://... VERCEL_ENV=production pnpm.cmd --filter @ecommerce/api build` - passed and loaded `prisma/schema.postgresql.prisma`
- After removing the standalone diagnostics function:
  - `DATABASE_URL=postgresql://... VERCEL_ENV=production pnpm.cmd --filter @ecommerce/api typecheck` - passed
  - `DATABASE_URL=postgresql://... VERCEL_ENV=production pnpm.cmd --filter @ecommerce/api test:integration -- app-config.spec.ts` - passed
  - `DATABASE_URL=postgresql://... VERCEL_ENV=production pnpm.cmd --filter @ecommerce/api build` - passed and loaded `prisma/schema.postgresql.prisma`

## Notes
- Explicit `JWT_ACCESS_SECRET` and `JWT_REFRESH_SECRET` are still recommended. The fallback derivation prevents quoted-empty Vercel env values from crashing the deployment when a strong maintenance secret exists.
- `DATABASE_URL` still must point to a Vercel-reachable database.
