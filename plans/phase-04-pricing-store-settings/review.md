# Phase 04 Review

## What Was Built

- Added pricing persistence for variant prices, tax classes, manual tax rates, shipping zones, shipping countries, and shipping methods.
- Implemented a dedicated pricing module with money arithmetic, manual tax strategy, shipping estimation, admin pricing APIs, and a checkout-preview endpoint.
- Extended seeds with pricing permissions, store pricing defaults, tax configuration, shipping configuration, and representative prices for the catalog variants.
- Added unit, e2e, and MySQL-gated integration coverage plus an incremental migration artifact at `prisma/migrations/20260525_04_pricing_store_settings/migration.sql`.

## Edge Cases Handled

- Money arithmetic rejects currency mismatches and rounds percentage calculations deterministically in minor units.
- Checkout preview fails when a variant is unpublished, missing a price, or priced in a different currency than the request.
- Shipping methods enforce their configured rate mode and respect subtotal and item-count thresholds during estimation.
- Tax computation supports both tax-exclusive and tax-inclusive manual rates so future provider adapters can swap in behind the same strategy contract.

## Known Limitations / Follow-Ups

- Variant prices are single-currency in v1; multi-currency or price-list support is deferred.
- Shipping logic is destination-country plus subtotal or quantity based only; dimensional-weight and carrier APIs are deferred.
- DB-backed pricing seed and integration execution still require a reachable MySQL runtime on the machine running verification.
