# Phase 05: Promotions and Coupons

## Goal

Add rule-driven promotion and coupon support with authoritative eligibility evaluation, usage controls, and auditable admin management.

## Acceptance Criteria

- Admins can create and manage promotions, coupons, stacking policy, and usage constraints.
- The pricing or cart layer can evaluate eligible and ineligible promotions deterministically.
- Concurrency-safe usage accounting is designed for later order placement integration.
- Unit and integration tests cover fixed, percentage, free-shipping, minimum-spend, exclusion, and customer/order-limit cases.

## Approach

Keep promotion logic composable and isolated from transport concerns. Model usage constraints early so checkout can consume a stable eligibility interface.

## Scope

### In Scope

- Promotion and coupon persistence
- Rule evaluation services
- Admin management APIs
- Public/cart evaluation integration
- Audit logging of sensitive changes

### Out of Scope

- Provider-funded promotions
- Personalized AI recommendation logic

## Dependencies

- `phase-04-pricing-store-settings`

## Estimated Complexity

L
