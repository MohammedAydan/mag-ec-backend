# Phase 08 Review: Orders, Idempotency, and Cash on Delivery

## What Was Built

- Order placement persistence with `Order`, `OrderAddress`, `OrderLine`, and `OrderAppliedPromotion` snapshot models plus the incremental migration SQL artifact.
- `CheckoutPlacementService` that revalidates cart ownership, acquires a scoped idempotency key, recalculates pricing server-side, validates COD availability, and commits order placement in one transaction.
- `CheckoutIdempotencyService` that stores request hashes and replay payloads for safe retry behavior on `POST /api/v1/checkout/place`.
- `OrdersModule` with customer and admin read APIs for placed orders.
- `PaymentsModule` with the initial COD-only placement decision service.
- `OrderOutboxService` that emits `order.placed` and `order.status.changed` events at placement time.
- Targeted unit, E2E, and MySQL-gated integration coverage for idempotency, placement behavior, order APIs, and snapshot persistence invariants.

## Edge Cases Handled

- Empty carts cannot be placed.
- Guest placement requires a valid `x-guest-cart-token` and a non-empty `Idempotency-Key`.
- Reused idempotency keys reject payload mismatches and in-flight duplicate submissions.
- Reservation-key reuse validates ownership and exact cart-line parity before placement can proceed.
- Placement fails loudly when the selected shipping method or default warehouse cannot be resolved.

## Known Limitations

- Only cash on delivery is supported; provider-backed online payment transitions are deferred to phase 09.
- Local MySQL-backed placement verification still depends on a reachable MySQL runtime, so the integration spec skips on this machine unless `RUN_MYSQL_INTEGRATION=true` and MySQL is available.
- Repo-wide `pnpm.cmd format` still fails because broad pre-existing Prettier drift remains outside this phase's scope.

## Follow-Up Tasks

- Phase 09 should replace the COD-only payment decision path with provider-backed payment intents, verified webhooks, and duplicate webhook handling.
- Phase 10 should build fulfillment, return, and refund transitions on top of the new order snapshots and outbox hooks.
- Future work can expand order-search and mutation APIs once payment and fulfillment states stabilize.
