# Fulfillment And Returns Invariants

## Phase 10 Scope

Phase 10 adds manual shipment management, customer return requests, administrative return review and receiving, explicit restock decisions, and provider-backed refund execution for captured Stripe payments.

## Shipment Rules

- Shipments are first-class records linked to orders and order lines.
- Shipment quantities cannot exceed the remaining unallocated quantity of any order line across non-cancelled shipments.
- Shipment creation alone does not fulfill an order; fulfillment state is derived from shipped or delivered quantities.
- Shipment status transitions are intentionally narrow:
  - `PENDING -> SHIPPED`
  - `PENDING -> CANCELLED`
  - `SHIPPED -> DELIVERED`

## Fulfillment State Rules

- Order fulfillment state is derived from shipment and received-return artifacts instead of being mutated ad hoc.
- `UNFULFILLED` means nothing has shipped.
- `PARTIALLY_FULFILLED` means some but not all order-line quantities have shipped or been delivered.
- `FULFILLED` means every order-line quantity has shipped or been delivered.
- `PARTIALLY_RETURNED` means at least one received return exists, but the entire order quantity has not been received back.
- `RETURNED` means every order-line quantity has been received back through approved return workflows.

## Return Rules

- Customers can only request returns for their own orders.
- Return quantities cannot exceed the shipped quantity minus quantities already committed by non-rejected, non-cancelled return requests.
- Returns move through explicit moderation states: `REQUESTED`, `APPROVED` or `REJECTED`, then `RECEIVED`, then `CLOSED` after refund completion.
- Return receiving must provide a disposition for every requested item.

## Restock Rules

- Restock is never implied by refund approval alone.
- Inventory is only incremented during return receiving when an administrator explicitly sets `finalDisposition=RESTOCK`.
- Restocked items require a target `warehouseId`.
- Non-restocked dispositions such as `INSPECT` or `DISCARD` do not change sellable stock.

## Refund Rules

- Automatic refund execution is limited to orders with captured Stripe payment attempts.
- Refund requests are capped by the remaining committed refundable balance, counting both `PENDING` and `SUCCEEDED` refunds.
- Successful refunds move order payment state to `PARTIALLY_REFUNDED` until the cumulative succeeded refund total reaches the captured order total, at which point the order becomes `REFUNDED`.
- COD orders do not currently have an automatic provider refund path.

## Audit And Notification Rules

- Shipment creation, shipment status changes, return creation, return review, return receiving, and refund execution all emit audit records.
- Sensitive post-purchase actions also emit outbox events so later notification adapters can react without coupling operational logic to transport concerns.
