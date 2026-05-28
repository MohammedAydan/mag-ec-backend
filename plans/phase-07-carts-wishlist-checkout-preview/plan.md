# Phase 07: Carts, Wishlist, and Checkout Preview

## Goal

Provide guest and authenticated pre-purchase flows with secure cart ownership, merge behavior, wishlist support, and checkout preview calculations that reflect current authoritative rules.

## Acceptance Criteria

- Guest and authenticated carts are supported with secure ownership semantics.
- Cart merge behavior and coupon application are deterministic and tested.
- Wishlist APIs exist with proper ownership checks.
- Checkout preview returns current item, price, promotion, shipping, and payment-option readiness without claiming guaranteed stock unless reserved.
- Tests prove carts re-evaluate on pricing and promotion changes.

## Approach

Keep carts as mutable intent state rather than authoritative order state. Use preview composition over premature order creation.

## Scope

### In Scope

- Cart and wishlist persistence plus APIs
- Guest token strategy for carts
- Merge and recalculation rules
- Checkout preview response construction

### Out of Scope

- Order placement
- Guaranteed payment authorization
- Abandoned-cart campaigns beyond minimal hooks

## Dependencies

- `phase-04-pricing-store-settings`
- `phase-05-promotions-coupons`
- `phase-06-inventory-reservations`

## Estimated Complexity

L
