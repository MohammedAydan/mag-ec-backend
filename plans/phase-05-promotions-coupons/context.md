# Phase 05 Context

## Files to Create / Modify

- `apps/api/src/modules/promotions/**`
- `apps/api/src/modules/pricing/**`
- `apps/api/src/app.module.ts`
- `docs/domain/promotions-rules.md`
- `prisma/schema.prisma`
- `prisma/seed.ts`
- `prisma/migrations/**`
- `packages/contracts/openapi/openapi.json`
- `docs/implementation-status.md`
- `docs/security/control-matrix.md`
- `plans/DECISIONS.md`
- `plans/PATTERNS.md`
- `plans/context.md`
- `plans/SESSION_LOG.md`

## New Dependencies to Add

- None expected

## Env Vars Needed

- None expected

## Open Questions

- Concurrency-safe reservation and redemption writes are modeled now, but the transactional claim or release flow remains deferred until order-placement and inventory phases wire them into checkout orchestration.

## Completion Notes

- Promotions are modeled relationally rather than as an opaque JSON rule engine so stacking, exclusions, usage caps, and later reservation flows remain queryable and auditable.
- Coupon normalization is centralized in a dedicated service so preview, admin, and later checkout paths resolve codes identically.
- Checkout preview now returns applied and rejected promotions, discounted subtotal totals, and free-shipping effects without coupling the pricing module to order placement yet.
