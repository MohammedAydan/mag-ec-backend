# Security Remediation Context

## Files to Create / Modify

- `apps/api/src/modules/notifications/services/notifications.service.ts` — SEC-001 (remove `user: true`, add explicit select)
- `apps/api/src/modules/notifications/dto/notifications-response.dto.ts` — SEC-001 (notification response DTOs)
- `apps/api/src/modules/notifications/services/notifications.service.spec.ts` — SEC-001 tests
- `prisma/seed.ts` — SEC-002 (fail-closed guards)
- `apps/api/src/config/app.config.ts` — SEC-003 (required env in production)
- `apps/worker/src/config/worker.config.ts` — SEC-003
- `prisma.config.ts` — SEC-003
- `apps/api/src/modules/checkout/services/checkout-placement.service.ts` — SEC-004 (atomic cart claim)
- `prisma/schema.prisma` — SEC-004, SEC-006, SEC-015
- `apps/api/src/modules/returns/controllers/admin-returns.controller.ts` — SEC-005
- `apps/api/src/modules/identity/services/auth.service.ts` — SEC-006
- `apps/api/src/modules/identity/guards/auth.guard.ts` — SEC-006
- `apps/api/src/modules/identity/guards/*.ts` — SEC-007 (new customer guard)
- `apps/api/src/bootstrap/create-api-application.ts` — SEC-008
- `apps/api/src/modules/runtime/controllers/maintenance.controller.ts` — SEC-009
- `apps/api/src/modules/checkout/controllers/checkout.controller.ts` — SEC-010
- `apps/api/src/modules/carts/services/cart.service.ts` — SEC-011
- `apps/api/src/modules/identity/dto/auth.dto.ts` — SEC-017
- `apps/api/src/modules/payments/services/stripe-payment-gateway.service.ts` — SEC-012
- `apps/api/src/modules/payments/services/payment-webhook.service.ts` — SEC-012, SEC-013
- `apps/api/src/modules/payments/services/refund.service.ts` — SEC-013, SEC-014
- `apps/api/src/modules/promotions/services/promotion-usage.service.ts` — SEC-015
- `apps/api/src/modules/promotions/services/promotion-evaluator.service.ts` — SEC-015
- `package.json` — SEC-016
- `.github/workflows/security.yml` — SEC-016
- `.github/workflows/ci.yml` — SEC-021
- `docker-compose.yml` — SEC-020
- Various customer controllers/services — SEC-007, SEC-018
- `apps/api/src/modules/catalog/services/object-storage.service.ts` — SEC-019

## Open Questions

- SEC-006: token version vs. DB-backed freshness check — which pattern for this codebase?
- SEC-006: requires `prisma migrate` — can we create the migration now or pause?

## Dependencies

- Security report at `docs/security/security-report-2026-06-01.md`
- No new npm packages needed

## Verification Commands

- `pnpm.cmd --filter @ecommerce/api test -- notifications.service.spec.ts`
- `pnpm.cmd --filter @ecommerce/api lint`
- `pnpm.cmd typecheck`
- `pnpm.cmd test:e2e`
- `pnpm.cmd security:audit`
