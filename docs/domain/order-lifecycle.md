# Order Lifecycle

## Phase 08 Scope

Phase 08 adds the first irreversible checkout path: authoritative order placement with cash on delivery, transactional snapshots, promotion redemption, reservation redemption, and outbox emission.

## Placement Flow

1. Resolve the cart and enforce user or guest ownership.
2. Require and acquire an idempotency key scoped to the actor.
3. Recalculate pricing and promotion eligibility from authoritative server state.
4. Validate the selected shipping method and COD availability.
5. Reuse an active reservation key or create fresh stock reservations.
6. Persist the order snapshot, addresses, lines, and applied promotions in one transaction.
7. Redeem promotion usage and inventory reservations in the same transaction.
8. Mark the source cart as `ABANDONED`.
9. Emit `order.placed` and `order.status.changed` outbox events.

## Snapshot Model

The order aggregate stores immutable placement-time fields needed for later fulfillment, customer service, and payment reconciliation:

- Order header totals and currency
- Customer contact details
- Shipping-method snapshot
- Shipping and billing addresses
- Line-level product, variant, SKU, quantity, and pricing snapshots
- Applied-promotion snapshots including discount amount and coupon source

## Initial Statuses

Cash-on-delivery placement currently creates orders with:

- `status = PLACED`
- `paymentStatus = PENDING`
- `fulfillmentStatus = UNFULFILLED`

These values are intentionally minimal until phase 09 and phase 10 add online-payment and fulfillment transitions.

## Known Limits

- Only cash on delivery is enabled in phase 08.
- Order mutation flows beyond placement and read APIs are deferred.
- Local MySQL-backed end-to-end transaction verification still depends on a reachable MySQL runtime.
