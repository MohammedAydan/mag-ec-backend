# Phase 05 Review

## What Was Built

- Added promotion, coupon, exclusion, and redemption-ledger Prisma models plus the incremental migration artifact at `prisma/migrations/20260525_05_promotions_coupons/migration.sql`.
- Added a promotions module with admin upsert APIs, coupon normalization, deterministic eligibility evaluation, and audit logging for promotion and coupon changes.
- Integrated promotions into checkout preview so subtotal discounts, rejected rules, free-shipping effects, and discounted shipping eligibility are returned in one pricing response.
- Seeded representative automatic and coupon-backed promotions plus the required `promotions.read` and `promotions.write` permissions.
- Added unit, e2e, and MySQL-gated integration coverage for rule evaluation, admin authorization, and relational promotion persistence.

## Edge Cases Handled

- Promotion and coupon windows are validated independently and rejected when inactive or expired.
- Percentage discounts use basis-point math and optional max-discount caps to avoid ad hoc rounding drift.
- Fixed-amount promotions require a currency match before they can apply.
- Stacking is deterministic through priority sorting, explicit combinability, and self-relation exclusions.
- Total and per-customer usage ceilings are enforced using reserved-plus-redeemed counters and redemption-ledger aggregation.

## Known Limitations / Follow-Ups

- Reservation claim, consume, and release flows are intentionally deferred until later checkout and order phases.
- Eligibility is currently wired into pricing preview rather than a full cart or order-placement orchestration path.
- MySQL-backed promotion integration remains skipped locally without `RUN_MYSQL_INTEGRATION=true` and a reachable MySQL runtime.
