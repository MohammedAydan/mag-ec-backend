# Security Control Matrix

## Phase 00 Controls

| Control Area         | Implemented Baseline                                                                    |
| -------------------- | --------------------------------------------------------------------------------------- |
| Transport validation | Global Nest validation pipe with whitelist, transform, and forbidden unknown properties |
| Error handling       | Centralized error contract with request correlation                                     |
| Request correlation  | `x-request-id` propagation and structured request logging                               |
| Logging hygiene      | Authorization, cookies, password, refresh token, and set-cookie redaction               |
| Security headers     | Fastify helmet baseline                                                                 |
| CORS                 | Allowlist-driven Fastify CORS configuration                                             |
| Abuse controls       | Global throttling guard                                                                 |
| OpenAPI exposure     | Docs served only when `OPENAPI_ENABLED=true`                                            |

## Phase 02 Controls

| Control Area               | Implemented Control                                                                           |
| -------------------------- | --------------------------------------------------------------------------------------------- |
| Password storage           | Argon2id password hashing through `UserService`                                               |
| Access tokens              | Short-lived bearer JWT access tokens with role/permission claims                              |
| Refresh tokens             | SHA-256 hashed `RefreshSession` records with family rotation and replay revocation            |
| Account recovery           | One-time-use `AccountActionToken` records for password reset and email verification           |
| RBAC                       | `AuthGuard`, `RolesGuard`, `PermissionsGuard`, `@Roles()`, and `@RequirePermissions()`        |
| Object-level authorization | `IdentityPolicyService` enforces self-or-privileged access for user profile reads             |
| Audit trail                | Auth success/failure, reset, verification, and session events recorded to `AuditLog`          |
| Negative security coverage | E2E coverage for missing auth, privilege escalation, and BOLA-style cross-user profile access |

## Phase 03 Controls

| Control Area                | Implemented Control                                                                                                                       |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Admin catalog authorization | `AuthGuard`, `RolesGuard`, and `PermissionsGuard` protect `/api/v1/catalog/admin/**` with `super_admin` plus `catalog.write` requirements |
| Public draft isolation      | Public catalog queries restrict products to `PUBLISHED` status and media to `ATTACHED` status                                             |
| Localization safety         | Translation fallback is deterministic and does not expose draft or admin-only fields when a locale is missing                             |
| Upload-intent security      | Upload intents store hashed one-time tokens with expiry and actor ownership metadata before media attachment                              |
| Media attachment validation | Attach flow verifies product binding, issuing actor, token hash, and expiry before flipping media state to attached                       |
| Security coverage           | Unit and e2e tests cover translation fallback, unauthorized admin access, and invalid media-attachment attempts                           |

## Phase 04 Controls

| Control Area                | Implemented Control                                                                                                                       |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Pricing admin authorization | `AuthGuard`, `RolesGuard`, and `PermissionsGuard` protect `/api/v1/pricing/admin/**` with `super_admin` plus `pricing.write` requirements |
| Money safety                | Money arithmetic is centralized in a service that rejects currency mismatches and uses deterministic minor-unit rounding                  |
| Checkout preview integrity  | Preview pricing rejects unpublished or unpriced variants and mismatched request currencies before tax or shipping totals are returned     |
| Tax abstraction             | Tax logic is isolated behind a strategy contract, with a manual implementation that supports tax-inclusive and tax-exclusive rates        |
| Shipping rule enforcement   | Active shipping methods are filtered by destination country, subtotal thresholds, item-count thresholds, and configured rate mode         |
| Security coverage           | Unit, e2e, and MySQL-gated integration tests cover pricing math, admin access control, and relational pricing persistence                 |

## Phase 05 Controls

| Control Area                   | Implemented Control                                                                                                                             |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| Promotions admin authorization | `AuthGuard`, `RolesGuard`, and `PermissionsGuard` protect `/api/v1/promotions/admin/**` with `super_admin` plus `promotions.write` requirements |
| Coupon normalization           | Coupon codes are normalized centrally before lookup so whitespace and casing differences do not bypass or fork eligibility behavior             |
| Promotion integrity            | Evaluation rejects inactive, expired, currency-mismatched, and minimum-subtotal-ineligible promotions before applying any discount              |
| Stacking safety                | Priority ordering, explicit combinability flags, and exclusion relations prevent ambiguous multi-promotion outcomes                             |
| Usage-limit enforcement        | Aggregate reserved-plus-redeemed counters and per-customer ledger aggregation gate total and customer-specific promotion or coupon usage        |
| Audit trail                    | Promotion and coupon admin writes emit `AuditLog` events for administrative change tracking                                                     |
| Security coverage              | Unit, e2e, and MySQL-gated integration tests cover discount rules, admin access control, and promotion persistence boundaries                   |

## Phase 09 Controls

| Control Area               | Implemented Control                                                                                                                                                                      |
| -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Provider boundary          | Online-card payments are routed through a `PaymentGateway` abstraction with a Stripe adapter rather than embedded directly in checkout logic                                             |
| Payment authority          | Verified webhook processing is the only path that marks online-card orders paid or failed                                                                                                |
| Webhook verification       | Stripe webhooks require signature validation against the raw request body using `PAYMENT_WEBHOOK_SECRET`                                                                                 |
| Duplicate-event protection | `PaymentWebhookEvent` persists provider events and rejects duplicate `(provider, externalEventId)` deliveries from replaying transitions                                                 |
| Reservation safety         | Online-card orders keep inventory reserved until verified success and release reservations on verified failure or cancellation                                                           |
| Negative coverage          | Unit tests cover spoofed signature rejection and duplicate-event handling, and focused E2E coverage confirms the checkout and order routes still behave after the payment-path expansion |

## Phase 11 Controls

| Control Area               | Implemented Control                                                                                                                             |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| Review ownership           | Customer review creation validates `OrderLine` ownership and enforces one review per `(productId, userId)` pair                                 |
| Moderation safety          | Admin moderation requires explicit permission checks and records moderation actions plus audit entries                                          |
| Notification deduplication | Persisted notifications use `deduplicationKey` and queue job IDs to avoid duplicate dispatch attempts                                           |
| Audit redaction            | Audit-log JSON metadata and diff payloads redact sensitive keys case-insensitively before serialization                                         |
| Public content isolation   | Public content and legal-reference reads only return published legal content and do not expose draft pages                                      |
| Export failure visibility  | Report exports persist `PROCESSING`, `COMPLETED`, and `FAILED` states with failure reasons instead of returning unbounded synchronous downloads |

## Phase 12 Release Hardening Controls

| Control Area                 | Implemented Control                                                                                                                             |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| Contract stability           | `pnpm openapi:verify` regenerates OpenAPI and fails if the committed contract is not stable                                                     |
| Flutter client compatibility | CI runs Docker-backed OpenAPI Generator `dart-dio` verification through `pnpm flutter:client:verify`                                            |
| Dependency audit gate        | `pnpm security:audit` blocks high and critical production dependency advisories                                                                 |
| Admin negative coverage      | Phase-11 admin surfaces now have E2E coverage for missing auth, wrong role, missing write permissions, and invalid report-export type rejection |
| Rate-limit tuning            | Global throttling is configurable through `THROTTLE_TTL_MS` and `THROTTLE_LIMIT`                                                                |
| Release operations           | Staging, rollback, migration, smoke-test, monitoring, and incident-response runbooks are documented under `docs/operations/`                    |
