# Next Session Prompt - Security Remediation

Use this prompt to start a fresh AI agent session in `D:\Projects\NodeJS-Projects\e-commerce-api-d`.

```text
You are working in:

D:\Projects\NodeJS-Projects\e-commerce-api-d

Follow the repository instructions exactly.

1. Read `AGENTS.md`.
2. Read `plans/context.md`.
3. Read `plans/SESSION_LOG.md`.
4. Read `docs/security/security-report-2026-06-01.md`.
5. Read `plans/security-report/review.md`, `plans/security-report/context.md`, and `plans/security-report/tasks.md`.
6. Report a concise Session Resume summary before editing files.

Goal:

Begin resolving all security findings and vulnerabilities documented in `docs/security/security-report-2026-06-01.md`, starting with the highest-risk confirmed issues. Do not re-audit from scratch unless source evidence has changed; use the report as the remediation queue.

Required planning before code:

Create a new feature folder:

`plans/security-remediation/`

Create these files before code changes:

- `plans/security-remediation/plan.md`
- `plans/security-remediation/tasks.md`
- `plans/security-remediation/context.md`

The remediation plan must:

- Include all findings from `SEC-001` through `SEC-021`.
- Mark the first implementation slice as high-priority backend security fixes.
- Keep only one `[~]` task at a time.
- Split work into safe, testable batches.
- Document out-of-scope items clearly if they require production infrastructure, provider credentials, or destructive migration operations.

Recommended remediation order:

1. `SEC-001` - Fix notification response serialization so APIs never return full `User` records or `passwordHash`.
2. `SEC-002` and `SEC-003` - Make seed/config fail closed outside local/test; remove dangerous production/staging defaults.
3. `SEC-004` - Prevent duplicate checkout/order placement from the same cart with a new idempotency key.
4. `SEC-005` and `SEC-014` - Split refund execution permission from `returns.write` and add refund amount policy/override controls.
5. `SEC-006` - Add admin access-token freshness/versioning for role/status/permission/password changes.
6. `SEC-007` - Add a customer-user-type guard for customer-only routes.
7. `SEC-008` and `SEC-009` - Disable docs/admin SPA defaults outside local/dev and harden maintenance endpoint exposure/auth/throttling.
8. `SEC-010`, `SEC-011`, and `SEC-017` - Add header/string max-length validation and guest-token entropy rules.
9. `SEC-012` and `SEC-013` - Add Stripe amount/currency reconciliation and refund payment-intent ownership checks.
10. `SEC-015` - Make promotion/coupon usage claiming race-safe inside checkout transactions.
11. `SEC-016`, `SEC-020`, and `SEC-021` - Harden dependency audit gate, Docker compose dev credentials, and GitHub Actions pinning/permissions.
12. `SEC-018` and `SEC-019` - Normalize customer object existence responses and strengthen media upload integrity.

Implementation rules:

- Do not modify unrelated dirty worktree files.
- Do not revert user changes.
- Prefer small focused patches with tests.
- For every code change, add or update unit/e2e/integration tests that prove the security behavior.
- Update DTO/OpenAPI metadata when request or response contracts change.
- Regenerate OpenAPI only when API contract changes require it.
- Update `plans/security-remediation/context.md` as you learn exact file impacts.
- If a change requires a database migration, create the migration artifact and pause before destructive or production-impacting operations.
- If a change requires real Stripe/Redis/MySQL/staging credentials, document the blocker and add a safe local test substitute.

First implementation batch:

Start with `SEC-001` because it is a direct sensitive-data exposure:

- Inspect `apps/api/src/modules/notifications/services/notifications.service.ts`.
- Replace `user: true` with a strict `select` or explicit serializer matching notification response DTOs.
- Ensure customer and admin notification list responses cannot include `passwordHash`, `normalizedEmail`, refresh sessions, action tokens, or private identity fields.
- Add tests covering both `/notifications/me` and `/notifications/admin` service/controller behavior as appropriate.
- Run the relevant notification tests, API lint/typecheck, and any affected OpenAPI/client verification if response schemas changed.

Suggested verification commands:

- `pnpm.cmd --filter @ecommerce/api test -- notifications.service.spec.ts`
- `pnpm.cmd --filter @ecommerce/api lint`
- `pnpm.cmd typecheck`
- `pnpm.cmd openapi:verify` if OpenAPI metadata or generated contract changes
- `pnpm.cmd security:audit`

Closeout requirements:

- Mark completed tasks `[x]` only after verification.
- Write `plans/security-remediation/review.md`.
- Update `plans/context.md` with active feature/status and remaining security debt.
- Append a new entry to `plans/SESSION_LOG.md`.
- Final response must summarize files changed, findings fixed, verification run, and any blockers.
```
