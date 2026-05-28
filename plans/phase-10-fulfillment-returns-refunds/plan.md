# Phase 10: Fulfillment, Returns, and Refunds

## Goal

Implement post-purchase operational flows for shipment, delivery tracking, returns moderation, and refund execution with auditable financial and stock invariants.

## Acceptance Criteria

- Shipment and tracking models plus customer/admin APIs are implemented.
- Return request, review, receiving, and disposition flows are supported.
- Refund execution enforces paid-amount ceilings and partial/full refund consistency.
- Restock policy decisions are explicit and tied to inventory updates when appropriate.
- Tests cover order-state, payment-state, and inventory invariants across post-purchase flows.

## Approach

Build fulfillment and returns on top of authoritative order and payment state transitions, keeping finance, stock, and customer visibility aligned.

## Scope

### In Scope

- Shipment lifecycle
- Return request and moderation flows
- Refund calculations and execution hooks
- Restock policy handling
- Notifications and audits around sensitive actions

### Out of Scope

- Carrier-native integrations unless manually selected later
- Exchange orders or store-credit systems beyond minimal extension points

## Dependencies

- `phase-08-orders-idempotency-cod`
- `phase-09-online-payments-webhooks`

## Estimated Complexity

L
