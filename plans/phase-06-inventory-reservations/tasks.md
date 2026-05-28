# Phase 06 Tasks

- [x] Update `prisma/schema.prisma` with Warehouse, StockLevel, StockMovement, and StockReservation models.
- [x] Create and document the migration SQL file for Phase 06.
- [x] Update `prisma/seed.ts` to include the default Warehouse and initial StockLevels.
- [x] Implement `InventoryModule` and `InventoryCoreService` with thread-safe stock adjustment, allocation, and reservation operations.
- [x] Create administrative controllers and DTOs for manual adjustments, stock level list, and movements audit log.
- [x] Implement BullMQ worker processor for asynchronous reservation expiry.
- [x] Write unit specs for the inventory service and controllers.
- [x] Write concurrency integration specs verifying oversell prevention.
- [x] Write E2E controller specs verifying RBAC authorization and payload validation.
- [x] Update documentation: `docs/domain/inventory-invariants.md`, `docs/implementation-status.md`.
