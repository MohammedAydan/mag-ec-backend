# Security Remediation Tasks

## Batch 1 — High Priority Backend Fixes

### SEC-001 — Notification sensitive-data exposure
- [x] SEC-001.1 Replace `user: true` include with explicit `select` in `notifications.service.ts`
- [x] SEC-001.2 Serialize notification list responses to DTOs excluding sensitive fields
- [x] SEC-001.3 Add unit tests for sensitive field exclusion
- [x] SEC-001.4 Run notification tests and verify

### SEC-002 — Seed fail-closed
- [x] SEC-002.1 Add environment guards to `prisma/seed.ts` (reject outside local/test without flag)
- [x] SEC-002.2 Require `DEV_SEED_ADMIN_EMAIL` / `DEV_SEED_ADMIN_PASSWORD` outside local/test
- [x] SEC-002.3 Do not overwrite existing admin password by default
- [x] SEC-002.4 Update staging runbook

### SEC-003 — Config fail-closed
- [x] SEC-003.1 Require explicit `DATABASE_URL` in staging/production for API
- [x] SEC-003.2 Require explicit `REDIS_URL` in staging/production for worker
- [x] SEC-003.3 Apply same to Prisma CLI config
- [x] SEC-003.4 Add config validation tests

### SEC-004 — Duplicate checkout prevention
- [x] SEC-004.1 Verified atomic cart claim already in place (checkout-placement.service.ts:117-128)
- [x] SEC-004.2 Verified idempotencyKeyId already linked to Order (line 197)
- [x] SEC-004.3 Verified concurrency test already exists (spec lines 373-409)

## Batch 2 — Authorization & Permissions

### SEC-005 — Refund permission split
- [x] SEC-005.1 Added `refunds.write` permission
- [x] SEC-005.2 Updated refund controller guard to require `returns.write` + `refunds.write`
- [x] SEC-005.3 Updated seed permissions and tests

### SEC-006 — Admin token freshness
- [x] SEC-006.1 Verified `tokenVersion` field already on User model
- [x] SEC-006.2 Verified increment on role/permission/status/password changes
- [x] SEC-006.3 Verified AuthGuard checks version; fixed test files

### SEC-007 — Customer guard
- [x] SEC-007.1 Verified `CustomerGuard` already exists
- [x] SEC-007.2 Applied to missing `CustomerFulfillmentController`
- [x] SEC-007.3 Added e2e tests for admin JWT rejection on customer routes

### SEC-008 — Docs/SPA defaults
- [x] SEC-008.1 Default `DASHBOARD_ENABLED` to false for staging/production
- [x] SEC-008.2 Default `OPENAPI_ENABLED` to false for staging/production
- [x] SEC-008.3 Added deployment smoke check recommendation

### SEC-009 — Maintenance hardening
- [x] SEC-009.1 Removed GET mutating maintenance route
- [x] SEC-009.2 Excluded maintenance from public OpenAPI
- [x] SEC-009.3 Applied throttling (removed @SkipThrottle)

## Batch 3 — Input Validation & Data Integrity

### SEC-010 — Header validation
- [x] SEC-010.1 Updated idempotency-key regex to include underscores
- [x] SEC-010.2 Verified idempotency-key already required

### SEC-011 — Guest cart token entropy
- [x] SEC-011.1 Verified UUIDv4 validation already on DTO
- [x] SEC-011.2 Verified server-side generation and validation already in place

### SEC-017 — String max-length bounds
- [x] SEC-017.1 Updated token max-length to 256; other bounds already present
- [x] SEC-017.2 Verified token validation before expensive hashing

### SEC-012 — Stripe amount/currency reconciliation
- [x] SEC-012.1 Verified amount/currency already extracted from Stripe events
- [x] SEC-012.2 Added security audit logging for mismatch events

### SEC-013 — Refund PI ownership check
- [x] SEC-013.1 Verified PI ownership check already in place
- [x] SEC-013.2 Added security audit logging for mismatch events

### SEC-014 — Refund amount policy
- [x] SEC-014.1 Verified cap calculation from received return items already in place
- [x] SEC-014.2 Verified override permission and audit metadata already required

### SEC-015 — Promotion usage race safety
- [x] SEC-015.1 Verified race-safe conditional updates already in promotion-usage.service.ts
- [x] SEC-015.2 Verified per-customer limit enforcement under same transaction

## Batch 4 — Infrastructure & Low Severity

### SEC-016 — Dependency audit gate
- [x] SEC-016.1 Lowered audit gate to `moderate`
- [x] SEC-016.2 Added security audit step to CI on every push/PR

### SEC-020 — Docker Compose hardening
- [x] SEC-020.1 Bound dev service ports to 127.0.0.1
- [x] SEC-020.2 Sourced credentials from .env
- [x] SEC-020.3 Added optional Redis auth

### SEC-021 — CI pinning
- [x] SEC-021.1 Pinned third-party actions by commit SHA
- [x] SEC-021.2 Added least-privilege permissions blocks

### SEC-018 — Customer object existence
- [x] SEC-018.1 Changed queries to include userId in where clause
- [x] SEC-018.2 Added security logging for unauthorized probes

### SEC-019 — Media upload integrity
- [x] SEC-019.1 Added checksum verification
- [x] SEC-019.2 Public URLs gated behind checksum verification
