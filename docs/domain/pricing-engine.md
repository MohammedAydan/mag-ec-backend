# Pricing Engine

## Scope

Phase 04 introduces authoritative money, tax, and shipping calculation primitives for catalog variants and checkout preview.

## Core Model

- `CatalogVariantPrice`
  - Stores the sellable unit price in integer minor units and a single ISO currency code.
  - Supports optional sale windows and optional tax-class assignment.
- `TaxClass`
  - Names a tax policy bucket for variants.
- `ManualTaxRate`
  - Stores a per-country basis-point rate for a tax class and whether the amount is tax-inclusive.
- `ShippingZone`
  - Groups destination countries.
- `ShippingMethod`
  - Defines a flat or percentage-of-subtotal shipping rule with optional subtotal and item-count thresholds.

## Money Rules

- All amounts are stored and computed as integer minor units.
- Percentage calculations use basis points and deterministic half-up rounding through the money service.
- Currency mismatches are rejected before arithmetic or checkout preview aggregation.

## Checkout Preview

- Input is destination country, currency, and a list of variant IDs with quantities.
- Output includes:
  - line effective unit amount
  - line subtotal amount
  - line tax amount
  - aggregate subtotal and tax
  - shipping options with final totals

## Store Settings

- `store.currency`
  - public default currency metadata
- `store.pricing`
  - internal pricing behavior defaults such as tax-inclusion expectations and default tax country

## Current Limits

- Pricing is variant scoped, not price-list scoped.
- Tax uses the manual strategy only in phase 04, but the strategy interface is designed for later provider-backed implementations.
- Shipping is rule based and does not yet integrate with external carrier quoting.
