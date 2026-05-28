# Phase 09 Context

## Files to Create / Modify

- `apps/api/src/modules/payments/**`
- `apps/api/src/modules/checkout/**`
- `apps/api/src/bootstrap/create-api-application.ts`
- `docs/operations/environment-variables.md`
- `docs/domain/payment-and-refund-invariants.md`
- `docs/security/threat-model.md`
- `plans/TECH_STACK.md`
- `prisma/schema.prisma`
- `prisma/migrations/20260525_09_online_payments_webhooks/migration.sql`

## New Dependencies to Add

- Stripe Node SDK for the first provider-backed online payment integration

## Env Vars Needed

- `PAYMENT_PROVIDER` with `cod` or `stripe`
- `PAYMENT_WEBHOOK_SECRET`
- `STRIPE_SECRET_KEY`

## Open Questions

- Stripe is the selected first provider for phase 09, using a PaymentIntent-style server-owned payment flow suitable for Flutter clients.
- Phase 09 will assume a simple one-step charge confirmation model first; delayed capture and richer authorization handling can remain future extensions unless the implementation uncovers a hard blocker.
