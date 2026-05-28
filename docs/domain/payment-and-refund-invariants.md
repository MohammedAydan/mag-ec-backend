# Payment And Refund Invariants

## Phase 09 Scope

Phase 09 adds the first provider-backed online payment flow using Stripe PaymentIntents, verified webhook ingestion, duplicate-event protection, and refund-foundation persistence hooks.

## Payment Authority Rules

- Checkout clients are never authoritative for payment success.
- `POST /api/v1/checkout/place` may create an online payment attempt and return a client secret, but the order only becomes paid after a verified webhook is processed server-side.
- Cash on delivery remains a valid fallback path and keeps the phase-08 behavior of redeeming stock at placement time.

## Stock And Promotion Rules

- COD orders redeem their reservation immediately at placement.
- Online-card orders keep stock in `RESERVED` state until a verified success event arrives.
- Failed or canceled online payment events release the outstanding reservation back to available stock.
- Promotion usage is still redeemed at order placement so the checkout snapshot and business commitment remain deterministic.

## Webhook Rules

- Every provider webhook event is persisted in `PaymentWebhookEvent`.
- `(provider, externalEventId)` is the duplicate boundary.
- Duplicate deliveries must not replay order-payment transitions.
- Webhook payload verification uses the provider signature secret and raw request body.

## Refund Execution

- Refunds are now executed through the payment-gateway abstraction instead of being persistence-only placeholders.
- Automatic execution is currently limited to captured Stripe payment attempts.
- A refund cannot exceed the remaining committed refundable balance for the order.
- Refund ceiling checks count both `PENDING` and `SUCCEEDED` refunds so concurrent requests cannot oversubscribe the captured total.
- Successful partial refunds move the order to `PARTIALLY_REFUNDED`; only a fully refunded captured total moves the order to `REFUNDED`.
- Refund execution is tied to audit logging and outbox events so later notification workflows can react safely.

## Known Limits

- Stripe is the only online provider implemented in phase 09.
- The current flow assumes immediate capture-style payment confirmation rather than delayed capture or multi-step authorization.
- Automatic refunds are not implemented for COD orders.
- Local end-to-end webhook verification is limited to sandbox-safe tests because this machine does not have a live MySQL-backed integration environment.
