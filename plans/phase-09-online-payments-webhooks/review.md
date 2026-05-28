# Phase 09 Review: Online Payments and Webhooks

## What Was Built

- Online payment persistence with `PaymentAttempt`, `PaymentWebhookEvent`, and `Refund` models plus the incremental migration artifact at `prisma/migrations/20260525_09_online_payments_webhooks/migration.sql`.
- A `PaymentGateway` boundary with a Stripe-backed PaymentIntent adapter and environment-driven provider selection.
- Checkout online-card placement that creates a Stripe payment attempt while leaving inventory reserved until verified payment confirmation.
- Stripe webhook ingestion with raw-body signature verification, duplicate-event protection, persisted event records, and safe order-payment state transitions.
- Refund foundation hooks through `RefundService`, plus domain and security documentation for payment authority and webhook threat handling.

## Edge Cases Handled

- `online_card` placement is rejected when Stripe is not enabled in config.
- Duplicate webhook deliveries do not replay payment transitions.
- Spoofed webhook payloads fail before any persistence work.
- Failed or canceled online payments release reservations instead of leaving stock stranded.
- COD remains available even when Stripe is enabled as the online provider.

## Known Limitations

- Stripe is the only provider implemented in phase 09.
- The current integration assumes a straightforward PaymentIntent confirmation flow and does not implement delayed capture or partial-capture semantics.
- Local MySQL-backed integration coverage is still environment-dependent, so the payment flow is verified here through schema validation, targeted unit tests, targeted E2E, build, and OpenAPI generation.
- Repo-wide `pnpm.cmd format` still fails because broad pre-existing Prettier drift remains outside this phase scope.

## Follow-Up Tasks

- Phase 10 should execute real refund workflows and post-purchase operational transitions on top of the new payment state model.
- Future work can add payment retry endpoints, provider reconciliation jobs, and richer admin payment visibility.
- Production rollout should include live webhook endpoint registration, alerting, and replay procedures once the final deployment target is chosen.
