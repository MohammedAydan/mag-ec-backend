# Implementation Status

## Phase 12 Update

- Current phase: `phase-12-hardening-release`
- Status: environment-blocked closeout
- Date: 2026-05-26

### What Was Built

- OpenAPI stability verification through `pnpm openapi:verify`.
- Docker-backed Flutter `dart-dio` client generation workflow through `pnpm flutter:client:verify`.
- CI wiring for OpenAPI verification, Flutter client generation verification, and high/critical production dependency audit.
- Configurable global throttling through `THROTTLE_TTL_MS` and `THROTTLE_LIMIT`.
- Release operations documentation for Flutter client generation, performance/cache posture, monitoring, incident response, staging release, rollback, production smoke tests, and release checklist execution.
- Focused phase-11 admin security E2E coverage.

### Phase 12 Commands Run

```text
pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand phase-11-admin-security
pnpm.cmd lint
pnpm.cmd typecheck
pnpm.cmd test
pnpm.cmd test:e2e
pnpm.cmd test:integration
pnpm.cmd build
pnpm.cmd prisma:validate
pnpm.cmd prisma:generate
pnpm.cmd openapi:verify
pnpm.cmd flutter:client:verify
pnpm.cmd audit --prod
pnpm.cmd security:audit
```

### Phase 12 Verification Results

- `pnpm.cmd lint`: passed
- `pnpm.cmd typecheck`: passed
- `pnpm.cmd test`: passed with 30 unit suites and 143 tests
- `pnpm.cmd test:e2e`: passed with 12 suites and 48 tests
- `pnpm.cmd test:integration`: passed with MySQL-gated suites skipped locally
- `pnpm.cmd build`: passed
- `pnpm.cmd prisma:validate`: passed
- `pnpm.cmd prisma:generate`: passed
- `pnpm.cmd openapi:verify`: passed
- `pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand phase-11-admin-security`: passed with 5 focused security tests
- `pnpm.cmd security:audit`: passed the high/critical gate
- `pnpm.cmd audit --prod`: failed on one moderate transitive Prisma toolchain advisory in `@hono/node-server`; no high or critical advisory was reported
- `pnpm.cmd flutter:client:verify`: blocked locally because Docker is not installed

### Remaining Release Blockers

- Docker is unavailable locally, so Flutter client generation verification cannot be executed on this machine.
- Local MySQL/Redis is unavailable, so real DB-backed migration, seed, and integration execution remain environment-dependent.
- No staging deployment target exists in this workspace, so staging deployment and production smoke-test execution cannot be exercised locally.

### Recommended Next Step

- Run CI or an equivalent Docker/MySQL/Redis-enabled environment to complete `flutter:client:verify`, `test:integration:mysql`, staging deployment, and production smoke-test evidence.

## Phase 11 Update

- Current phase: `phase-11-reviews-notifications-reporting`
- Status: complete
- Date: 2026-05-26

### What Was Built

- Review creation and moderation flows, notification preferences and dispatch records, reporting endpoints with async export support, audit admin browsing, and content or legal-reference APIs.
- Worker-side CSV export generation that persists local result-object keys and export failure state.
- Seeded permissions for the phase-11 admin surfaces and updated OpenAPI output covering the new endpoints.
- Domain docs for reviews, notifications, and reporting.

### Phase 11 Commands Run

```text
pnpm.cmd --filter @ecommerce/api typecheck
pnpm.cmd --filter @ecommerce/worker typecheck
pnpm.cmd --filter @ecommerce/api test
pnpm.cmd --filter @ecommerce/api lint
pnpm.cmd --filter @ecommerce/api build
pnpm.cmd --filter @ecommerce/worker build
pnpm.cmd --filter @ecommerce/api run openapi:generate
pnpm.cmd lint
pnpm.cmd typecheck
pnpm.cmd build
pnpm.cmd openapi:generate
pnpm.cmd test
```

### Phase 11 Verification Results

- `pnpm.cmd lint`: passed
- `pnpm.cmd typecheck`: passed
- `pnpm.cmd test`: passed with 30 unit suites and 143 tests
- `pnpm.cmd build`: passed
- `pnpm.cmd openapi:generate`: passed
- MySQL or Redis-backed migration, seed, and integration verification remain blocked locally because Docker and local database infrastructure are unavailable in this environment

### Recommended Next Phase

- Begin `phase-12-hardening-release` from its planning files.

## Phase

- Current phase: `phase-10-fulfillment-returns-refunds`
- Status: complete
- Date: 2026-05-25

## Verified Baselines

- Node.js target line: `24 LTS`
- Local runtime used in this session: `v25.9.0`
- pnpm: `10.33.2`
- `@nestjs/core`: `11.1.23`
- `@nestjs/platform-fastify`: `11.1.23`
- `@nestjs/swagger`: `11.4.4`
- `fastify`: `5.8.5`
- `prisma`: `7.8.0`
- `@prisma/client`: `7.8.0`
- MySQL target: `8.4 LTS`

## What Was Built

- pnpm workspace with `apps/api`, `apps/worker`, `packages/domain-shared`, and repo-level Prisma/docs/contracts structure
- NestJS 11 API bootstrap on Fastify 5
- Strict TypeScript 6, ESLint 10 flat config, Prettier, Jest test layers, and workspace build scripts
- Configuration validation with Joi and typed app config loading
- Structured logging with `nestjs-pino`, request ID propagation, Fastify helmet/cors, and throttling baseline
- Global error filter with a stable JSON error contract
- Health liveness and readiness endpoints
- OpenAPI generation to `packages/contracts/openapi/openapi.json`
- Prisma 7 schema plus `prisma.config.ts` for datasource configuration
- Docker Compose services for MySQL 8.4, Redis 7, and MinIO-backed S3-compatible local storage
- GitHub Actions CI and security baseline workflows
- Phase-01 core Prisma schema covering users, roles, permissions, refresh sessions, audit logs, idempotency keys, outbox events, and store settings
- MariaDB adapter-backed Prisma runtime service and transaction helper
- Seed script for permissions, `super_admin`, development admin bootstrap, and default store settings
- BullMQ/Redis queue bootstrap in the API app plus worker scaffolding and a maintenance processor
- Initial SQL migration artifact at `prisma/migrations/20260525_01_core_init/migration.sql`
- Opt-in MySQL integration test scaffold, seeded-state integration coverage, and a cross-platform `test:integration:mysql` runner
- GitHub Actions MySQL/Redis service-container job for phase-01 DB-backed integration verification
- Shared MySQL integration test helper plus fail-fast behavior when DB-backed verification is explicitly enabled but the database is unreachable

## Commands Run

```text
node --version
npm.cmd --version
pnpm.cmd --version
npm.cmd view @nestjs/core version
npm.cmd view @nestjs/platform-fastify version
npm.cmd view @nestjs/swagger version
npm.cmd view fastify version
npm.cmd view prisma version
npm.cmd view @prisma/client version
pnpm.cmd add -Dw typescript tsx eslint prettier @eslint/js globals typescript-eslint @types/node prisma
pnpm.cmd add --filter @ecommerce/api @nestjs/common@11.1.23 @nestjs/core@11.1.23 @nestjs/config @nestjs/platform-fastify@11.1.23 @nestjs/swagger@11.4.4 @nestjs/terminus @nestjs/throttler @fastify/cors @fastify/helmet @prisma/client@7.8.0 class-transformer class-validator joi nestjs-pino pino reflect-metadata rxjs swagger-ui-express uuid
pnpm.cmd add --filter @ecommerce/api -D @nestjs/testing @types/jest @types/supertest jest supertest ts-jest
pnpm.cmd add --filter @ecommerce/worker pino
pnpm.cmd add --filter @ecommerce/api fastify @ecommerce/domain-shared@workspace:*
pnpm.cmd add --filter @ecommerce/api @fastify/static
pnpm.cmd add -Dw dotenv
pnpm.cmd add -w @prisma/client@7.8.0
pnpm.cmd add --filter @ecommerce/api @nestjs/bullmq bullmq ioredis argon2
pnpm.cmd add -w @prisma/adapter-mariadb mariadb
pnpm.cmd add --filter @ecommerce/api @prisma/adapter-mariadb mariadb
pnpm.cmd install
pnpm.cmd typecheck
pnpm.cmd lint
pnpm.cmd test
pnpm.cmd test:integration
pnpm.cmd test:e2e
pnpm.cmd build
pnpm.cmd prisma:validate
pnpm.cmd prisma:generate
pnpm.cmd openapi:generate
pnpm.cmd exec prisma migrate diff --from-empty --to-schema prisma\\schema.prisma --script
pnpm.cmd openapi:check
pnpm.cmd prisma:validate
docker --version
docker compose version
```

## Verification Results

- `pnpm.cmd typecheck`: passed
- `pnpm.cmd lint`: passed
- `pnpm.cmd test`: passed
- `pnpm.cmd test:integration`: passed with DB-backed specs skipped because `RUN_MYSQL_INTEGRATION` was not enabled and no local MySQL/Docker runtime exists
- `pnpm.cmd test:e2e`: passed when rerun sequentially; an earlier parallel verification attempt hit a transient pnpm workspace-state parse error
- `pnpm.cmd build`: passed
- `pnpm.cmd prisma:validate`: passed
- `pnpm.cmd prisma:generate`: passed
- `pnpm.cmd openapi:generate`: passed
- `pnpm.cmd openapi:check`: passed
- `pnpm.cmd prisma:migrate:dev`: not run; local Docker/MySQL is unavailable
- `pnpm.cmd prisma:seed`: implemented but not run; local Docker/MySQL is unavailable
- `pnpm.cmd test:integration:mysql`: implemented but not run locally; it now waits for MySQL/Redis readiness and fails loudly if DB-backed tests are explicitly enabled without a reachable database
- `docker --version`: failed because Docker is not installed in the current environment
- `docker compose version`: failed because Docker is not installed in the current environment

## Notable Fixes During Phase

- Switched TypeScript module settings to `NodeNext` for TypeScript 6 compatibility.
- Moved Prisma datasource URL configuration into `prisma.config.ts` to match Prisma 7 requirements.
- Added `@fastify/static` because Nest Swagger UI on Fastify requires the static-assets integration path.
- Adjusted OpenAPI generation to write into the repo-level contract directory instead of the API package working directory.
- Converted Prisma runtime usage to the official Prisma 7 adapter-backed MySQL/MariaDB path.
- Added queue disabling for test and contract-generation boot paths so the app can still boot without Redis during local verification.
- Generated the initial migration SQL from the schema using Prisma diff because a local MySQL runtime was not available for `migrate dev`.

## Unresolved Decisions / Follow-Ups

- Local runtime is Node `25.9.0` while the target line is Node `24 LTS`; add a repo-level version pin such as `.nvmrc` or Volta if strict runtime alignment is required.
- `swagger-ui-express` remains installed from the initial dependency batch even though the Fastify path is in use; it can be removed in a cleanup pass after resolving the local pnpm store-location mismatch encountered during removal.
- Docker/MySQL is not installed locally, so the initial migration was not applied and DB-backed integration execution was not verified end-to-end.
- Phase 01 still needs an actual MySQL-backed `migrate dev` / `db seed` run and real integration execution before it can be marked complete locally, even though CI automation is now in place.

## Recommended Next Phase

- Finish `phase-01-database-core` by applying the migration and running DB-backed verification on a machine with Docker/MySQL available.

## Phase 02 Update

- Current phase: `phase-02-identity-authz`
- Status: complete
- Date: 2026-05-25

### What Was Built

- Identity module controllers for auth entry points, authenticated profile reads, privileged identity access checks, and account-recovery flows.
- `AccountActionToken` Prisma model plus migration artifact for one-time password-reset and email-verification tokens.
- Auth service coverage for registration conflicts, login failure auditing, refresh failure auditing, password resets, email verification, and current-user profile reads.
- RBAC decorators/guards plus `IdentityPolicyService` for object-level access checks.
- New unit, integration, and E2E auth/security coverage plus expanded OpenAPI output and authentication documentation.

### Phase 02 Commands Run

```text
pnpm.cmd prisma:generate
pnpm.cmd --filter @ecommerce/api typecheck
pnpm.cmd --filter @ecommerce/api lint
pnpm.cmd --filter @ecommerce/api build
pnpm.cmd --filter @ecommerce/api test -- --runInBand src/modules/identity
pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand identity-authz
pnpm.cmd --filter @ecommerce/api test:integration
pnpm.cmd openapi:generate
pnpm.cmd lint
pnpm.cmd typecheck
pnpm.cmd build
pnpm.cmd test
pnpm.cmd test:integration
pnpm.cmd test:e2e
pnpm.cmd prisma:validate
pnpm.cmd openapi:check
```

### Phase 02 Verification Results

- `pnpm.cmd prisma:generate`: passed
- `pnpm.cmd lint`: passed
- `pnpm.cmd typecheck`: passed
- `pnpm.cmd build`: passed
- `pnpm.cmd test`: passed with 71 unit tests
- `pnpm.cmd test:integration`: passed with MySQL-gated identity/persistence/seed suites skipped locally because `RUN_MYSQL_INTEGRATION` is not enabled
- `pnpm.cmd test:e2e`: passed with health plus new identity/auth security coverage
- `pnpm.cmd prisma:validate`: passed
- `pnpm.cmd openapi:generate`: passed
- `pnpm.cmd openapi:check`: failed only because the generated OpenAPI contract changed intentionally after the new auth/identity endpoints were added

### Recommended Next Phase

- Begin `phase-03-catalog-media-localization` from its planning files.

## Phase 03 Update

- Current phase: `phase-03-catalog-media-localization`
- Status: complete
- Date: 2026-05-25

### What Was Built

- Catalog Prisma models for product types, brands, categories, collections, tags, attributes, options, products, variants, catalog media, and bilingual translation tables.
- Admin catalog routes for taxonomy creation, product create or update, publish or archive, upload-intent issuance, and media attachment under `/api/v1/catalog/admin/**`.
- Public catalog browse and detail routes with locale-aware DTO mapping, filter parameters, published-only visibility, and attached-media-only exposure.
- Representative fashion and perfume seed content plus the incremental migration artifact at `prisma/migrations/20260525_03_catalog_media_localization/migration.sql`.
- Unit and e2e coverage for translation fallback, media authorization, and catalog admin access control.

### Phase 03 Commands Run

```text
pnpm.cmd prisma:validate
pnpm.cmd prisma:generate
pnpm.cmd --filter @ecommerce/api typecheck
pnpm.cmd --filter @ecommerce/api lint
pnpm.cmd test
pnpm.cmd test:e2e
pnpm.cmd test:integration
pnpm.cmd build
pnpm.cmd openapi:generate
pnpm.cmd lint
pnpm.cmd typecheck
pnpm.cmd openapi:check
pnpm.cmd exec prisma migrate diff --from-schema prisma\\.tmp\\phase03-pre-catalog-schema.prisma --to-schema prisma\\schema.prisma --script --output prisma\\migrations\\20260525_03_catalog_media_localization\\migration.sql
```

### Phase 03 Verification Results

- `pnpm.cmd prisma:validate`: passed
- `pnpm.cmd prisma:generate`: passed
- `pnpm.cmd lint`: passed
- `pnpm.cmd typecheck`: passed
- `pnpm.cmd test`: passed with 79 unit tests
- `pnpm.cmd test:e2e`: passed with health, identity, and catalog admin coverage
- `pnpm.cmd test:integration`: passed with MySQL-gated integration suites skipped locally because `RUN_MYSQL_INTEGRATION` was not enabled
- `pnpm.cmd build`: passed
- `pnpm.cmd openapi:generate`: passed
- `pnpm.cmd openapi:check`: failed only because `packages/contracts/openapi/openapi.json` now intentionally differs from `HEAD` after the uncommitted phase-02 and phase-03 endpoint additions

### Recommended Next Phase

- Begin `phase-04-pricing-store-settings` from its planning files.

## Phase 04 Update

- Current phase: `phase-04-pricing-store-settings`
- Status: complete
- Date: 2026-05-25

### What Was Built

- Variant-level pricing persistence, tax classes, manual tax rates, shipping zones, shipping methods, and the phase-04 incremental migration artifact.
- A dedicated pricing module with money arithmetic, tax strategy abstraction, manual tax implementation, shipping estimation, admin pricing APIs, and a checkout-preview endpoint.
- Seeded pricing permissions, store pricing defaults, manual tax configuration, shipping configuration, and representative prices for the catalog examples.
- Variant price exposure in the public catalog response plus unit, e2e, and MySQL-gated integration coverage for the new slice.

### Phase 04 Commands Run

```text
pnpm.cmd prisma:generate
pnpm.cmd prisma:validate
pnpm.cmd --filter @ecommerce/api typecheck
pnpm.cmd --filter @ecommerce/api lint
pnpm.cmd --filter @ecommerce/api test -- --runInBand pricing-preview money.service
pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand pricing-admin
pnpm.cmd --filter @ecommerce/api test:integration -- --runInBand pricing.integration
pnpm.cmd exec prisma migrate diff --from-schema prisma\\.tmp\\phase04-pre-pricing-schema.prisma --to-schema prisma\\schema.prisma --script --output prisma\\migrations\\20260525_04_pricing_store_settings\\migration.sql
pnpm.cmd lint
pnpm.cmd typecheck
pnpm.cmd test
pnpm.cmd test:e2e
pnpm.cmd test:integration
pnpm.cmd build
pnpm.cmd openapi:generate
pnpm.cmd openapi:check
```

### Phase 04 Verification Results

- `pnpm.cmd prisma:validate`: passed
- `pnpm.cmd prisma:generate`: passed
- `pnpm.cmd lint`: passed
- `pnpm.cmd typecheck`: passed
- `pnpm.cmd test`: passed with 85 unit tests
- `pnpm.cmd test:e2e`: passed with health, identity, catalog admin, and pricing admin coverage
- `pnpm.cmd test:integration`: passed with MySQL-gated integration suites skipped locally because `RUN_MYSQL_INTEGRATION` was not enabled
- `pnpm.cmd build`: passed
- `pnpm.cmd openapi:generate`: passed
- `pnpm.cmd openapi:check`: failed only because `packages/contracts/openapi/openapi.json` now intentionally differs from `HEAD` after the uncommitted phase-04 pricing endpoints were added

### Recommended Next Phase

- Begin `phase-05-promotions-coupons` from its planning files.

## Phase 05 Update

- Current phase: `phase-05-promotions-coupons`
- Status: complete
- Date: 2026-05-25

### What Was Built

- Promotion, coupon, exclusion, and usage-ledger Prisma models plus the incremental migration artifact at `prisma/migrations/20260525_05_promotions_coupons/migration.sql`.
- A dedicated promotions module with coupon normalization, admin upsert APIs, deterministic eligibility evaluation, and audit logging for promotion or coupon changes.
- Pricing-preview integration that returns subtotal discounts, discounted subtotals, applied or rejected promotions, and free-shipping effects.
- Seeded promotion permissions and representative automatic and coupon-based offers for the catalog examples.
- Unit, e2e, and MySQL-gated integration coverage for reward calculation, stacking and exclusion behavior, admin authorization, and relational persistence.

### Phase 05 Commands Run

```text
pnpm.cmd prisma:generate
pnpm.cmd prisma:validate
pnpm.cmd --filter @ecommerce/api typecheck
pnpm.cmd --filter @ecommerce/api lint
pnpm.cmd --filter @ecommerce/api test -- --runInBand promotion-evaluator pricing-preview
pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand promotions-admin
pnpm.cmd --filter @ecommerce/api test:integration -- --runInBand promotions.integration
pnpm.cmd exec prisma migrate diff --from-schema prisma\\.tmp\\phase05-pre-promotions-schema.prisma --to-schema prisma\\schema.prisma --script --output prisma\\migrations\\20260525_05_promotions_coupons\\migration.sql
pnpm.cmd lint
pnpm.cmd test
pnpm.cmd test:e2e
pnpm.cmd test:integration
pnpm.cmd build
pnpm.cmd openapi:generate
pnpm.cmd openapi:check
```

### Phase 05 Verification Results

- `pnpm.cmd prisma:generate`: passed
- `pnpm.cmd prisma:validate`: passed
- `pnpm.cmd lint`: passed
- `pnpm.cmd typecheck`: passed
- `pnpm.cmd test`: passed with 88 unit tests
- `pnpm.cmd test:e2e`: passed with health, identity, catalog admin, pricing admin, and promotions admin coverage
- `pnpm.cmd test:integration`: passed with MySQL-gated integration suites skipped locally because `RUN_MYSQL_INTEGRATION` was not enabled
- `pnpm.cmd build`: passed
- `pnpm.cmd openapi:generate`: passed
- `pnpm.cmd openapi:check`: failed only because `packages/contracts/openapi/openapi.json` now intentionally differs from `HEAD` after the uncommitted phase-04 and phase-05 endpoint additions

### Recommended Next Phase

- Begin `phase-06-inventory-reservations` from its planning files.

## Phase 06 Update

- Current phase: `phase-06-inventory-reservations`
- Status: complete
- Date: 2026-05-25

### What Was Built

- `Warehouse`, `StockLevel`, `StockMovement`, and `StockReservation` Prisma models plus the incremental migration artifact at `prisma/migrations/20260525_06_inventory_reservations/migration.sql`.
- A dedicated `InventoryModule` with `InventoryCoreService` implementing all atomic stock operations: adjust, reserve, release, redeem, and expire.
- Conditional SQL `UPDATE` pattern for oversell prevention — reservations are only accepted when sufficient available stock exists at the database row level.
- Low-stock structured warnings emitted when available units drop below the configurable threshold of 10.
- Admin HTTP API: `POST /inventory/admin/adjustments`, `GET /inventory/admin/levels`, `GET /inventory/admin/movements` guarded by `inventory.write` and `inventory.read` permissions.
- `InventoryExpiryProcessor` BullMQ worker processor in the `apps/worker` app for asynchronous expiry of time-bound reservations.
- Seeded default warehouse and initial 100-unit `StockLevel` for all variant SKUs.
- Unit specs for all five core operations covering happy paths, negative validation, and edge cases.
- MySQL-gated concurrency integration spec verifying oversell prevention under concurrent reservation attempts plus full reservation lifecycle (reserve → redeem / release / expire).
- E2E controller spec verifying RBAC authorization and payload validation for all three admin endpoints.
- Domain documentation at `docs/domain/inventory-invariants.md`.

### Phase 06 Commands to Run

```text
pnpm.cmd prisma:generate
pnpm.cmd prisma:validate
pnpm.cmd --filter @ecommerce/api typecheck
pnpm.cmd --filter @ecommerce/api lint
pnpm.cmd --filter @ecommerce/api test -- --runInBand inventory-core.service
pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand inventory-admin
pnpm.cmd --filter @ecommerce/api test:integration -- --runInBand inventory.integration
pnpm.cmd exec prisma migrate diff --from-schema prisma\.tmp\phase06-pre-inventory-schema.prisma --to-schema prisma\schema.prisma --script --output prisma\migrations\20260525_06_inventory_reservations\migration.sql
pnpm.cmd lint
pnpm.cmd typecheck
pnpm.cmd test
pnpm.cmd test:e2e
pnpm.cmd test:integration
pnpm.cmd build
pnpm.cmd openapi:generate
pnpm.cmd openapi:check
```

### Recommended Next Phase

- Begin `phase-08-orders-idempotency-cod` from its planning files.

## Phase 10 Update

- Current phase: `phase-10-fulfillment-returns-refunds`
- Status: complete
- Date: 2026-05-25

### What Was Built

- `Shipment`, `ShipmentLine`, `ReturnRequest`, and `ReturnRequestItem` Prisma models plus the incremental migration artifact at `prisma/migrations/20260525_10_fulfillment_returns_refunds/migration.sql`.
- A dedicated `FulfillmentModule` with customer shipment visibility plus admin shipment creation and shipment-status APIs.
- A dedicated `ReturnsModule` with customer return-request APIs, admin review and receiving workflows, explicit restock disposition handling, and refund execution endpoints.
- `OrderPostPurchaseService` that derives order fulfillment state from shipment and received-return artifacts instead of ad hoc status writes.
- Automatic Stripe-backed refund execution with refundable-balance ceilings, partial-refund order-state handling, audit logging, and outbox events.
- Domain documentation at `docs/domain/fulfillment-and-returns-invariants.md` plus updated payment and refund invariants.

### Phase 10 Commands Run

```text
pnpm.cmd prisma:validate
pnpm.cmd prisma:generate
pnpm.cmd --filter @ecommerce/api typecheck
pnpm.cmd --filter @ecommerce/api test -- --runInBand refund order-post-purchase
pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand fulfillment-returns orders
pnpm.cmd --filter @ecommerce/api lint
pnpm.cmd --filter @ecommerce/api build
pnpm.cmd openapi:generate
pnpm.cmd prisma migrate diff --from-migrations prisma/migrations --to-schema prisma/schema.prisma --script
```

### Phase 10 Verification Results

- `pnpm.cmd prisma:validate`: passed
- `pnpm.cmd prisma:generate`: passed
- `pnpm.cmd --filter @ecommerce/api typecheck`: passed
- `pnpm.cmd --filter @ecommerce/api test -- --runInBand refund order-post-purchase`: passed with 6 targeted unit tests
- `pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand fulfillment-returns orders`: passed with 8 focused E2E tests
- `pnpm.cmd --filter @ecommerce/api lint`: passed
- `pnpm.cmd --filter @ecommerce/api build`: passed
- `pnpm.cmd openapi:generate`: passed
- `pnpm.cmd prisma migrate diff --from-migrations ...`: failed locally because Prisma 7 requires a configured shadow database for migrations-directory diffs, so the phase-10 SQL artifact was written manually from the validated schema delta

### Recommended Next Phase

- Begin `phase-11-reviews-notifications-reporting` from its planning files.

## Phase 08 Update

- Current phase: `phase-08-orders-idempotency-cod`
- Status: complete
- Date: 2026-05-25

### What Was Built

- `Order`, `OrderAddress`, `OrderLine`, and `OrderAppliedPromotion` snapshot persistence plus the incremental migration artifact at `prisma/migrations/20260525_08_orders_idempotency_cod/migration.sql`.
- `CheckoutPlacementService` with authoritative cart revalidation, pricing recalculation, reservation reuse or creation, promotion redemption, cart abandonment, and order outbox emission in one transaction.
- `CheckoutIdempotencyService` for actor-scoped placement idempotency with stored replay responses.
- `OrdersModule` customer and admin order-read APIs plus `PaymentsModule` COD placement gating.
- Domain documentation at `docs/domain/order-lifecycle.md` and API behavior notes at `docs/api/idempotency.md`.

### Phase 08 Commands Run

```text
pnpm.cmd prisma:validate
pnpm.cmd --filter @ecommerce/api typecheck
pnpm.cmd --filter @ecommerce/api lint
pnpm.cmd --filter @ecommerce/api test -- --runInBand checkout-idempotency checkout-placement order.service cod-payment
pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand orders checkout-preview
pnpm.cmd --filter @ecommerce/api test:integration -- --runInBand orders.integration
pnpm.cmd --filter @ecommerce/api build
pnpm.cmd openapi:generate
pnpm.cmd format
```

### Phase 08 Verification Results

- `pnpm.cmd prisma:validate`: passed
- `pnpm.cmd --filter @ecommerce/api typecheck`: passed
- `pnpm.cmd --filter @ecommerce/api lint`: passed
- `pnpm.cmd --filter @ecommerce/api test -- --runInBand checkout-idempotency checkout-placement order.service cod-payment`: passed with 5 targeted unit tests
- `pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand orders checkout-preview`: passed with 7 focused E2E tests
- `pnpm.cmd --filter @ecommerce/api test:integration -- --runInBand orders.integration`: skipped locally because `RUN_MYSQL_INTEGRATION` was not enabled and MySQL is not available on this machine
- `pnpm.cmd --filter @ecommerce/api build`: passed
- `pnpm.cmd openapi:generate`: passed
- `pnpm.cmd format`: failed because the repository still contains broad pre-existing Prettier drift across unrelated files

### Recommended Next Phase

- Begin `phase-09-online-payments-webhooks` from its planning files.

## Phase 09 Update

- Current phase: `phase-09-online-payments-webhooks`
- Status: complete
- Date: 2026-05-25

### What Was Built

- `PaymentAttempt`, `PaymentWebhookEvent`, and `Refund` Prisma models plus the incremental migration artifact at `prisma/migrations/20260525_09_online_payments_webhooks/migration.sql`.
- A `PaymentGateway` abstraction with a Stripe-backed PaymentIntent adapter and webhook-signature verification.
- Online-card checkout placement that creates provider payment attempts while keeping stock reserved until verified payment confirmation.
- Stripe webhook ingestion with duplicate-event persistence and safe order-payment transition services.
- Refund-foundation service hooks plus payment security and invariant documentation.

### Phase 09 Commands Run

```text
pnpm.cmd prisma:generate
pnpm.cmd prisma:validate
pnpm.cmd --filter @ecommerce/api typecheck
pnpm.cmd --filter @ecommerce/api lint
pnpm.cmd --filter @ecommerce/api test -- --runInBand checkout-preview checkout-placement payment-webhook
pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand orders checkout-preview
pnpm.cmd --filter @ecommerce/api build
pnpm.cmd openapi:generate
pnpm.cmd openapi:check
pnpm.cmd format
pnpm.cmd exec prisma migrate diff --from-schema prisma\.tmp\phase09-pre-payments-schema.prisma --to-schema prisma\schema.prisma --script --output prisma\migrations\20260525_09_online_payments_webhooks\migration.sql
```

### Phase 09 Verification Results

- `pnpm.cmd prisma:generate`: passed
- `pnpm.cmd prisma:validate`: passed
- `pnpm.cmd --filter @ecommerce/api typecheck`: passed
- `pnpm.cmd --filter @ecommerce/api lint`: passed
- `pnpm.cmd --filter @ecommerce/api test -- --runInBand checkout-preview checkout-placement payment-webhook`: passed with 10 targeted unit tests
- `pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand orders checkout-preview`: passed with 7 focused E2E tests
- `pnpm.cmd --filter @ecommerce/api build`: passed
- `pnpm.cmd openapi:generate`: passed
- `pnpm.cmd openapi:check`: failed because `packages/contracts/openapi/openapi.json` still intentionally differs from `HEAD` in the current uncommitted multi-phase worktree
- `pnpm.cmd format`: failed because the repository still contains broad pre-existing Prettier drift across unrelated files
- `pnpm.cmd exec prisma migrate diff ...`: passed and produced the incremental phase-09 SQL artifact

### Recommended Next Phase

- Begin `phase-10-fulfillment-returns-refunds` from its planning files.

## Phase 07 Update

- Current phase: `phase-07-carts-wishlist-checkout-preview`
- Status: complete
- Date: 2026-05-25

### What Was Built

- `Cart`, `CartItem`, `Wishlist`, and `WishlistItem` Prisma models plus the incremental migration artifact at `prisma/migrations/20260525_07_carts_wishlist_checkout_preview/migration.sql`.
- `CartsModule` with guest or authenticated cart resolution, ownership enforcement, item mutation APIs, coupon application or removal, and guest-to-user merge behavior.
- `WishlistModule` with one-wishlist-per-user persistence, published-variant validation, and authenticated wishlist APIs.
- `CheckoutModule` with cart-based preview composition, stock availability lookup against the default warehouse, and authenticated reservation preview via `InventoryCoreService.reserveStock()`.
- Domain documentation at `docs/domain/cart-wishlist-invariants.md`.
- Focused unit and E2E coverage for carts, wishlist, checkout preview, and the updated inventory logger bootstrap path required for OpenAPI generation.

### Phase 07 Commands Run

```text
pnpm.cmd prisma:generate
pnpm.cmd --filter @ecommerce/api typecheck
pnpm.cmd --filter @ecommerce/api test -- --runInBand cart.service wishlist.service checkout-preview.service
pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand carts wishlist checkout-preview
pnpm.cmd --filter @ecommerce/api lint
pnpm.cmd openapi:generate
pnpm.cmd prisma:validate
pnpm.cmd format
pnpm.cmd --filter @ecommerce/api test -- --runInBand inventory-core.service cart.service wishlist.service checkout-preview.service
pnpm.cmd --filter @ecommerce/api build
```

### Phase 07 Verification Results

- `pnpm.cmd prisma:generate`: passed
- `pnpm.cmd --filter @ecommerce/api typecheck`: passed
- `pnpm.cmd --filter @ecommerce/api lint`: passed
- `pnpm.cmd --filter @ecommerce/api test -- --runInBand cart.service wishlist.service checkout-preview.service`: passed with 16 targeted unit tests
- `pnpm.cmd --filter @ecommerce/api test -- --runInBand inventory-core.service cart.service wishlist.service checkout-preview.service`: passed with 30 targeted unit tests
- `pnpm.cmd --filter @ecommerce/api test:e2e -- --runInBand carts wishlist checkout-preview`: passed with 9 focused E2E tests
- `pnpm.cmd --filter @ecommerce/api build`: passed
- `pnpm.cmd prisma:validate`: passed
- `pnpm.cmd openapi:generate`: passed after replacing the DI-sensitive injected inventory logger with a local logger instance
- `pnpm.cmd format`: failed because the repository already contains broad Prettier drift across 136 files, many unrelated to phase 07; no repo-wide formatting rewrite was applied in this phase

### Recommended Next Phase

- Begin `phase-08-orders-idempotency-cod` from its planning files.
