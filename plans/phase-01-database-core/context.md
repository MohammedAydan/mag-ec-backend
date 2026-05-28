# Phase 01 Context

## Files to Create / Modify

- `prisma/schema.prisma`
- `prisma/migrations/**`
- `prisma/seed.ts`
- `apps/api/src/modules/persistence/**`
- `apps/api/src/modules/queue/**`
- `apps/worker/src/**`
- `apps/api/test/integration/**`
- `.github/workflows/ci.yml`
- `scripts/run-mysql-integration.ts`
- `docs/domain/**`
- `docs/adr/**`

## New Dependencies to Add

- Added in phase 01:
  - `@nestjs/bullmq`
  - `bullmq`
  - `ioredis`
  - `argon2`
  - `@prisma/adapter-mariadb`
  - `mariadb`

## Env Vars Needed

- Database connection settings
- Redis connection settings
- Optional seed bootstrap credentials for local development only
- `QUEUE_PREFIX`
- `QUEUE_ENABLED`
- `DEV_SEED_ADMIN_EMAIL`
- `DEV_SEED_ADMIN_PASSWORD`
- `RUN_MYSQL_INTEGRATION`

## Files Created in This Phase

- `prisma/seed.ts`
- `prisma/migrations/20260525_01_core_init/migration.sql`
- `prisma/migrations/migration_lock.toml`
- `apps/api/src/modules/persistence/**`
- `apps/api/src/modules/queue/**`
- `apps/worker/src/config/worker.config.ts`
- `apps/worker/src/processors/maintenance.processor.ts`
- `apps/worker/src/worker.module.ts`
- `apps/api/test/integration/persistence.integration.spec.ts`
- `apps/api/test/integration/seed.integration.spec.ts`
- `apps/api/test/integration/support/mysql-test-client.ts`
- `scripts/run-mysql-integration.ts`
- `docs/domain/database-core.md`

## Open Questions

- Exact role/permission granularity for initial admin permissions
- Whether audit log storage should include diff snapshots at this stage or just structured change metadata
- Whether testcontainers should be adopted later if service-container CI proves brittle or too slow
