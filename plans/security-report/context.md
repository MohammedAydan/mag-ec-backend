# Security Report Context

## Files to Inspect

- `apps/api/src/modules/identity/**`
- `apps/api/src/modules/**/controllers/*.ts`
- `apps/api/src/modules/**/services/*.ts`
- `apps/api/src/common/**`
- `apps/api/src/config/**`
- `apps/api/src/main.ts`
- `apps/worker/src/**`
- `prisma/schema.prisma`
- `prisma/seed.ts`
- `scripts/**`
- `.github/workflows/**`
- `package.json`
- `apps/api/package.json`
- `docs/security/**`
- `packages/contracts/openapi/openapi.json`

## Expected Report Artifact

- `docs/security/security-report-2026-06-01.md`

## Subagent Workstreams

- Agent A: authentication, sessions, password reset/verification, JWT/refresh-token handling.
- Agent B: authorization, RBAC, object policies, admin/customer boundary checks.
- Agent C: input validation, DTOs, pipes, upload/media, OpenAPI exposure.
- Agent D: payments, webhooks, idempotency, order/refund fraud-risk surfaces.
- Agent E: persistence, Prisma queries, transactions, tenant/store boundaries, seed data.
- Agent F: config, secrets, CI, scripts, Docker/local operations, dependency risk.
- Agent G: logging, audit trails, privacy, error handling, rate limits/throttles.
- Agent H: worker/queue/background jobs and operational failure modes.

## New Dependencies

None.

## Open Questions

- No live external penetration testing will be attempted unless explicitly requested.

## Findings Summary

- High: Notification APIs include full `User` records and can expose `passwordHash`/private identity fields.
- High: Prisma seed can create or reset a `super_admin` account with public default credentials.
- High: API, worker, and Prisma config can fall back to local database/Redis defaults outside local-only contexts.
- High: Checkout placement can reuse the same cart with a different idempotency key.
- High: Return refund execution is protected by `returns.write` instead of a payment/refund-specific permission.
- Medium: Admin privilege changes do not immediately invalidate existing access JWT permissions.
- Medium: Customer routes accept admin/staff JWTs without a customer-user-type guard.
- Medium: OpenAPI docs/admin SPA are enabled by default, and maintenance is documented/unthrottled/state-changing over GET.
- Medium/Low: Header validation, guest cart token entropy, payment/refund reconciliation, promotion usage races, dependency audit gate, Docker defaults, and CI pinning need hardening.

## Verification

- `pnpm.cmd security:audit` - passed at the repository's high-only audit gate; reported one moderate advisory below the fail threshold.
- `pnpm.cmd audit --prod --json` - completed and reported GHSA-92pp-h63x-v22m / CVE-2026-39406 for `@hono/node-server@1.19.11`.
- `pnpm.cmd exec prettier --check docs/security/security-report-2026-06-01.md plans/security-report/plan.md plans/security-report/tasks.md plans/security-report/context.md` - passed after formatting the report.
