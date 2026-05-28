# Phase 10 Context

## Files to Create / Modify

- `apps/api/src/modules/fulfillment/**`
- `apps/api/src/modules/returns/**`
- `apps/api/src/modules/payments/**`
- `apps/api/src/modules/orders/**`
- `docs/domain/fulfillment-and-returns-invariants.md`
- `docs/domain/payment-and-refund-invariants.md`
- `prisma/schema.prisma`
- `prisma/migrations/20260525_10_fulfillment_returns_refunds/migration.sql`

## New Dependencies to Add

- None expected unless a carrier adapter is approved

## Env Vars Needed

- Carrier credentials only if external shipping integration is introduced

## Open Questions

- Initial release uses manual shipment status updates only; no carrier webhook/import integration was added in this phase.
- Restock remains an explicit administrative receiving decision per return item. Items are only made sellable again when the final disposition is `RESTOCK` with a target warehouse.
