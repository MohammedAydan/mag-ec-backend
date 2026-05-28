# E-Commerce API — Code Review & Safety Patch Report

**Review date:** 2026-05-28  
**Reviewed artifact:** `e-commerce-api-nestjs-main.zip`  
**Scope:** Actual repository source code, Prisma schema/migrations, plans, OpenAPI contract, API/worker implementation, unit/integration-test layout, CI configuration, and high-risk commerce/security flows.

## Executive Summary

The uploaded repository is significantly ahead of the earlier plan archive. The backend plans for phases **00–12** contain **94 completed tasks out of 97** (**96.9% documented completion**), with three environment/verification tasks recorded as partial. Phase 13 exists as a Dashboard UI plan only and contains **0 completed tasks out of 35**.

The backend is structurally substantial: it includes catalog, pricing, promotions, inventory, carts, checkout, orders, payments, fulfillment/returns, reviews, notifications, reporting, content, audit, Prisma migrations through Phase 11, and an OpenAPI contract exposing **93 API operations across 87 paths**.

However, documented phase completion is not the same as production readiness. Static review found high-impact correctness and production gaps in reservation concurrency, webhook processing, payment transaction boundaries, account-token consumption, media storage, notifications, reporting exports, and end-to-end database/provider verification.

## Current Status

| Area                                | Status found in source                                   |
| ----------------------------------- | -------------------------------------------------------- |
| Backend plan Phases 00–12           | 94/97 tasks completed = **96.9% documented**             |
| Dashboard UI Phase 13               | 0/35 implementation tasks completed; planning files only |
| OpenAPI contract                    | 87 paths / 93 operations                                 |
| Prisma migrations                   | Present through Phase 11-related schema evolution        |
| COD order foundation                | Present                                                  |
| Stripe payment/webhook foundation   | Present, with unresolved processing issues below         |
| Production media uploads            | Not implemented end-to-end                               |
| Real notification delivery          | Console/stub behavior; not production delivery           |
| Production report downloads/storage | Local temporary-file behavior only                       |

## Safety Patches Applied in the Reviewed Copy

The patched copy contains narrow fixes intended to preserve the public API while reducing correctness and security risk.

### 1. Fixed: stock reservation double-release / double-redemption race

**Affected original code:**

- `apps/api/src/modules/inventory/services/inventory-core.service.ts`
- `apps/worker/src/processors/inventory-expiry.processor.ts`

**Problem:** release, redeem, and expiration paths could read a `RESERVED` reservation and then decrement stock counters before safely claiming the terminal state. Concurrent requests or repeated BullMQ jobs could release the same reservation twice or decrement physical stock twice.

**Patch:**

- Uses a conditional `updateMany(... status: 'RESERVED')` state claim before changing inventory counters.
- Only the transaction that wins the claim mutates `StockLevel`.
- Adds quantity guards and fails on invariant violations.
- Applies the same protection to the worker expiration processor.
- Updates/adds unit-test expectations for the idempotent claim behavior.

### 2. Fixed: account action tokens could be consumed twice concurrently

**Affected original code:**

- `apps/api/src/modules/identity/services/account-action-token.service.ts`

**Problem:** password-reset/email-verification token consumption used a read-then-unconditional-update flow. Two concurrent requests could both pass validation before either consumption was committed.

**Patch:** token consumption now atomically claims an unused, unexpired token via conditional `updateMany`; only one request can succeed.

### 3. Fixed narrowly: Stripe duplicate webhook overwrote the canonical audit result

**Affected original code:**

- `apps/api/src/modules/payments/services/payment-webhook.service.ts`

**Problem:** when Stripe redelivered an already processed event, the service changed the stored original status from `PROCESSED` to `DUPLICATE`, destroying the canonical processing outcome.

**Patch:** repeated deliveries return `duplicate: true` without mutating the original event record.

**Still unresolved:** the broader webhook transaction and concurrency design issues listed below require a deliberate refactor and database-backed tests.

### 4. Fixed: notification DTO validation gaps

**Affected original code:**

- `apps/api/src/modules/notifications/dto/notifications.dto.ts`

**Problem:** notification-preference boolean fields were optional but not validated as boolean, and list filters allowed invalid channel/status strings to reach persistence logic.

**Patch:** adds boolean validation and allowed-value validation for notification statuses/channels.

### 5. Fixed: unstable cursor pagination ordering

**Affected original code:**

- `apps/api/src/modules/notifications/services/notifications.service.ts`
- `apps/api/src/modules/reviews/services/reviews.service.ts`
- `apps/api/src/modules/reporting/services/reporting.service.ts`
- `apps/api/src/modules/audit/services/audit.service.ts`

**Problem:** cursor lists sorted only by `createdAt`, while using `id` as the cursor. Rows with identical timestamps could appear inconsistently across pages.

**Patch:** adds `id` as a deterministic secondary ordering field.

## Unresolved High-Priority Findings

These findings were documented but not automatically rewritten because they affect transaction design, production infrastructure, or provider semantics and must be verified with real MySQL/Redis/Stripe tests.

### P0 — Webhook failure records can roll back and disappear

`PaymentWebhookService` creates the webhook event and updates it to `FAILED` inside the same transaction that subsequently throws. A thrown transaction rolls back both the processing work and the failure status, meaning a failed provider event may not be persistently auditable.

**Required redesign:** persist ingestion first; process state transitions in a separate transaction; persist failure outside the rolled-back operation; define retry behavior for `RECEIVED` and `FAILED` events.

### P0 — Concurrent identical webhook deliveries can still race on creation

The service checks `findUnique` before creating a webhook row. Two simultaneous deliveries can both pass the read and then collide on the unique insert, producing an error instead of an idempotent accepted response.

**Required fix:** catch the unique-conflict path and treat it as duplicate acceptance, or atomically insert/claim processing state.

### P0/P1 — Stripe network operation occurs inside a database transaction

The checkout flow creates the online payment attempt and calls the external Stripe provider while the MySQL transaction remains open. This increases lock time and can leave an external PaymentIntent after a local rollback.

**Required redesign:** commit order/payment intent state first, execute Stripe creation outside the long-held database transaction using idempotency, then persist provider results through a recoverable state machine/outbox flow.

### P1 — Product media upload is not connected to real secure object storage

The catalog media flow emits an application URL such as `/uploads/<key>` and marks media as attached using a token, but no implemented signed S3 upload/object verification path was found. Attachment does not verify that an object exists or matches MIME/size/checksum expectations.

**Impact:** product image management is not production-ready.

### P1 — Notification delivery is a console/stub pipeline

The worker logs a console adapter and can mark notifications as `SENT`, but no real email/push provider delivery or reliable order-event consumer was found.

**Impact:** password reset/verification and customer order notices are not complete production features.

### P1 — Report exports use local temporary storage only

Report export generation writes local CSV files under a temporary directory and stores a key string, without a production object-storage/download delivery path.

**Impact:** exports will be fragile in multi-instance/cloud deployment and cannot yet support a robust dashboard download workflow.

### P1 — Refresh-token rotation remains concurrency-sensitive

Session refresh performs a status read followed by a later rotation update. Concurrent use of the same refresh token may allow multiple child sessions unless the rotation is claimed atomically and reuse revokes the token family.

### P1 — Important database/provider integration coverage is missing

Found MySQL integration coverage for core persistence, identity/inventory/orders/pricing/promotions areas, but no equivalent database/provider-backed verification for payment webhooks, refunds, returns, media storage, real notifications, or report export delivery.

### P2 — Admin RBAC is effectively locked to `super_admin`

Admin controllers consistently require `super_admin` in addition to fine-grained permissions. This prevents normal operator/editor roles from using a future Dashboard even if their scoped permissions are granted.

**Decision required:** confirm whether this is a temporary MVP restriction or redesign admin role access before Dashboard implementation.

## Dashboard Assessment

The repository includes Phase 13 Dashboard UI planning files, but no implemented dashboard application was found. The Dashboard is therefore **not yet built**, even though the API surface is now large enough to begin it.

Recommended dashboard starting modules after resolving P0 transaction/webhook issues:

1. Authentication and admin shell.
2. Catalog/media/pricing/promotions.
3. Inventory and reservations.
4. Orders and payments read views.
5. Fulfillment/returns/refunds after those server flows are hardened.
6. Reporting and notification operations only after real provider/storage delivery is implemented.

## Files Modified in the Patched Copy

- `apps/api/src/modules/inventory/services/inventory-core.service.ts`
- `apps/api/src/modules/inventory/services/inventory-core.service.spec.ts`
- `apps/worker/src/processors/inventory-expiry.processor.ts`
- `apps/api/src/modules/identity/services/account-action-token.service.ts`
- `apps/api/src/modules/identity/services/account-action-token.service.spec.ts`
- `apps/api/src/modules/payments/services/payment-webhook.service.ts`
- `apps/api/src/modules/payments/services/payment-webhook.service.spec.ts`
- `apps/api/src/modules/notifications/dto/notifications.dto.ts`
- `apps/api/src/modules/notifications/services/notifications.service.ts`
- `apps/api/src/modules/reviews/services/reviews.service.ts`
- `apps/api/src/modules/reporting/services/reporting.service.ts`
- `apps/api/src/modules/audit/services/audit.service.ts`

## Verification Status and Required Commands

The current review environment contains Node.js `v22.16.0`, while this project requires Node `>=24.0.0` and pins `pnpm@10.33.2`. Dependency installation/test execution could not be completed in this environment because package-registry access was unavailable. Therefore, the patched copy is **statically reviewed and patched, but not claimed to be CI-verified here**.

Run the following from the patched project using Node 24 and real MySQL/Redis services before merging:

```bash
corepack enable
pnpm install --frozen-lockfile
pnpm prisma:validate
pnpm prisma:generate
pnpm lint
pnpm typecheck
pnpm test
pnpm test:e2e
pnpm test:integration:mysql
pnpm openapi:verify
pnpm build
pnpm security:audit
```

Additional tests that should be added before production:

- Two concurrent releases/expiry jobs against one reservation must change stock once only.
- Two concurrent redemption paths must create only one SALE movement.
- Two concurrent password-reset or email-verification consumptions must allow only one success.
- Duplicate simultaneous Stripe webhooks must return accepted/idempotent results without changing canonical processing outcome.
- A failed Stripe transition must leave a persistent `FAILED` webhook audit row.
- Payment provider timeout/rollback recovery and refund/return end-to-end tests.

## Recommended Next Engineering Order

1. Run the provided safety patch through CI with MySQL and Redis.
2. Refactor webhook ingestion/processing and checkout payment transaction boundaries.
3. Implement real S3-compatible media storage with upload verification.
4. Implement real email/push notification providers and event consumers.
5. Move report exports to object storage with authorized downloads.
6. Decide delegated admin roles before coding the Dashboard.
7. Begin Dashboard implementation only against hardened APIs.
