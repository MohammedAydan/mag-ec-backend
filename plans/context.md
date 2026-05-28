# Project: Universal E-Commerce REST API

## Purpose

Build a reusable, production-grade headless e-commerce backend API for a single retail brand/store. The system targets Flutter storefront and admin clients, supports flexible catalog and order workflows for ordinary retail domains such as fashion and perfumes, and is designed around a modular monolith that runs on MySQL first while preserving a clean migration path to PostgreSQL later.

## Current Status

- Active feature: `phase-13-dashboard-ui`
- Overall health: green
- Last updated: 2026-05-28

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

## Known Issues / Tech Debt

- Local implementation ran on Node `25.9.0` while the intended project target line remains Node `24 LTS`.
- `swagger-ui-express` was left installed after the initial dependency batch because a later removal attempt hit a pnpm store-location mismatch.
- Docker is not available in the current local environment; MySQL migration, seed, and direct DB-backed verification have since been completed against `mysql://root:@localhost:3306/ecommerce`.
- The worktree contains an unrelated untracked `.antigravitycli/` directory that was intentionally left untouched.
- Repo-wide `pnpm.cmd format` still fails because the repository contains broad pre-existing Prettier drift outside the current phase scope.
- Stripe online payments require real `STRIPE_SECRET_KEY` and `PAYMENT_WEBHOOK_SECRET` values in environments that enable `PAYMENT_PROVIDER=stripe`.
- Operational constraints such as deployment target, email provider, payment provider, and object-storage vendor are not finalized.
- Local MySQL was repaired on 2026-05-27 using non-destructive Prisma migration metadata resolution for phase 05 and phase 06, then migrations through phase 11 and seed ran successfully. The database still records historical DB-only migration `20260525141708_init_2`; `prisma/migrations/20260526210402_init_1` is now present as an applied local repair artifact.
- Redis-backed integration runner remains blocked because Redis is not listening on `localhost:6379`; latest `pnpm.cmd test:integration:mysql` failed with `Redis did not become ready at localhost:6379 within 30000ms`.
- Dashboard UI implementation must respect the current backend-only repository constraint until a separate frontend app/repo or approved workspace expansion is selected.

## Team / Ownership

- Architecture and backend implementation: Codex session planning baseline
- Product brief source: root `plan.md`
