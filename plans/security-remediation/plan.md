# Security Remediation Plan

## Goal

Resolve all 21 security findings (SEC-001 through SEC-021) documented in `docs/security/security-report-2026-06-01.md`.

## Acceptance Criteria

- SEC-001: Notification APIs never return `passwordHash`, `normalizedEmail`, refresh sessions, or action tokens.
- SEC-002/003: Seed and config fail closed outside local/test environments.
- SEC-004: Duplicate checkout from same cart is prevented atomically.
- SEC-005/014: Refund execution requires payment-specific permission; refund amount has policy caps.
- SEC-006: Admin token freshness/versioning prevents stale privileged access.
- SEC-007: Customer routes reject admin/staff JWTs via a guard.
- SEC-008/009: OpenAPI docs/admin SPA default disabled outside local/dev; maintenance hardened.
- SEC-010/011/017: Header/string max-length validation and guest token entropy rules enforced.
- SEC-012/013: Stripe amount/currency reconciliation and refund payment-intent ownership checks.
- SEC-015: Promotion/coupon usage claimed race-safe inside checkout transactions.
- SEC-016/020/021: Dependency audit gate lowered, Docker compose hardened, CI pinned.
- SEC-018/019: Customer object existence normalized; media upload integrity strengthened.
- All changes have regression tests.
- `pnpm lint`, `pnpm typecheck`, `pnpm test`, and `pnpm test:e2e` pass.

## Approach

Multi-agent parallel remediation: dispatch specialized subagents per independent security finding batch, then verify each batch sequentially.

## Scope

- IN: Backend code fixes for all 21 findings, new tests, DTO/OpenAPI updates.
- OUT: Production infrastructure changes, real Stripe/Redis credentials, destructive DB migrations without pause.

## Dependencies

- Security report at `docs/security/security-report-2026-06-01.md` (source of truth).
- No external service dependencies required for code patches.

## Estimated Complexity: XL (21 findings across multiple modules)
