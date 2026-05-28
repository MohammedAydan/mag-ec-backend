# Phase 09: Online Payments and Webhooks

## Goal

Add provider-backed online payment support with verified webhooks, duplicate-event handling, and a safe foundation for refunds.

## Acceptance Criteria

- A `PaymentGateway` port and at least one online provider adapter are implemented behind infrastructure boundaries.
- Payment attempts, provider references, and webhook events are stored with signature verification and idempotent handling.
- Duplicate or replayed webhooks do not mutate order/payment state incorrectly.
- Refund primitives and audit hooks are ready for fulfillment and return workflows.
- Sandbox tests prove that the provider flow works end-to-end without storing card data.

## Approach

Integrate online payments strictly through adapters and provider webhook verification. Payment success must only become authoritative through verified server-side events or explicitly safe confirmation flows.

## Scope

### In Scope

- Payment gateway port
- Provider adapter and webhook ingestion
- Payment attempt persistence
- Duplicate handling and audit trails
- Refund foundation

### Out of Scope

- Multiple providers at once unless required
- Subscription or recurring billing

## Dependencies

- `phase-08-orders-idempotency-cod`

## Estimated Complexity

L
