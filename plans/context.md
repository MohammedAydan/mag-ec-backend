# Project: Universal E-Commerce REST API

## Purpose

Build a reusable, production-grade headless e-commerce backend API for a single retail brand/store. The system targets Flutter storefront and admin clients, supports flexible catalog and order workflows for ordinary retail domains such as fashion and perfumes, and is designed around a modular monolith that runs on MySQL first while preserving a clean migration path to PostgreSQL later.

## Current Status

- Active feature: `vercel-production-env-normalization`
- Overall health: green
- Last updated: 2026-06-09

## Critical Constraints

- Backend-only project; do not implement frontend concerns in this repository.
- Use a modular monolith first; no microservices, GraphQL, or marketplace logic in the initial release.
- Primary production database for v1 is MySQL 8.4 LTS with InnoDB.
- Maintain database-portable domain rules so PostgreSQL migration remains feasible later.
- APIs must be versioned REST under `/api/v1` and documented through OpenAPI for generated Flutter clients.
- Security, validation, idempotency, auditability, and testability are first-class requirements from phase 00 onward.

## Active Features

- `phase-00-foundation`: Complete. Workspace bootstrap, runtime skeleton, config validation, health, logging, OpenAPI generation, Docker Compose, Prisma 7 config, and CI baseline are in place.
- `phase-01-database-core`: Complete. Core Prisma schema, seed flow, queue bootstrap, repository/transaction services, migration SQL artifact, and CI-backed MySQL integration automation exist. (Note: Real local MySQL apply and local DB-backed verification are blocked by environment constraints, but covered in CI).
- `phase-02-identity-authz`: Complete. Customer/admin auth endpoints, rotating refresh sessions, one-time verification/reset token structures, RBAC/object policies, audit coverage, security tests, and OpenAPI/docs are in place. (Note: MySQL-gated auth integration tests are written but still skip locally without `RUN_MYSQL_INTEGRATION=true` and a reachable MySQL runtime.)
- `phase-03-catalog-media-localization`: Complete. Catalog schema, bilingual translations, admin/public APIs, upload-intent and attachment workflow, representative seeds, migration SQL, and verification coverage are in place. (Note: DB-backed seed execution still requires a reachable MySQL runtime.)
- `phase-04-pricing-store-settings`: Complete. Variant-level pricing, store pricing settings, manual tax strategy, shipping-zone configuration, checkout preview totals, migration SQL, and verification coverage are in place. (Note: DB-backed pricing seed execution still requires a reachable MySQL runtime.)
- `phase-05-promotions-coupons`: Complete. Promotion and coupon persistence, deterministic pricing-preview evaluation, admin APIs, usage-ledger structures, migration SQL, and verification coverage are in place. (Note: Real MySQL-backed promotion seed execution and integration remain environment-dependent.)
- `phase-06-inventory-reservations`: Complete. Warehouse, StockLevel, StockMovement, and StockReservation models; atomic reservation with oversell prevention; admin APIs; BullMQ expiry processor; full test coverage including concurrency integration spec.
- `phase-07-carts-wishlist-checkout-preview`: Complete. Guest/auth carts, wishlist, cart merge behavior, stock-aware checkout preview, reservation preview flow, migration SQL, and focused unit/e2e coverage are in place. (Note: Real MySQL-backed migration apply and DB-backed verification remain environment-dependent.)
- `phase-08-orders-idempotency-cod`: Complete. Transactional order placement, scoped idempotency, COD gating, customer/admin order APIs, outbox emission, and targeted verification coverage are in place. (Note: MySQL-gated order integration exists but still skips locally without `RUN_MYSQL_INTEGRATION=true` and a reachable MySQL runtime.)
- `phase-09-online-payments-webhooks`: Complete. Stripe-backed payment attempts, verified webhook ingestion, duplicate protection, online-card checkout flow, and refund-foundation hooks are in place. (Note: Local MySQL-backed payment integration remains environment-dependent, so verification here is schema/unit/E2E/build/OpenAPI based.)
- `phase-10-fulfillment-returns-refunds`: Complete. Shipment persistence and APIs, return moderation and receiving flows, explicit restock handling, refund execution, and derived post-purchase order-state transitions are in place. (Note: Local MySQL-backed migration apply and DB integration remain environment-dependent.)
- `phase-11-reviews-notifications-reporting`: Complete. Reviews, notification preferences and dispatch records, reports and exports, audit views, and content or legal-reference APIs are in place. (Note: Local MySQL/Redis-backed migration, seed, and integration verification remain environment-dependent.)
- `phase-12-hardening-release`: Environment-blocked closeout. Contract verification workflow, Flutter client generation path, release runbooks, tunable throttle baseline, security negative coverage, script hardening, API boot smoke evidence, Docker-free MySQL migration/seed/direct integration evidence, user-confirmed full project testing on `mysql://root:@localhost:3306/ecommerce`, and local release checklist evidence are in place. Remaining release evidence requires Redis for the full integration runner, Docker for generated Flutter client verification, and a staging target.
- `phase-13-dashboard-ui`: Complete. Integrated user's new React/Vite dashboard SPA into the workspace. It compiles, tests, and runs cleanly with NestJS static serving, mapped to `/admin`.
- `dashboard-heroui-rebuild`: Complete. The embedded admin SPA now uses HeroUI v3 plus Tailwind CSS v4 for the shell and shared surfaces, and the API/auth layer is centralized with env-configurable `/api/v1` access and safer refresh-token retry handling.
- `dashboard-auth-runtime-fix`: Complete. Local schema drift is now fail-fast at startup, stock-HeroUI simplification is applied to the shell/login surface, and the reported admin list/runtime 500s were fixed by explicit query integer coercion plus shared response normalization.
- `dashboard-build-compat-fix`: Complete. The embedded admin SPA now matches the locally installed HeroUI component contracts again, the missing Tailwind Vite plugin dependency is declared in the dashboard package, and both package-level plus workspace builds are green.
- `dashboard-theme-form-system`: Complete. The embedded admin SPA now follows HeroUI quick-start CSS import order, supports persistent light/dark/system theme switching, replaces raw JSON action payload flows with structured drawers, fixes prompt-based maintenance input, and removes mojibake across the dashboard shell and action pages.
- `dashboard-redesign-summary-package`: Complete. A top-level `redesign-dashboard-summary/` handoff package now captures the dashboard redesign context, official HeroUI research links and findings, file map, verification, open issues, and a next-agent prompt for follow-up work.
- `dashboard-production-readiness`: Complete. P0 theme-breaking colors fixed, chipColor helper migrated across all 14 pages, Feedback auto-dismiss added, Sidebar ScrollShadow added, ErrorBoundary wrapping the app tree, and Ctrl+K sidebar shortcut implemented. Build and typecheck verified green.
- `dashboard-reference-selects`: Complete. All entity reference ID fields across 5 dashboard pages converted from `text`/`string-list` to `select`/`checkbox-list` with API-fetched options. Added `SelectActionField` type and Atelier-styled select renderer to the form engine. Build verified green.
- `openapi-settings-audit`: Complete. Runtime Swagger setup and generated OpenAPI now share one configuration, stale `swagger-ui-express` is removed, catalog admin success responses are typed, and the Flutter contract audit reports 0 errors / 0 warnings.
- `openapi-dto-coverage-audit`: Complete. All exposed module features are represented in OpenAPI; cart, checkout, and maintenance header metadata was corrected; contract sanity audit and Flutter SDK audit are green.
- `flutter-openapi-feature-completion`: Complete. OpenAPI generation is stable, the Flutter/Dio SDK regenerates and verifies cleanly, and generated Dart quality checks pass.
- `flutter-client-runtime-hardening`: Complete. Pricing Admin request bodies, health models, reporting aggregate schemas, generator schema-quality audits, and generated Dart runtime model tests are fixed and verified.
- `flutter-content-response-nullability-fix`: Complete. Content page responses now serialize to the documented flattened DTO shape, admin/public legal-reference response DTOs are separated, OpenAPI regenerated cleanly, and Flutter SDK model conversion tests cover the affected DTOs.
- `flutter-runtime-contract-full-audit`: Complete. Broader DTO/runtime mismatches across content, wishlist, commerce support, pricing, notifications, and identity/profile were fixed; OpenAPI and the Flutter/Dio SDK regenerate and verify cleanly with expanded generated Dart model conversion coverage.
- `endpoint-openapi-consistency-audit`: Complete. All 141 endpoints across 32 controllers now have @ApiOperation summaries, error @ApiResponse decorators, @ApiParam annotations, and request DTOs with @ApiProperty. P0 locale required/optional + permission stacking bugs fixed. OpenAPI regenerated cleanly.
- `openapi-contract-accuracy-audit`: Complete. Promotions admin path-template conflict removed with explicit `by-key` routing; audited pagination query schemas now emit integer types; protected cancellation docs include `403`; audited preview or mutation-result endpoints now document `200`; contract verification and SDK audits are green.
- `openapi-generator-command-hardening`: Complete. TypeScript and Flutter client generation no longer depend on the user-global npm cache, TypeScript generated-package pnpm checks are workspace-isolated, Flutter Windows Dart invocation is corrected, and deterministic Dart import cleanup keeps full generation green.
- `security-report`: Complete. Source-grounded security report saved at `docs/security/security-report-2026-06-01.md`; it identifies high-priority remediation around notification response serialization, seed/config fail-closed behavior, duplicate checkout prevention, refund permissions, and admin token freshness.
- `security-remediation`: Complete. All 21 findings from SEC-001 through SEC-021 remediated. Notification sensitive-data exposure fixed; seed/config fail-closed behavior enforced; atomic checkout already confirmed; refund permission split with policy caps; admin token freshness already in place; customer guard applied; docs/SPA secured; maintenance hardened; header/DTO validation tightened; Stripe reconciliation audit logged; promotion race safety confirmed; audit gate lowered; Docker/CI hardened; customer object existence normalized; media upload checksum enforced.
- `api-reference-handbook`: Complete. Added `docs/api/api-reference-handbook.md`, a contract-driven API handbook covering the current 139 OpenAPI operations, request and response details, usage conventions, and example storefront/admin page mappings.
- `vercel-prisma-build-fix`: Complete. API and worker build scripts now regenerate Prisma explicitly before TypeScript compilation so clean pnpm/Vercel installs do not depend on skipped dependency build scripts for generated Prisma client types.
- `vercel-deployment-shape-fix`: Complete. The repository now declares `apps/api` as the intended Vercel app root through `apps/api/vercel.json`, and the standalone `build:vercel` path builds the embedded dashboard before compiling the NestJS API for a single direct-mode deployment.
- `vercel-domain-shared-build-fix`: Complete. The API-root Vercel build now compiles `@ecommerce/domain-shared` before dashboard/API steps so clean installs have the shared package declarations needed by API TypeScript imports.
- `vercel-nest-entrypoint-detection-fix`: Complete. `apps/api/src/main.ts` now directly imports `@nestjs/core` so Vercel's NestJS detector recognizes the entrypoint while the existing shared bootstrap remains unchanged.
- `vercel-postbuild-type-scan-fix`: Complete. API tsconfigs and Vercel function packaging now exclude nested dashboard source from postbuild API scans while including built `/admin` assets, and the Prisma schema guard no longer relies on the two-argument `Error` constructor overload.
- `vercel-invalid-functions-config-fix`: Complete. Removed the invalid `functions.src/main.ts` Vercel config and moved dashboard-source exclusion to a Vercel-only end-of-build prune step after `public/admin` assets are generated.
- `vercel-array-at-compat-fix`: Complete. Removed `Array.prototype.at()` from API cursor pagination so Vercel's postbuild TypeScript scan does not require an ES2022 lib target.
- `vercel-serverless-runtime-crash-fix`: Complete. Vercel direct-mode production boot no longer requires inactive S3 or Resend optional integration settings, while core secrets and explicitly enabled providers still fail closed.
- `vercel-runtime-diagnostics`: Complete. Added a standalone `/api/diagnostics` Vercel Function outside NestJS bootstrap to inspect non-secret deployment readiness when the main serverless function crashes.
- `vercel-production-env-normalization`: Complete. Vercel production runtime now derives production mode from `VERCEL_ENV`, strips quoted-empty env values, avoids Redis localhost defaults in direct mode, and derives stable JWT secrets from the maintenance secret when explicit JWT envs are empty.

## Known Issues / Tech Debt

- Local implementation ran on Node `25.9.0` while the intended project target line remains Node `24 LTS`.
- OpenAPI Generator CLI execution through `npx` needs access to the user npm cache outside the workspace sandbox in this local environment.
- Docker is not available in the current local environment; MySQL migration, seed, and direct DB-backed verification have since been completed against `mysql://root:@localhost:3306/ecommerce`.
- The worktree contains an unrelated untracked `.antigravitycli/` directory that was intentionally left untouched.
- Repo-wide `pnpm.cmd format` still fails because the repository contains broad pre-existing Prettier drift outside the current phase scope.
- Dashboard build now succeeds, but Vite reports a large frontend chunk warning; route/code splitting remains a follow-up optimization rather than a release blocker for the current rebuild.
- Stripe online payments require real `STRIPE_SECRET_KEY` and `PAYMENT_WEBHOOK_SECRET` values in environments that enable `PAYMENT_PROVIDER=stripe`.
- Operational constraints such as deployment target, email provider, payment provider, and object-storage vendor are not finalized.
- Local MySQL was repaired on 2026-05-27 using non-destructive Prisma migration metadata resolution for phase 05 and phase 06, then migrations through phase 11 and seed ran successfully. The database still records historical DB-only migration `20260525141708_init_2`; `prisma/migrations/20260526210402_init_1` is now present as an applied local repair artifact.
- Redis-backed integration runner remains blocked because Redis is not listening on `localhost:6379`; latest `pnpm.cmd test:integration:mysql` failed with `Redis did not become ready at localhost:6379 within 30000ms`.
- Dashboard UI implementation must respect the current backend-only repository constraint until a separate frontend app/repo or approved workspace expansion is selected.
- The former backend-only dashboard boundary is already superseded by the approved embedded SPA decision in `plans/phase-13-dashboard-ui/plan.md`; new dashboard work must stay inside `apps/api/public/dashboard` and the `/admin` static output path.
- One moderate `@hono/node-server` advisory (CVE-2026-39406) persists in Prisma 7 toolchain dependency; no compatible patched version available yet.
- For Vercel, the project Root Directory must be `apps/api`; pointing Vercel at `apps/api/public/dashboard` builds the SPA but cannot deploy the full NestJS application because the server entrypoint lives at `apps/api/src/main.ts`.
- Direct-mode Vercel deployments no longer require `REDIS_URL`; it is now required only when `EXECUTION_MODE=queue`, matching the documented serverless architecture.
- Direct-mode Vercel deployments still require `DATABASE_URL`, 32+ character JWT access/refresh secrets, and a 32+ character maintenance secret; set `DASHBOARD_ENABLED=true` if the embedded `/admin` dashboard should be visible in production.
- If explicit Vercel JWT env vars are accidentally empty, the API derives stable access/refresh secrets from a strong maintenance secret; explicit separate JWT secrets remain recommended.

## Team / Ownership

- Architecture and backend implementation: Codex session planning baseline
- Product brief source: root `plan.md`
