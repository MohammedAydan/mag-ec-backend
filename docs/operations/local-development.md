# Local Development

## Prerequisites

- Node.js 24 LTS target line
- pnpm 10
- Docker Desktop or equivalent local container runtime

## First-Time Setup

```bash
pnpm install
docker compose up -d
pnpm prisma:validate
pnpm prisma:generate
pnpm openapi:generate
pnpm openapi:verify
pnpm dev
```

## Worker

```bash
pnpm worker:dev
```

## Verification

```bash
pnpm lint
pnpm typecheck
pnpm test
pnpm test:integration
pnpm test:integration:mysql
pnpm test:e2e
pnpm flutter:client:verify
pnpm build
```

## MySQL-backed Integration Run

```bash
docker compose up -d
pnpm prisma:generate
pnpm test:integration:mysql
```

The MySQL-backed runner applies the checked-in migration with `prisma migrate deploy`,
executes `prisma db seed`, and then runs the integration Jest suite with
`RUN_MYSQL_INTEGRATION=true`.

If MySQL-backed integration mode is enabled and the database is unreachable, the
integration suite now fails instead of silently returning early. This is
intentional so CI and explicit local verification cannot report a false green result.
