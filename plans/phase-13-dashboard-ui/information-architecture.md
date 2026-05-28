# Dashboard Information Architecture

## Primary Navigation

- Home
- Orders
- Catalog
- Inventory
- Pricing
- Promotions
- Fulfillment
- Returns & Refunds
- Payments
- Reviews
- Notifications
- Reports
- Content
- Audit
- Settings

## Home

Purpose: show operational urgency and business health.

Sections:

- Today's command strip: orders needing action, returns awaiting review, failed payments, low stock, pending reviews.
- Revenue and order trend summary.
- Fulfillment risk queue.
- Inventory exceptions.
- Customer experience queue: reviews, notifications, refunds.
- Recent audit activity for high-risk actions.
- System health and integration readiness.

## Orders

Screens:

- Order list with saved views: all, paid, COD pending, awaiting shipment, partially fulfilled, refunded, cancelled.
- Order detail with customer, lines, payments, shipments, returns, refunds, notes, audit timeline.
- Admin actions: inspect, fulfill, cancel if supported, refund handoff, return handoff.

## Catalog

Screens:

- Product list with status, stock, price, category, brand, completeness.
- Product editor with sections: identity, translations, media, variants, attributes, pricing links, inventory links, SEO/content.
- Taxonomy management: product types, brands, categories, collections, tags, attributes.
- Media workflow: upload intent, attach, reorder, alt text, primary image.

## Inventory

Screens:

- Stock levels by variant/warehouse.
- Movement history.
- Adjustment form with reason and audit context.
- Reservation visibility and expiry status.
- Low-stock triage queue.

## Pricing

Screens:

- Store currency and pricing behavior.
- Variant price management.
- Tax classes and country rates.
- Shipping zones and methods.
- Checkout preview tester.

## Promotions

Screens:

- Promotion list/calendar.
- Promotion builder with conditions, benefits, combinability, exclusions, schedule.
- Coupon list and editor.
- Usage and conflict diagnostics.

## Fulfillment

Screens:

- Shipment work queue.
- Shipment detail/status update.
- Carrier/tracking entry.
- Customer-facing shipment visibility preview.

## Returns & Refunds

Screens:

- Return queue by status.
- Return detail with order context and item eligibility.
- Review, receive, restock, waste, and refund flow.
- Refund status and post-purchase state timeline.

## Payments

Screens:

- Payment attempts.
- Webhook event diagnostics.
- Refund history.
- Provider configuration/status.
- Stripe-readiness warnings if provider is enabled.

## Reviews

Screens:

- Moderation queue.
- Review detail with product/order/customer context.
- Approve/reject/hide actions.
- Review history and quality signals.

## Notifications

Screens:

- Notification log.
- Customer preference lookup.
- Dispatch status/failure reason.
- Provider-readiness and retry guidance.

## Reports

Screens:

- Sales summary.
- Top products.
- Promotion performance.
- Inventory KPIs.
- Export job list.
- Create export flow.

## Content

Screens:

- Content pages list.
- Legal references.
- Content editor with preview.
- Localization-ready fields.

## Audit

Screens:

- Audit log list.
- Filters by actor, action, entity, severity, date.
- Detail drawer.
- High-risk action highlighting.

## Settings

Screens:

- Store profile.
- Team/access overview.
- Integrations.
- Environment health.
- Theme/customization.
- User preferences.

## Cross-Cutting Patterns

- Global search should search orders, products, customers/users if supported, SKUs, returns, refunds, reports, and audit events.
- Every module list should support saved views.
- Every detail screen should show an activity/audit timeline where relevant.
- Every async job should show queued/running/succeeded/failed states.
- Every permission-gated action should be hidden or disabled with explanatory text depending on context.
