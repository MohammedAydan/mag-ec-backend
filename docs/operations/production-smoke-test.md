# Production Smoke Test Plan

## API Baseline

1. `GET /api/v1/health/liveness` returns `200`.
2. `GET /api/v1/health/readiness` returns `200`.
3. OpenAPI JSON remains available only in environments where `OPENAPI_ENABLED=true`.

## Auth and Admin

1. Admin login succeeds with a valid account.
2. Invalid login produces the expected error contract.
3. A protected admin endpoint rejects missing or invalid bearer tokens.

## Commerce Flow

1. Public catalog read succeeds.
2. Cart mutation succeeds.
3. Checkout preview succeeds.
4. COD order placement succeeds.

## Payment and Post-Purchase

1. If Stripe is enabled, webhook signature verification is exercised with staging credentials before production cutover.
2. Admin shipment visibility loads.
3. Report export creation succeeds and moves to a terminal state.

## Operational Checks

1. Worker logs show queue processors booting without connection errors.
2. Structured logs include `x-request-id`.
3. No unexpected 5xx spikes appear during smoke traffic.
