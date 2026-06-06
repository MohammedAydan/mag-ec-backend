# Phase 13 Dashboard UI Context

## Planning Status

- Created on: 2026-05-27
- Status: integrating user's new dashboard SPA
- Integration code: in progress
- Repository boundary: embedded SPA under apps/api/public/admin served by NestJS

## Files Created / Modified

- `apps/api/public/dashboard/vite.config.ts` (modified: set outDir to '../admin' and proxy target to port 3003)
- `apps/api/public/dashboard/package.json` (modified: verify dependencies and build command)
- `apps/api/public/dashboard/src/components/ui/AdminUi.tsx` (modified: replace JsonActionDialog text area with dynamic inputs)
- `apps/api/public/dashboard/src/components/ui/AdminUi.module.css` (modified: add styles for dynamic form inputs)
- `package.json` (modified: add workspace-level scripts for dashboard development and build)
- `plans/phase-13-dashboard-ui/tasks.md` (modified: track integration tasks)
- `plans/phase-13-dashboard-ui/context.md` (modified: this file)

## Known Backend Capabilities To Surface

- Auth and identity: registration/login/refresh/logout, password reset, verification, admin access checks, user profile.
- Catalog: product types, brands, categories, collections, tags, attributes, products, variants, media upload intents, publish/archive, public catalog.
- Pricing/settings: currency behavior, tax classes/rates, shipping zones/methods, checkout preview.
- Promotions/coupons: admin promotion upsert, coupon upsert, combinability/exclusions, usage ledger.
- Inventory: warehouses, stock levels, stock movements, adjustments, reservations, expiry worker.
- Carts/wishlist: cart create/read/update/merge/coupons, wishlist read/add/remove.
- Checkout/orders: preview, reserve, place order, customer order views, admin order views, idempotency, COD/online payment states.
- Payments: payment attempts, Stripe webhook ingestion, provider status, refund foundation.
- Fulfillment/returns/refunds: shipments, shipment status, return request/review/receive/refund, restock behavior.
- Reviews: customer review creation/listing, admin moderation queue.
- Notifications: customer preferences, notification log, dispatch records.
- Reporting: sales summary, top products, promotion performance, inventory KPIs, report exports.
- Audit/content/legal: audit log, content pages, legal references.
- Operations: health endpoints, OpenAPI contract, release runbooks.

## Design Context Still Needed From Product Owner

- Brand personality and tone: refined/luxury, playful, industrial, minimal, editorial, etc.
- Primary retail vertical: fashion, perfumes, cosmetics, electronics, mixed retail, etc.
- Preferred language strategy: English only, English/Arabic, RTL-first, or multilingual.
- Dashboard audience priority: owner-first, ops-first, catalog-first, or support-first.
- Implementation location: separate repo, new `apps/dashboard`, or other.
- Preferred framework constraints, if any.
- Hosting/deployment target and auth cookie/token expectations.

## Planning Assumptions

- The dashboard is an admin/operator UI, not a customer storefront.
- The backend remains REST/OpenAPI-first.
- The UI should support RBAC and hide unavailable actions by permission.
- The UI should be themeable for different brands while preserving accessibility.
- Local development should be possible against `mysql://root:@localhost:3306/ecommerce` with API running on `localhost:3000`.
- Queue-backed features may show provider/worker status when Redis is unavailable.

## Open Questions

- Should dashboard implementation be in a new repository or inside this workspace?
- Should the dashboard use generated `dart-dio` only for Flutter while web uses a TypeScript OpenAPI client, or should all clients share a contracts package?
- Should admin auth use bearer tokens in memory, httpOnly cookies, or a hybrid session strategy?
- Which charts and report visualizations are required for v1 versus later?
- Should the dashboard include white-label theme management for future stores, or only local admin preferences?

## Backend Contract Gaps To Validate Before Build

- Admin user and role management APIs may need broader CRUD beyond access-check.
- Dashboard overview may need aggregate endpoints to avoid expensive client-side composition.
- Cart/wishlist operational views may require admin-safe lookup endpoints if they are in scope.
- Payment provider status and webhook diagnostics may need admin read endpoints.
- Notification retry/provider-health controls may need explicit APIs.
- Store settings may need consolidated admin endpoints for integration status and feature flags.
- Saved views/user preferences may require new persistence models if not kept client-side.
