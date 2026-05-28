# Promotions and Coupon Rules

## Scope

Phase 05 adds relational promotion and coupon configuration, deterministic evaluation, and pricing-preview integration. The current implementation supports automatic promotions and coupon-triggered promotions, but it stops short of claiming or consuming usage during checkout or order placement.

## Persistence Model

- `Promotion` stores the reusable business rule shape: trigger, reward type, minimum subtotal, optional currency, fixed or percentage reward values, max discount cap, combinability, priority, and aggregate usage counters.
- `PromotionExclusion` is a self-relation join table that blocks specific promotions from applying together.
- `Coupon` binds a normalized code and optional usage limits to a single promotion.
- `PromotionRedemption` and `CouponRedemption` are reservation-ready usage ledgers designed for later transactional claim, redeem, and release flows.

## Supported Reward Types

- `FIXED_AMOUNT`
- `PERCENTAGE`
- `FREE_SHIPPING`

## Evaluation Rules

The evaluator service applies the following gates in order:

1. Load active automatic promotions plus any promotions referenced by the provided coupon codes.
2. Normalize coupon input by trimming, removing whitespace, and uppercasing.
3. Reject inactive, expired, or not-yet-started promotions and coupons.
4. Enforce minimum subtotal, currency compatibility, total-usage ceilings, per-customer limits, and per-order application limits.
5. Sort candidate promotions by ascending priority.
6. Apply combinability and explicit exclusion rules before finalizing a promotion.
7. Compute the reward through the shared money service.

The response includes both `appliedPromotions` and `rejectedPromotions` so downstream callers can surface deterministic explanations instead of a silent mismatch.

## Pricing Preview Integration

`PricingPreviewService` now delegates promotion handling to `PromotionEvaluatorService` after line-subtotal aggregation and tax computation setup. The preview response includes:

- `subtotalDiscountAmount`
- `discountedSubtotalAmount`
- `appliedPromotions`
- `rejectedPromotions`

If a promotion grants free shipping, all otherwise eligible shipping methods are returned with zero cost. Shipping percentage calculations also use the discounted subtotal.

## Admin Surfaces

Phase 05 adds:

- `PUT /api/v1/promotions/admin/:promotionKey`
- `PUT /api/v1/promotions/admin/:promotionId/coupons/:code`

Both routes require `super_admin` plus `promotions.write`, and both emit audit-log entries on change.

## Deferred Work

- Reservation and redemption writes in checkout or order placement
- More advanced targeting such as customer segments, category scoping, or provider-funded promotions
- Public cart messaging and coupon claim UX
