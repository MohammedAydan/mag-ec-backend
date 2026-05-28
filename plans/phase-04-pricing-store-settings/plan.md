# Phase 04: Pricing, Store Settings, Taxes, and Shipping Rates

## Goal

Introduce a reusable pricing engine and store-configuration layer that computes authoritative product, cart, and shipping amounts using portable money primitives and policy-driven settings.

## Acceptance Criteria

- Money primitives and pricing services use integer minor units and currency codes consistently.
- Product/base/sale pricing and store settings APIs are implemented with clear admin control.
- Shipping zones, methods, and rate calculation logic are available for checkout preview usage.
- Tax strategy is abstracted behind a configurable interface suitable for later provider extension.
- Tests cover rounding, currency mismatches, and snapshot-readiness for order placement.

## Approach

Create a narrow set of reusable pricing abstractions before cart and order flows begin. Keep tax and shipping policy configurable without overfitting to a third-party provider.

## Scope

### In Scope

- Money value objects and pricing services
- Store settings and currency configuration
- Base/sale pricing persistence and APIs
- Shipping zones, methods, and estimation logic
- Tax strategy abstraction

### Out of Scope

- External tax engines
- Marketplace or multi-store price partitioning

## Dependencies

- `phase-03-catalog-media-localization`

## Estimated Complexity

M
