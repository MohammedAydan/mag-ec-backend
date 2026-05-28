# Phase 08: Orders, Idempotency, and Cash on Delivery

## Goal

Implement authoritative order placement using transactional snapshots, idempotency controls, and a full cash-on-delivery purchase path.

## Acceptance Criteria

- Order and order-line snapshots capture pricing, addresses, and promotion state at placement time.
- Checkout placement is protected by idempotency keys and does not create duplicate orders on retries.
- Inventory reservation usage, coupon accounting, and order persistence are transactionally consistent.
- COD is available as a payment path with correct status transitions and customer/admin order APIs.
- Outbox events are emitted for downstream notifications and processing.

## Approach

Treat order placement as the first irreversible commerce workflow. Recalculate server-side at placement, persist snapshots, and commit only once the authoritative invariants succeed.

## Scope

### In Scope

- Order placement orchestration
- Idempotency service and storage usage
- Order status model and APIs
- COD gateway adapter
- Outbox integration

### Out of Scope

- Online payment provider integration
- Refund execution beyond future hooks

## Dependencies

- `phase-05-promotions-coupons`
- `phase-06-inventory-reservations`
- `phase-07-carts-wishlist-checkout-preview`

## Estimated Complexity

XL
