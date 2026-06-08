# Plan: Vercel Production Environment Normalization

## Goal
Make Vercel production deployments boot through production-safe direct-mode defaults even when `NODE_ENV` is missing and optional env values are accidentally set to quoted-empty strings.

## Acceptance Criteria
- [ ] Vercel runtime with `VERCEL_ENV=production` is treated as production even when `NODE_ENV` is unset
- [ ] Direct mode does not default `redisUrl` to `redis://localhost:6379`
- [ ] Quoted-empty env values such as `""` are normalized to empty
- [ ] JWT secrets can be derived from a strong maintenance secret when explicit JWT env vars are absent/empty
- [ ] Weak non-empty JWT secrets still fail validation
- [ ] Focused config tests cover the observed Vercel diagnostics state
- [ ] Vercel build generates Prisma Client from the schema matching `DATABASE_URL`
- [ ] API typecheck/build pass
- [ ] Session state documents the Vercel MCP evidence and final env behavior

## Approach
1. Add config helpers for env normalization, production environment resolution, and derived secret handling.
2. Update `AppModule` validation to normalize Vercel env before Joi validation.
3. Update direct-mode Redis config so Redis remains empty unless queue mode is selected or explicitly configured.
4. Add tests matching the observed Vercel state: `VERCEL_ENV=production`, no `NODE_ENV`, direct mode, quoted-empty JWT values, strong maintenance secret.
5. Update diagnostics to report Vercel environment/effective production state.
6. Make root Prisma generation provider-aware through `prisma.config.ts` so Vercel Postgres URLs generate the PostgreSQL client.
7. Verify, commit, push, and re-check the deployed `/admin` path through Vercel MCP.

## Scope: IN
- API config normalization and validation
- Diagnostic endpoint metadata
- Focused config tests
- Planning/session docs
- Provider-aware Prisma CLI generation for Vercel builds

## Scope: OUT
- Database schema/migration changes
- Dashboard UI redesign
- Vercel project manual env editing
- Redis or queue-mode deployment

## Dependencies
- Vercel runtime provides `VERCEL_ENV=production` for production deployments.
- Production deploy still needs a valid `DATABASE_URL` and strong `MAINTENANCE_SECRET`.

## Estimated Complexity: M
