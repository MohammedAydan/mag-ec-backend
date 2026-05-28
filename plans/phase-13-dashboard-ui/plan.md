> **Implementation decision override — 2026-05-28**
> The product owner explicitly requested a single deployable application with the administrator dashboard embedded in the NestJS API project. The former backend-only implementation boundary below is superseded. The approved implementation location is `apps/api/public/admin`, served by the same NestJS process at `/admin`, while all protected operations continue to use `/api/v1` permission-checked endpoints.

# Phase 13: Dashboard UI Planning

## Goal

Plan a complete, modern, customizable admin dashboard experience for operating the e-commerce backend through a beautiful, user-friendly interface.

## Approved Repository Boundary

The administration interface is implemented as an embedded SPA under `apps/api/public/admin` and copied into the API build output. This keeps one runtime and one deployment for Backend APIs and Dashboard UI, while preserving strict server-side authentication, RBAC and audit enforcement.

## Product Vision

Build an operations cockpit for store owners and staff that makes complex commerce work feel calm, fast, and trustworthy. The dashboard should expose catalog, pricing, inventory, orders, returns, payments, reviews, notifications, reporting, content, and audit workflows through a cohesive interface that can adapt to different retail brands without becoming generic.

## Target Users

- Store owner: monitors business health, revenue, fulfillment risk, and customer experience.
- Operations manager: triages orders, shipments, returns, refunds, and inventory issues.
- Catalog manager: maintains products, variants, pricing, media, translations, collections, and content.
- Support agent: answers order, return, refund, review, and customer-notification questions quickly.
- Marketing or merchandising manager: manages promotions, coupons, content pages, review moderation, and reporting exports.
- Technical/admin operator: checks audit events, integration state, security posture, and operational health.

## Core Use Cases

- Understand current store status within 30 seconds after opening the dashboard.
- Find and act on orders, returns, refunds, reviews, and stock exceptions quickly.
- Create and maintain product catalogs with variants, media, localized content, pricing, and inventory.
- Configure store settings, tax, shipping, payment, promotions, coupons, legal content, and notification preferences.
- Export reports and inspect audit logs without needing direct database access.
- Support safe collaboration through RBAC-aware navigation, destructive-action confirmations, and clear auditability.
- Customize visual identity, layout density, accent colors, locale, and module visibility per store/operator preference.

## Acceptance Criteria

- A complete dashboard information architecture exists for every backend capability from phases 00 through 12.
- A design-system strategy exists for theme tokens, typography, layout, responsive behavior, accessibility, and customization.
- A frontend architecture plan exists for routing, generated API client usage, auth/session handling, caching, forms, error handling, and testing.
- A screen-by-screen delivery roadmap exists with dependencies and measurable completion criteria.
- A UX quality bar exists for empty states, loading states, error states, permission states, destructive actions, and keyboard accessibility.
- A clear implementation boundary exists for whether the dashboard is a separate repo, a new workspace app, or another approved location.
- Dashboard frontend assets are embedded in `apps/api/public/admin`, served from `/admin`, and access protected operational data only through authenticated API endpoints.

## Proposed Design Direction

Working title: **Commerce Command Studio**.

The interface should feel like a refined editorial operations desk rather than a generic SaaS dashboard. Proposed visual language: warm off-white surfaces, ink-black typography, muted commerce-material accents such as clay, moss, brass, and deep blue, deliberate asymmetry, crisp tables, strong data hierarchy, and a small number of purposeful motion moments. Avoid the default purple/blue gradient SaaS look.

The UI should be distinctive through:

- A command-center home view organized around operational urgency, not vanity metrics.
- Dense but legible data views with strong filtering, saved views, and inline actions.
- Brand-customizable design tokens without letting customization break accessibility.
- A flexible navigation model that hides unavailable modules by permission and feature flag.
- Fast interaction design: optimistic updates where safe, skeletons where data is loading, and clear background job states.

## Scope

### In Scope

- Admin dashboard planning and UX architecture.
- Design-system and customization strategy.
- API integration plan using the existing REST/OpenAPI backend.
- Authenticated admin workflows and RBAC-aware UI behavior.
- Full module coverage: auth, identity, catalog, pricing, inventory, carts/wishlist visibility where useful, checkout/order operations, fulfillment, returns/refunds, reviews, notifications, reporting, audit, content/legal, settings, and health.
- Responsive desktop/tablet/mobile strategy.
- Accessibility, i18n/RTL, performance, and testing strategy.
- Implementation sequencing and release gates.

### Out of Scope

- Changing backend API contracts unless the UI plan identifies explicit backend gaps.
- Customer storefront UI.
- Marketplace/multi-vendor workflows.
- Native mobile dashboard implementation.

## Dependencies

- Phase 12 release baseline and OpenAPI contract.
- Stable admin authentication and RBAC permissions.
- Seeded admin roles and permissions.
- Generated or hand-written API client strategy.
- Product decision on dashboard implementation location and preferred frontend stack.
- Design context from the product owner: brand personality, target retail vertical, preferred tone, and localization requirements.

## Proposed Implementation Location Options

- Option A: Separate frontend repo, recommended if the dashboard will have independent deployment and design velocity.
- Option B: New workspace app such as `apps/dashboard`, only if the backend repo boundary is intentionally expanded.
- Option C: Separate Next.js/React project consuming the published OpenAPI contract package.

Approved decision: use the embedded administrator SPA in `apps/api/public/admin` for a single deployment. A future frontend framework migration may replace the static assets only after preserving the same API/RBAC contract and operational coverage.

## Dashboard Architecture Principles

- API-first: consume `/api/v1` through a typed generated client or stable client wrapper.
- RBAC-aware by default: every route, nav item, action, and field-level affordance should map to permissions.
- Progressive disclosure: show high-signal summaries first, reveal advanced controls when needed.
- Customizable but governed: expose theme tokens and density controls, not arbitrary styling that can break UX.
- Resilient states: every screen must have loading, empty, error, offline/retry, and forbidden states.
- Audit-conscious: destructive and security-sensitive actions should reveal impact, reason capture, and audit visibility.
- Accessible: WCAG 2.2 AA, keyboard navigable, high contrast, reduced motion, screen-reader labels, and robust focus management.
- Localizable: English-first with RTL readiness for Arabic and bidirectional content.

## UX Quality Bar

- First meaningful dashboard content should appear quickly with skeletons and prioritized data loading.
- Operators should never have to guess whether an action succeeded, is queued, failed, or requires retry.
- Lists must support search, filters, sorting, pagination/cursors, saved views, and bulk actions where safe.
- Forms must preserve work, validate inline, explain server errors, and support draft/preview patterns for complex entities.
- Dangerous actions must use explicit confirmation, permission checks, and recoverability guidance.
- Empty states must teach the next action, not only say the list is empty.

## Estimated Complexity

XL
