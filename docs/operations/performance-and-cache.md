# Performance and Cache Review

## Current Baseline

- Global throttling is enabled through `@nestjs/throttler`.
- Readiness checks cover heap, RSS, database connectivity, and Redis connectivity.
- Queue-backed work is used for notification dispatch, inventory expiry, and report export paths.
- There is no general HTTP response-cache layer enabled in the API today.

## Release Position

- Keep write-heavy and identity-sensitive endpoints uncached by default.
- Prefer targeted downstream caching at the CDN or client layer for future public catalog reads rather than introducing broad server-side cache invalidation late in release hardening.
- Treat reports and exports as asynchronous jobs only; do not add synchronous large-response generation.

## Tunable Runtime Controls

- `THROTTLE_TTL_MS`: global throttling window in milliseconds
- `THROTTLE_LIMIT`: global request budget per window

## Critical-Path Review Notes

- Checkout placement, payment webhooks, refund execution, stock reservation, and review creation should remain uncached and strongly consistent.
- Public catalog reads are the best candidate for a later cache layer once release traffic characteristics are known.
- Audit browsing and report export listing should stay paginated and bounded.

## Follow-Up Candidates

- Add route-specific throttle overrides for auth, webhook, and coupon-probing endpoints if staging traffic shows the global baseline is too coarse.
- Introduce a targeted cache policy for public catalog reads only after measuring real request patterns in staging.
