# Phase 06: Inventory and Reservations

## Goal

Implement authoritative stock tracking, movements, reservations, and oversell-prevention rules that are safe under checkout concurrency.

## Acceptance Criteria

- Warehouse, stock level, stock movement, and reservation models exist and are auditable.
- Admin inventory operations and low-stock signaling workflows are implemented.
- Reservation expiry processing is handled asynchronously and idempotently.
- Integration tests demonstrate that concurrent reservations/checkouts do not oversell stock.
- Inventory history remains append-only and reconcilable.

## Approach

Treat inventory as a transactional domain, not a cached counter. Enforce reservation locks at the database level using atomic update statements to prevent oversell concurrency anomalies. Encode reservation lifecycle explicitly so later checkout and cancellation flows can reuse the same invariants.

## Scope

### In Scope

- Warehouse & stock persistence schema
- Thread-safe reservation operations
- Delayed BullMQ worker jobs for reservation expiry
- Admin APIs for manual inventory movements and listings
- Concurrency integration tests

### Out of Scope

- Multi-warehouse fulfillment optimization
- Purchase order routing and supplier integrations

## Dependencies

- `phase-01-database-core` (for queue & base models)
- `phase-03-catalog-media-localization` (for variant references)

## Estimated Complexity

L
