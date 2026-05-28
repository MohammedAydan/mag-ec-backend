# API Idempotency

## Checkout Placement

Phase 08 introduces request replay protection for `POST /api/v1/checkout/place`.

- Clients must send an `Idempotency-Key` header for every placement request.
- Authenticated requests are scoped as `checkout.place:user:<userId>`.
- Guest requests are scoped as `checkout.place:guest:<x-guest-cart-token>`.
- Reusing the same key with the same normalized request body returns the stored response instead of creating a duplicate order.
- Reusing the same key with a different request body returns `409 Conflict`.
- Reusing a key while the original request is still in progress returns `409 Conflict`.

## Persistence Model

Idempotency state is stored in the `IdempotencyKey` table with:

- `scope` and `key` as the uniqueness boundary
- `actorUserId` for authenticated ownership tracking
- `requestHash` for payload mismatch detection
- `status` values `PENDING`, `COMPLETED`, and `FAILED`
- `responseCode` and `responseBody` for replay responses

## Operational Notes

- Failed executions mark the key as `FAILED`, allowing the caller to retry the same request with the same key.
- Guest checkout still requires a valid `x-guest-cart-token` header because the idempotency scope is bound to that token.
- The current implementation is specific to checkout placement and is intentionally not yet a repo-wide generic idempotency framework.
