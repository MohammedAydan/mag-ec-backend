# Phase 08 Context

## Files to Create / Modify

- `apps/api/src/modules/orders/**`
- `apps/api/src/modules/checkout/**`
- `apps/api/src/modules/payments/**`
- `docs/api/idempotency.md`
- `docs/domain/order-lifecycle.md`
- `apps/api/test/e2e/orders.e2e-spec.ts`
- `apps/api/test/integration/orders.integration.spec.ts`
- `docs/implementation-status.md`
- `plans/ARCH.md`
- `plans/DECISIONS.md`
- `plans/PATTERNS.md`
- `prisma/schema.prisma`
- `prisma/migrations/20260525_08_orders_idempotency_cod/migration.sql`

## New Dependencies to Add

- None expected

## Env Vars Needed

- `PAYMENT_PROVIDER=cod` keeps COD enabled in the initial launch path

## Open Questions

- Phase 08 uses the minimal order state surface `PLACED` + `PENDING` + `UNFULFILLED`; richer payment and fulfillment transitions are deferred to phases 09 and 10.
- Idempotency is enforced per checkout-placement route and actor scope (`userId` or `guestToken`) rather than as a repo-wide global key namespace.
