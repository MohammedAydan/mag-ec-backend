# Tech Stack

## Runtime

| Layer           | Technology | Version                          | Notes                                          |
| --------------- | ---------- | -------------------------------- | ---------------------------------------------- |
| Language        | TypeScript | 6.0.3                            | Strict mode with `NodeNext` module settings    |
| Runtime         | Node.js    | 24 LTS target, local 25.9.0 used | Local machine runtime differs from target line |
| Package Manager | pnpm       | 10.33.2                          | Workspace root package manager                 |

## Frontend

| Layer                 | Technology                       | Version         | Notes                                     |
| --------------------- | -------------------------------- | --------------- | ----------------------------------------- |
| Storefront client     | Flutter                          | External client | Consumes generated Dart/Dio client        |
| Admin client          | Flutter web or separate frontend | External client | Consumes admin API contract               |
| API client generation | OpenAPI Generator `dart-dio`     | Planned         | Backend now emits repo-level OpenAPI JSON |

## Backend

| Layer             | Technology                              | Version                                | Notes                                                                           |
| ----------------- | --------------------------------------- | -------------------------------------- | ------------------------------------------------------------------------------- |
| Framework         | NestJS                                  | 11.1.23 core / 11.1.23 Fastify adapter | API scaffolded in phase 00                                                      |
| HTTP adapter      | Fastify                                 | 5.8.5                                  | Via `@nestjs/platform-fastify`                                                  |
| ORM               | Prisma ORM                              | 7.8.0                                  | Prisma 7 config file pattern plus MariaDB driver adapter                        |
| Validation        | `class-validator` + `class-transformer` | 0.15.1 / 0.5.1                         | Global validation pipeline                                                      |
| Config validation | `@nestjs/config` + `joi`                | 4.0.4 / 18.2.1                         | Typed config loading plus Joi validation                                        |
| Authentication    | `@nestjs/jwt` + Argon2                  | `@nestjs/jwt` 11.0.2, Argon2 0.44.0    | Access tokens, rotating refresh sessions, and root Prisma seed password hashing |
| Payments          | Stripe Node SDK                         | 22.1.1                                 | Phase 09 PaymentIntent creation and webhook verification                        |
| Jobs and queues   | BullMQ + `@nestjs/bullmq` + Redis       | 5.77.2 / 11.0.4 / 5.10.1               | Queue bootstrap and worker scaffold added in phase 01                           |
| Logging           | Pino + `nestjs-pino`                    | 10.3.1 / 4.6.1                         | Structured logs with request IDs and redaction                                  |
| Health checks     | `@nestjs/terminus`                      | 11.1.1                                 | Liveness and readiness probes                                                   |
| Storage SDK       | AWS SDK v3 S3 client                    | TBD during phase 03                    | Presigned uploads/downloads                                                     |

## Infrastructure

| Layer            | Technology                                                 | Notes                                                                  |
| ---------------- | ---------------------------------------------------------- | ---------------------------------------------------------------------- |
| Database         | MySQL 8.4 LTS                                              | InnoDB, utf8mb4, UTC timestamps                                        |
| Database adapter | `@prisma/adapter-mariadb` + `mariadb`                      | Prisma 7 client runtime connection path                                |
| Cache / queues   | Redis                                                      | Rate limits, cache, BullMQ transport                                   |
| Object storage   | S3-compatible bucket storage                               | Public and private buckets                                             |
| Hosting          | Dockerized deployment target                               | Exact platform not chosen yet                                          |
| CI/CD            | GitHub Actions                                             | Validation workflow plus MySQL/Redis service-container integration job |
| Monitoring       | Structured logs first; Sentry/OpenTelemetry optional later | Final tooling decided in hardening phase                               |

## Dev Tooling

| Tool                 | Version                                   | Config File                                                 |
| -------------------- | ----------------------------------------- | ----------------------------------------------------------- | --------------------------------------------------------------------- |
| Linter               | ESLint                                    | 10.4.0                                                      | `eslint.config.mjs`                                                   |
| Formatter            | Prettier                                  | 3.8.3                                                       | `.prettierrc.json`                                                    |
| Testing              | Jest + Supertest + Nest testing utilities | 30.4.2 / 7.2.2 / 11.1.23                                    | `apps/api/test/*.config.ts`                                           |
| Integration DB tests | Jest + opt-in MySQL integration specs     | Current local run skips unless `RUN_MYSQL_INTEGRATION=true` |
| Script typecheck     | TypeScript project for root scripts       | TypeScript 6.0.3                                            | `tsconfig.scripts.json` covers `scripts/**/*.ts` and `prisma/**/*.ts` |
| Git hooks            | Husky + lint-staged optional              | TBD during phase 00                                         | Add only if justified                                                 |

## Key Conventions

- API routes are versioned under `/api/v1`.
- OpenAPI is the source contract for generated Flutter clients.
- Money is represented in integer minor units plus ISO currency code.
- IDs should be application-generated and database-portable.
- Critical business rules live in application/domain services, not controllers or raw queries.
- Migrations are append-only; never rewrite applied production migrations.
