# Phase 00 Context

## Files to Create / Modify

- `package.json`
- `pnpm-workspace.yaml`
- `apps/api/**`
- `apps/worker/**`
- `packages/contracts/**`
- `packages/domain-shared/**`
- `prisma/**`
- `docker-compose.yml`
- `docker/**`
- `.env.example`
- `.github/workflows/**`
- `docs/**`

## Files Created in This Phase

- Workspace and tooling: `package.json`, `pnpm-workspace.yaml`, `tsconfig.base.json`, `eslint.config.mjs`, `.prettierrc.json`, `.env.example`, `docker-compose.yml`
- API app: `apps/api/src/**`, `apps/api/test/**`, `apps/api/package.json`, `apps/api/tsconfig*.json`
- Worker app: `apps/worker/src/main.ts`, `apps/worker/package.json`, `apps/worker/tsconfig*.json`
- Shared package: `packages/domain-shared/**`
- Contracts: `packages/contracts/openapi/openapi.json`
- Prisma: `prisma/schema.prisma`, `prisma.config.ts`
- CI: `.github/workflows/ci.yml`, `.github/workflows/security.yml`
- Documentation: `docs/implementation-status.md`, `docs/adr/**`, `docs/api/error-codes.md`, `docs/operations/**`, `docs/security/control-matrix.md`

## New Dependencies to Add

- Installed in phase 00:
  - Runtime/tooling: `typescript`, `tsx`, `eslint`, `prettier`, `typescript-eslint`, `@eslint/js`, `globals`, `dotenv`
  - API runtime: `@nestjs/common`, `@nestjs/core`, `@nestjs/config`, `@nestjs/platform-fastify`, `@nestjs/swagger`, `@nestjs/terminus`, `@nestjs/throttler`, `fastify`, `@fastify/cors`, `@fastify/helmet`, `@fastify/static`, `class-validator`, `class-transformer`, `joi`, `nestjs-pino`, `pino`, `reflect-metadata`, `rxjs`, `@prisma/client`
  - Testing: `@nestjs/testing`, `jest`, `ts-jest`, `supertest`, `@types/jest`, `@types/supertest`
  - Prisma CLI: `prisma`

## Env Vars Needed

- Core runtime settings
- Database URL
- Redis URL
- JWT secrets and expirations
- S3-compatible storage credentials
- Optional payment, email, and push placeholders
- Logging and public URL settings

## Open Questions

- Whether to add an enforced Node version pin (`.nvmrc`, Volta, or equivalent) to eliminate the current Node 24 target vs Node 25 local-runtime mismatch
- Whether local integration tests should use Docker Compose services or Testcontainers as the primary approach
- Whether docs exposure should be disabled in production by default or gated by environment flag only
