# Security Report - 2026-06-01

## Scope and Method

This audit reviewed the backend source tree for the NestJS/Prisma e-commerce API in `D:\Projects\NodeJS-Projects\e-commerce-api-d`.

Reviewed areas:

- API bootstrap, configuration, OpenAPI exposure, CORS, Helmet, validation, throttling, and logging.
- Identity/authentication, refresh sessions, action tokens, RBAC, admin/customer boundaries, and object-level authorization.
- Checkout, orders, payments, Stripe webhooks, returns, refunds, inventory reservations, promotions, carts, notifications, audit logs, reporting, workers, queues, Prisma schema, seed scripts, CI, and dependency audit posture.

Execution notes:

- Six parallel read-only subagents reviewed independent security surfaces.
- The main agent consolidated results and performed local evidence checks.
- `pnpm.cmd security:audit` passed at the current project gate.
- `pnpm.cmd audit --prod --json` found one moderate production-tree advisory that the current high-only gate does not fail on.
- No live external penetration testing, destructive testing, production provider calls, or fuzzing was performed.

## Executive Summary

Overall posture is better than a typical early-stage backend: the app has global DTO validation with whitelist/forbid-unknown behavior, Helmet, allowlist CORS, configurable throttling, redacted request logging, hashed refresh/action tokens, Stripe signature verification, duplicate webhook protection, admin RBAC, and audit-log redaction.

The main risks are not missing auth everywhere. They are privilege freshness, sensitive data serialization, unsafe operational defaults, and transactional business controls.

Top remediation priorities:

1. Stop notification APIs from returning full `User` records.
2. Make seed/config fail closed outside local/test.
3. Prevent duplicate order placement from the same cart with a new idempotency key.
4. Split refund execution away from generic `returns.write`.
5. Add token/session versioning or DB-backed freshness checks for admin privilege changes.

## Findings

### SEC-001 - High - Notification APIs can expose full user records including password hashes

Evidence:

- `apps/api/src/modules/notifications/services/notifications.service.ts:14` sets `notificationInclude` to `user: true`.
- `apps/api/src/modules/notifications/services/notifications.service.ts:102` and `apps/api/src/modules/notifications/services/notifications.service.ts:179` list customer/admin notifications with that include.
- `apps/api/src/modules/notifications/services/notifications.service.ts:194` returns the raw notification items from `serializePage`.
- `prisma/schema.prisma:252` and `prisma/schema.prisma:254` show sensitive `User` fields including `normalizedEmail` and `passwordHash`.

Impact:

`/notifications/me` can expose the current user's hash and private user fields. Admin notification lists can expose the same sensitive fields across many users.

Recommendation:

Replace `user: true` with a strict `select` matching the intended response DTO. Serialize notification responses explicitly and add regression tests asserting that `passwordHash`, `normalizedEmail`, refresh sessions, and token-related fields are never present.

### SEC-002 - High - Seed can create or reset a super admin with known default credentials

Evidence:

- `package.json:23` exposes `pnpm prisma:seed`.
- `prisma/seed.ts:223` defaults `DATABASE_URL` to `mysql://root:root@localhost:3306/ecommerce`.
- `prisma/seed.ts:227` and `prisma/seed.ts:228` default admin credentials to `admin@example.com` / `ChangeMe123!`.
- `prisma/seed.ts:298`, `prisma/seed.ts:303`, and `prisma/seed.ts:311` upsert the admin and overwrite `passwordHash`.
- `prisma/seed.ts:318` and `prisma/seed.ts:321` attach the `super_admin` role.
- `docs/operations/staging-release-runbook.md:8` allows seed usage in staging contexts.

Impact:

Running the seed against staging or production without explicit secure overrides can create or reset an all-access admin account to public credentials.

Recommendation:

Refuse seed execution outside local/test unless an explicit break-glass flag is present. Require secure `DEV_SEED_ADMIN_EMAIL` and `DEV_SEED_ADMIN_PASSWORD` values outside local/test. Do not update an existing admin password by default.

### SEC-003 - High - Production database and Redis config can fall back to local defaults

Evidence:

- `apps/api/src/config/app.config.ts:83` and `apps/api/src/config/app.config.ts:85` default `DATABASE_URL`.
- `apps/api/src/config/app.config.ts:197` also builds `databaseUrl` with the same fallback.
- `apps/api/src/config/app.config.ts:199` defaults Redis to `redis://localhost:6379`.
- `apps/worker/src/config/worker.config.ts:59` through `apps/worker/src/config/worker.config.ts:66` call `requiredInProduction` after applying local fallback values, so missing env values can still pass.
- `prisma.config.ts:5` defaults Prisma CLI usage to the local root URL.

Impact:

Missing production/staging environment variables can connect to local/root services instead of failing closed. This can cause data corruption, accidental test DB usage, or deployments that look healthy while pointing to the wrong infrastructure.

Recommendation:

Require explicit `DATABASE_URL` in staging/production for API, worker, Prisma, migrations, and seed. Require explicit `REDIS_URL` for workers and queue mode. Keep local defaults only behind `NODE_ENV=development` or `test`.

### SEC-004 - High - The same cart can be checked out multiple times with different idempotency keys

Evidence:

- `apps/api/src/modules/checkout/services/checkout-placement.service.ts:66` loads the cart before idempotency execution.
- `apps/api/src/modules/checkout/services/checkout-placement.service.ts:92` reloads the transactional cart.
- `apps/api/src/modules/carts/services/cart.service.ts:71` fetches by cart ID without filtering for active status.
- `apps/api/src/modules/checkout/services/checkout-placement.service.ts:270` marks the cart `ABANDONED` after order creation.
- `prisma/schema.prisma:1119` keeps `Order.cartId` nullable/non-unique.
- `prisma/schema.prisma:1120` has a unique `idempotencyKeyId`, but the placement path does not link an order to it in the observed source.

Impact:

A client can place the same cart again with a different idempotency key, potentially creating duplicate COD orders, duplicate Stripe PaymentIntents, duplicate reservation redemption, and duplicate promotion usage.

Recommendation:

Inside the checkout transaction, atomically claim the cart with a conditional update such as `id = cartId AND status = ACTIVE`; fail if the update count is not exactly one. Consider a database uniqueness guard for order placement per cart, or persist/link the idempotency key to the order.

### SEC-005 - High - Refund execution is protected only by `returns.write`

Evidence:

- `apps/api/src/modules/returns/controllers/admin-returns.controller.ts:62` protects the refund endpoint with `@RequirePermissions(['returns.write'])`.
- `apps/api/src/modules/returns/controllers/admin-returns.controller.ts:64` exposes `refundReturn`.
- `apps/api/src/modules/returns/services/returns.service.ts:461` implements `executeReturnRefund`.
- `apps/api/src/modules/returns/services/returns.service.ts:488` calls `refundService.executeRefund`.

Impact:

Any role that can manage returns can execute real provider refunds. That crosses from return workflow moderation into payment control.

Recommendation:

Require a payment-specific permission such as `payments.refund` or `refunds.write` in addition to `returns.write`. Add dual control or elevated approval for high-value refunds.

### SEC-006 - Medium - Admin role/status changes do not immediately invalidate access JWT privileges

Evidence:

- `apps/api/src/modules/identity/services/auth.service.ts:146` and `apps/api/src/modules/identity/services/auth.service.ts:148` embed `userType` and `permissions` in access tokens at login.
- `apps/api/src/modules/identity/services/auth.service.ts:221` and `apps/api/src/modules/identity/services/auth.service.ts:223` do the same on refresh.
- `apps/api/src/modules/identity/guards/auth.guard.ts:34` verifies only the access token.
- `apps/api/src/modules/identity/guards/admin.guard.ts:13` trusts the token `userType`.
- `apps/api/src/modules/identity/guards/permissions.guard.ts:46` trusts token permissions.
- `apps/api/src/modules/identity/services/admin-access.service.ts:279` updates staff roles.
- `apps/api/src/modules/identity/services/admin-access.service.ts:318` revokes refresh sessions only on staff status changes.
- `apps/api/src/config/app.config.ts:120` defaults access tokens to `15m`.

Impact:

After demotion, role removal, or suspension, an existing access token can keep authorizing privileged requests until expiration.

Recommendation:

Add a `tokenVersion`, `securityStamp`, or role/status version checked by `AuthGuard`, and increment it on role, permission, status, and password changes. Alternatively, perform DB/cache-backed user status and permission freshness checks for admin routes.

### SEC-007 - Medium - Customer routes accept admin/staff JWTs

Evidence:

- `apps/api/src/modules/identity/services/token.service.ts:10` tracks `userType`, but the codebase has only an admin-side guard.
- Customer routes use `AuthGuard` and then trust `currentUser.sub`, for example `apps/api/src/modules/orders/controllers/customer-orders.controller.ts`, `apps/api/src/modules/wishlist/controllers/wishlist.controller.ts`, `apps/api/src/modules/returns/controllers/customer-returns.controller.ts`, and `apps/api/src/modules/checkout/controllers/checkout.controller.ts`.

Impact:

An authenticated admin/staff account can enter customer workflows under the staff user ID. This weakens the admin/customer boundary and can pollute cart, wishlist, checkout, returns, review, and notification records.

Recommendation:

Add a `CustomerGuard` or `RequireUserType('CUSTOMER')` decorator and apply it to storefront/customer-only routes. Keep guest-capable routes explicit.

### SEC-008 - Medium - OpenAPI docs and embedded admin SPA are enabled by default

Evidence:

- `apps/api/src/config/app.config.ts:106` defaults `DASHBOARD_ENABLED` to true.
- `apps/api/src/config/app.config.ts:114` defaults `OPENAPI_ENABLED` to true.
- `apps/api/src/config/app.config.ts:211` and `apps/api/src/config/app.config.ts:215` keep runtime defaults true unless explicitly false.
- `apps/api/src/bootstrap/create-api-application.ts:105` serves dashboard static assets.
- `apps/api/src/bootstrap/create-api-application.ts:125` mounts Swagger docs.
- `packages/contracts/openapi/openapi.json:5637` includes the maintenance endpoint in the generated contract.

Impact:

Production or staging can accidentally expose `/admin`, `/api/v1/docs`, and `/api/v1/docs/json`, increasing reconnaissance value and exposing admin/ops route inventory.

Recommendation:

Default both flags to false for staging/production. Require explicit opt-in, auth/IP allowlisting for docs, and a deployment smoke check that fails if docs are enabled unintentionally.

### SEC-009 - Medium - Maintenance endpoint is discoverable, unthrottled, and state-changing over GET

Evidence:

- `apps/api/src/modules/runtime/controllers/maintenance.controller.ts:12` applies `@SkipThrottle()`.
- `apps/api/src/modules/runtime/controllers/maintenance.controller.ts:13` exposes `system/maintenance`.
- `apps/api/src/modules/runtime/controllers/maintenance.controller.ts:24` defines `GET run`.
- `packages/contracts/openapi/openapi.json:5637` documents `/api/v1/system/maintenance/run`.

Impact:

The endpoint is easier to discover, can be hit without application throttling, and permits a state-changing action over GET. If a static maintenance secret leaks, the endpoint can be triggered directly.

Recommendation:

Remove the GET mutating route. Exclude maintenance from public OpenAPI. Apply throttling or an edge allowlist, and prefer HMAC/time-window request signing over static bearer secrets.

### SEC-010 - Medium - Checkout header inputs bypass DTO validation

Evidence:

- `apps/api/src/modules/checkout/controllers/checkout.controller.ts:80` documents `idempotency-key`.
- `apps/api/src/modules/checkout/controllers/checkout.controller.ts:89` reads it directly from raw headers.
- `apps/api/src/modules/checkout/services/checkout-placement.service.ts:72` trims and checks only non-empty.
- `prisma/schema.prisma:402` stores idempotency keys directly.

Impact:

Malformed or oversized `idempotency-key` and guest-cart-token header values can reach hashing/DB paths. OpenAPI marks the key optional while the service requires it.

Recommendation:

Add reusable header parsing/validation with max length and allowed charset. Make `idempotency-key` required in OpenAPI for order placement.

### SEC-011 - Medium - Guest cart bearer tokens can be client-chosen without entropy constraints

Evidence:

- `apps/api/src/modules/carts/dto/cart.dto.ts:45` through `apps/api/src/modules/carts/dto/cart.dto.ts:50` allow an optional guest token with no entropy/format rule.
- `apps/api/src/modules/carts/controllers/cart.controller.ts:65` through `apps/api/src/modules/carts/controllers/cart.controller.ts:67` prefer a body/header token before generating `randomUUID()`.
- `apps/api/src/modules/carts/services/cart.service.ts:348` hashes guest tokens.
- `apps/api/src/modules/carts/services/cart.service.ts:359` normalizes with trim but does not enforce strength.

Impact:

Guest cart access depends on a bearer secret that clients can make predictable or reused, weakening guest cart isolation.

Recommendation:

Generate guest cart tokens server-side only, or require UUIDv4/high-entropy format and reject weak client-provided tokens. Use the header only to access an existing guest cart.

### SEC-012 - Medium - Payment webhook success does not verify amount/currency against the local attempt

Evidence:

- `apps/api/src/modules/payments/services/stripe-payment-gateway.service.ts:97` and `apps/api/src/modules/payments/services/stripe-payment-gateway.service.ts:118` map provider IDs/status but not verified amount/currency into the webhook event.
- `apps/api/src/modules/payments/services/payment-webhook.service.ts:61` resolves a payment attempt.
- `apps/api/src/modules/payments/services/payment-webhook.service.ts:91` marks the order paid without amount/currency comparison.

Impact:

Signed provider events can mark an order paid without local reconciliation of provider amount/currency against the stored order/payment attempt.

Recommendation:

Include Stripe `amount`, `amount_received`, and `currency` in the verified event model. Reject or quarantine success events where provider amount/currency differs from the local payment attempt or order total.

### SEC-013 - Medium - Refund webhook reconciliation should cross-check payment intent ownership

Evidence:

- `apps/api/src/modules/payments/services/refund.service.ts` reconciles provider refunds.
- `apps/api/src/modules/payments/services/refund.service.ts:312` and nearby refund update paths use refund/payment provider data, while the reported path does not enforce that the webhook payment intent matches the refund's payment attempt.

Impact:

If provider metadata is wrong or abused, a signed refund event could reconcile the wrong local refund/order.

Recommendation:

Load the refund with its `paymentAttempt` and require `event.providerPaymentId === refund.paymentAttempt.providerPaymentId`; quarantine mismatches.

### SEC-014 - Medium - Return refund amount is operator-supplied and capped only by order refundable balance

Evidence:

- `apps/api/src/modules/returns/services/returns.service.ts:488` passes operator-provided refund amount to `RefundService`.
- `apps/api/src/modules/returns/services/returns.service.ts:492` passes `dto.amount`.
- `apps/api/src/modules/payments/services/refund.service.ts:113` checks only against remaining refundable order balance.

Impact:

An admin can refund more than the value of received return items, up to the order's refundable balance. This may be valid for goodwill, but it lacks explicit override semantics.

Recommendation:

Calculate a default cap from received return items and the refund policy. Require elevated override permission and structured reason/audit metadata for refunds above that cap.

### SEC-015 - Medium - Promotion/coupon usage limits can race under concurrent checkout

Evidence:

- `apps/api/src/modules/promotions/services/promotion-evaluator.service.ts:309` checks promotion reserved plus redeemed count.
- `apps/api/src/modules/promotions/services/promotion-evaluator.service.ts:335` checks coupon reserved plus redeemed count.
- `apps/api/src/modules/promotions/services/promotion-usage.service.ts:17` redeems applied promotions later.
- `apps/api/src/modules/promotions/services/promotion-usage.service.ts:38` and `apps/api/src/modules/promotions/services/promotion-usage.service.ts:69` increment redeemed counters.
- `prisma/schema.prisma:547`, `prisma/schema.prisma:548`, `prisma/schema.prisma:581`, and `prisma/schema.prisma:582` store plain counters.

Impact:

Concurrent checkouts can pass eligibility checks before either transaction increments counters, exceeding total or per-customer usage limits.

Recommendation:

Claim usage inside the order transaction using conditional updates or row locks. Fail if the conditional update count is not one. Enforce per-customer limits against the ledger under the same transaction.

### SEC-016 - Medium - Dependency audit gate misses a current moderate production advisory

Evidence:

- `package.json:32` uses `pnpm audit --prod --audit-level high`.
- `.github/workflows/security.yml:5` runs only on schedule/manual.
- `.github/workflows/security.yml:30` runs the high-only audit script.
- `pnpm.cmd audit --prod --json` reports `@hono/node-server@1.19.11` vulnerable to GHSA-92pp-h63x-v22m / CVE-2026-39406, patched in `>=1.19.13`.
- `pnpm-lock.yaml:738`, `pnpm-lock.yaml:4747`, and `pnpm-lock.yaml:5389` show `@hono/node-server@1.19.11` in the production dependency tree via Prisma tooling.

Impact:

Moderate production-tree vulnerabilities can persist without failing the current CI/security gate.

Recommendation:

Lower the audit gate to `moderate` or maintain explicit suppressions. Upgrade or override `@hono/node-server >=1.19.13` when compatible, and run the audit on pull requests.

### SEC-017 - Low/Medium - Auth DTOs lack upper bounds on expensive strings

Evidence:

- `apps/api/src/modules/identity/dto/auth.dto.ts:14` through `apps/api/src/modules/identity/dto/auth.dto.ts:17` set password minimum length only.
- `apps/api/src/modules/identity/dto/auth.dto.ts:57` through `apps/api/src/modules/identity/dto/auth.dto.ts:60` set reset password minimum length only.
- `apps/api/src/modules/identity/services/auth.service.ts:342` hashes the new password before reset-token validation.
- `apps/api/src/bootstrap/create-api-application.ts:53` sets a broad 1 MB body limit.

Impact:

Unauthenticated callers can send very large auth fields and force memory/CPU work, especially Argon2 hashing during invalid password reset attempts.

Recommendation:

Add `@MaxLength` for email, display name, passwords, refresh tokens, reset tokens, verification tokens, guest tokens, and idempotency keys. Validate the reset token cheaply before expensive hashing while preserving one-time-use atomicity.

### SEC-018 - Low/Medium - Customer object lookups reveal cross-account object existence

Evidence:

- Customer-owned resource methods fetch by ID and then return forbidden for another user's object in areas such as orders, returns, fulfillment, and reviews.

Impact:

Authenticated users can distinguish nonexistent IDs from existing records owned by someone else if an ID leaks.

Recommendation:

Query with ownership in the `where` clause and return a uniform `NotFoundException`. Log unauthorized probes internally.

### SEC-019 - Low/Medium - Media upload integrity is weaker than the DTO suggests

Evidence:

- `apps/api/src/modules/catalog/dto/catalog-admin.dto.ts` accepts an optional checksum.
- The media attach flow verifies object metadata and records checksum/etag, but the review did not find enforcement that the supplied checksum must match object content.

Impact:

Client-controlled content type and unchecked checksum weaken upload integrity. Public URLs may be available before full verification.

Recommendation:

Require checksum verification or object checksum validation. Add malware/content scanning before marking media attached. Avoid exposing public URLs until verification succeeds.

### SEC-020 - Low/Medium - Docker Compose exposes development credentials on host ports

Evidence:

- `docker-compose.yml:7` sets `MYSQL_ROOT_PASSWORD=root`.
- `docker-compose.yml:9`, `docker-compose.yml:27`, and `docker-compose.yml:45` publish service ports.
- `docker-compose.yml:23` through `docker-compose.yml:32` run Redis without auth.
- `docker-compose.yml:42` and `docker-compose.yml:43` set default MinIO credentials.

Impact:

If reused beyond local development or bound beyond loopback, default DB/cache/storage credentials can expose local infrastructure.

Recommendation:

Bind development service ports to `127.0.0.1`, source credentials from `.env`, enable Redis auth/ACLs where practical, and label the compose file development-only.

### SEC-021 - Low - GitHub Actions are not pinned and token permissions are implicit

Evidence:

- `.github/workflows/ci.yml:13`, `.github/workflows/ci.yml:16`, `.github/workflows/ci.yml:21`, `.github/workflows/security.yml:13`, `.github/workflows/security.yml:16`, and `.github/workflows/security.yml:21` use mutable action tags.
- The workflows do not declare a least-privilege `permissions` block.

Impact:

Supply-chain posture and GitHub token least privilege are weaker than necessary.

Recommendation:

Pin third-party actions by commit SHA and add `permissions: { contents: read }` unless a job requires broader access.

## Positive Controls Observed

- Global validation pipe uses whitelist, transform, and forbidden unknown properties in `apps/api/src/bootstrap/create-api-application.ts:65` through `apps/api/src/bootstrap/create-api-application.ts:68`.
- Fastify body limit is set to 1 MB in `apps/api/src/bootstrap/create-api-application.ts:53`.
- Helmet is registered in `apps/api/src/bootstrap/create-api-application.ts:75`.
- CORS is allowlist-driven in `apps/api/src/bootstrap/create-api-application.ts:78`.
- Pino redaction covers authorization, cookies, guest cart token, idempotency key, Stripe signature, passwords, refresh tokens, upload tokens, and token fields in `apps/api/src/app.module.ts:66` through `apps/api/src/app.module.ts:81`.
- Global throttling is registered in `apps/api/src/app.module.ts:91` and enforced as an app guard in `apps/api/src/app.module.ts:130`.
- Stripe webhooks require a signature and raw body in `apps/api/src/modules/payments/controllers/payments-webhook.controller.ts`.
- Webhook events have duplicate protection and retry/lease behavior in `apps/api/src/modules/payments/services/payment-webhook.service.ts`.
- Audit metadata/diff redaction is implemented in `apps/api/src/modules/audit/services/audit.service.ts`.
- Worker/report CSV export escapes formula-leading characters in `apps/worker/src/processors/report-export.processor.ts`.
- Static search did not find unsafe string-built Prisma raw SQL; inspected raw query usage appeared parameterized/tagged.

## Residual Risks and Blocked Checks

- This report did not run live authenticated API probes, fuzzing, SAST/DAST tools, or provider webhooks.
- Redis-backed integration remains environment-dependent per project context.
- The review did not attempt to prove every customer object-level authorization path dynamically.
- The report did not patch findings; it is an audit artifact and remediation queue.

## Suggested Remediation Order

1. Patch notification response serialization and add regression tests for sensitive user fields.
2. Harden seed/config fail-closed behavior for staging/production.
3. Fix checkout cart claiming and idempotency/order linkage.
4. Split refund execution permission and add refund amount policy controls.
5. Add token freshness/versioning for admin privilege changes.
6. Add `CustomerGuard` and apply it to customer-only routes.
7. Disable OpenAPI/admin SPA defaults outside local development and harden maintenance.
8. Add header/string max-length validation and guest token entropy rules.
9. Reconcile Stripe amount/currency and refund payment-intent ownership.
10. Lower dependency audit gate or override `@hono/node-server`.
