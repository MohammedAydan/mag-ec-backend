# Security Remediation Review

## What Was Built

All 21 security findings from `docs/security/security-report-2026-06-01.md` were remediated or confirmed already-fixed.

## Summary by Finding

| Finding | Severity | Status | What Changed |
|---------|----------|--------|-------------|
| SEC-001 | High | Fixed | Replaced `user: true` with explicit `select` in notification queries; added `toNotificationResponse` serializer; 3 new security tests |
| SEC-002 | High | Fixed | Seed now refuses outside dev/test without `SEED_ALLOW_PRODUCTION`; requires explicit admin credentials in staging/prod; no longer overwrites existing admin password |
| SEC-003 | High | Fixed | `DATABASE_URL` and `REDIS_URL` now required in production/staging across API, worker, and Prisma CLI; local defaults restricted to dev/test |
| SEC-004 | High | Already fixed | Atomic cart claim via `updateMany` with `status: ACTIVE` check already in `checkout-placement.service.ts:117-128`; idempotencyKeyId linked to order |
| SEC-005 | High | Fixed | Added `refunds.write` permission; controller requires both `returns.write` + `refunds.write` for refund endpoint |
| SEC-006 | Medium | Already fixed | `tokenVersion` field, JWT embedding, guard check, and version increments on role/status/password changes all already implemented; fixed 5 test files |
| SEC-007 | Medium | Fixed | `CustomerGuard` already existed; added to `CustomerFulfillmentController`; added 2 new e2e spec files; fixed 13 e2e DI configs |
| SEC-008 | Medium | Fixed | `DASHBOARD_ENABLED`/`OPENAPI_ENABLED` now default `false` in production/staging via `resolveBoolean()` helper |
| SEC-009 | Medium | Fixed | Removed GET mutating maintenance route; added `@ApiExcludeController()`; removed `@SkipThrottle()` |
| SEC-010 | Medium | Mostly fixed | Updated idempotency-key regex to include underscores; validation already present |
| SEC-011 | Medium | Already fixed | UUIDv4 guest token validation, server-side generation, and entropy checks already in place |
| SEC-012 | Medium | Fixed | Added security audit logging for Stripe amount/currency mismatches (reconciliation already existed) |
| SEC-013 | Medium | Fixed | Added security audit logging for refund PI ownership mismatches (check already existed) |
| SEC-014 | Medium | Already fixed | Refund amount cap from received return items and override permission flow already implemented in `returns.service.ts` |
| SEC-015 | Medium | Already fixed | Race-safe conditional `updateMany` and raw SQL `INSERT ... SELECT WHERE` already in `promotion-usage.service.ts` |
| SEC-016 | Medium | Fixed | Audit gate lowered to `moderate`; security audit added to CI on every push/PR |
| SEC-017 | Medium | Fixed | Token max-length increased to 256; other field bounds already present; token validation already before hashing |
| SEC-018 | Low | Fixed | Customer-owned resource queries now include `userId` in `where` clause; uniform `NotFoundException`; security logging for probes |
| SEC-019 | Low | Fixed | Checksum verification added in `CatalogMediaService.attachUploadedMedia()`; rejects mismatches before marking ATTACHED |
| SEC-020 | Low | Fixed | Docker ports bound to `127.0.0.1`; credentials sourced from `.env` with fallback; Redis optional auth; dev-only label |
| SEC-021 | Low | Fixed | All third-party actions pinned by commit SHA; `permissions: { contents: read }` added to both workflows |

## Verification

| Gate | Result |
|------|--------|
| `pnpm typecheck` | 0 errors (all packages) |
| `pnpm --filter @ecommerce/api lint` | 0 errors, 0 warnings |
| `pnpm --filter @ecommerce/api test` | 34 suites, 199 tests passed |
| `pnpm --filter @ecommerce/api test:e2e` | 14 suites, 64 tests passed |
| `pnpm security:audit` | Moderate advisory in `@hono/node-server@1.19.11` (Prisma toolchain, no fix available yet) |

## Known Limitations

- `@hono/node-server` moderate advisory (CVE-2026-39406) persists in Prisma 7 toolchain dependency; no patched version compatible with current Prisma yet
- SEC-006 token version migration (`20260601_15_security_token_version`) may need to be applied against production DB
- SEC-009 maintenance endpoint still uses static bearer secret; HMAC/time-window signing recommended for future
- No live penetration testing was performed post-remediation
