# Phase 04 Context

## Files to Create / Modify

- `apps/api/src/modules/pricing/**`
- `apps/api/src/modules/catalog/**`
- `apps/api/src/app.module.ts`
- `docs/domain/**`
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

- None expected unless currency/date utilities are justified

## Env Vars Needed

- None beyond existing runtime settings for the initial manual-policy implementation

## Open Questions

- Checkout-preview snapshots now include line and aggregate tax amounts, which is enough for downstream order snapshot work before payment capture exists.
- Shipping-rate rules stay subtotal and quantity based in v1; dimensional-weight logic is deferred until fulfillment requirements justify it.

## Completion Notes

- Pricing is stored at the catalog-variant level so checkout, snapshotting, and future inventory reservation logic can price the sellable unit directly.
- Manual tax and shipping configuration is modeled relationally rather than hidden in JSON settings, while store-wide currency and pricing defaults remain in `StoreSetting`.
- The public catalog mapper now exposes variant price payloads alongside the phase-04 checkout preview endpoint.
