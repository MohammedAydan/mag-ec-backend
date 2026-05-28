# Phase 06 Review: Inventory and Reservations

## What Was Built

- **Prisma models**: `Warehouse`, `StockLevel`, `StockMovement`, `StockReservation` with proper foreign keys and a unique compound index on `(warehouseId, variantId)` for `StockLevel`.
- **`InventoryCoreService`**: Five atomic operations:
  - `adjustStock` — create-or-update stock level + append StockMovement + low-stock warning
  - `reserveStock` — conditional SQL UPDATE for oversell prevention + BullMQ expiry job scheduling
  - `releaseStockReservation` — decrement reserved quantity, mark RELEASED
  - `redeemStockReservation` — decrement both onHand + reserved, mark REDEEMED, append SALE movement
  - `expireStockReservation` — decrement reserved quantity, mark EXPIRED
- **`InventoryAdminController`**: Three admin endpoints with RBAC:
  - `POST /inventory/admin/adjustments` (requires `inventory.write`)
  - `GET /inventory/admin/levels` (requires `inventory.read`)
  - `GET /inventory/admin/movements` (requires `inventory.read`, paginated)
- **`InventoryExpiryProcessor`**: BullMQ worker processor for async expiry in `apps/worker`.
- **Seed**: Default warehouse + 100 units for all seeded variants.
- **Tests**: 14 unit tests, 10 E2E tests; MySQL-gated integration spec for concurrency/lifecycle.
- **Docs**: `docs/domain/inventory-invariants.md`, `docs/implementation-status.md`.

## Edge Cases Handled

- Creating a stock level record on first RECEIPT for a new warehouse/variant pair.
- Negative adjustment guard (prevents `quantityOnHand < 0`).
- Zero reservation quantity guard.
- Missing variant guard in `reserveStock`.
- Missing stock level guard (no implicit stock creation on reservation attempt).
- BullMQ queue is `@Optional()` in `InventoryCoreService` so the service boots cleanly without Redis in test environments.
- Expiry processor is idempotent — skips non-RESERVED reservations.
- Expiry processor skips non-expired reservations (delayed jobs that fire early due to clock skew).

## Known Limitations

- No event bus publishing for low-stock, reservation-created, or redemption events. Use `OutboxEvent` in a future phase.
- Single default warehouse — multi-warehouse routing logic deferred.
- BullMQ delayed job precision is approximate (~1s clock skew acceptable).
- `StockMovement.type` enum includes `SALE` but only the `WASTE` movement type passes the existing `adjustStock` parameter union — orders should call `redeemStockReservation` for SALE movements.
- Movement `metadata` field is `JsonNull` if not supplied — consumers should handle absent metadata.

## Follow-Up Tasks

- Phase 07: Orders and Checkout should call `reserveStock` on checkout initiation, `redeemStockReservation` on payment confirmation, and `releaseStockReservation` on cart abandonment.
- Future: Add `OutboxEvent` publishing for inventory domain events.
- Future: Add `TRANSFER_IN` / `TRANSFER_OUT` endpoints when multi-warehouse is enabled.
