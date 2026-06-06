> **Implementation update — 2026-05-28**
> The approved delivery boundary is now an embedded single-application dashboard at `apps/api/public/admin`, served by NestJS at `/admin`. An operational dashboard implementation has been added for authentication, overview, catalog, taxonomy, pricing/promotions, inventory/reservations, orders, payments, fulfillment/returns, reviews, notifications, customers/staff/RBAC, reports, content/audit and system maintenance. Items below that represent future UX enhancements or test automation remain open until independently verified.

# Phase 13 Dashboard UI Tasks

- [x] Configure user's dashboard SPA integration: Set outDir to '../admin' and proxy target to port 3003 in vite.config.ts.
- [x] Add root workspace scripts to build and run the dashboard (`dashboard:build`, `dashboard:dev`).
- [x] Update the API build pipeline to compile the dashboard as part of the workspace build.
- [x] Verify dashboard loading at `/admin` and authentication using the seeded admin account.
- [x] Confirm product/design context: brand tone, target retail vertical, localization/RTL requirements, deployment preference, and implementation location.
- [x] Choose frontend implementation boundary: embedded SPA assets in `apps/api/public/admin`, served by the API process at `/admin`.
- [x] Choose frontend stack and document decision: dependency-light embedded SPA with same-origin REST client, JSON operation editor and custom design tokens; documented in `docs/operations/integrated-dashboard.md`.
- [x] Create dashboard information architecture and navigation model.
- [x] Map backend APIs and permissions to dashboard modules, routes, actions, and UI states.
- [x] Implement design direction, visual principles, dark/light theme tokens, responsive typography and accessible visual hierarchy.
- [x] Implement dashboard shell: navigation, top bar, profile/session controls, breadcrumbs, responsive drawer and theme switch.
- [x] Implement overview/home cockpit with reporting, orders, payments and runtime health signals.
- [x] Implement authentication, refresh/session handling, staff, roles, permissions and customer visibility.
- [x] Implement catalog, variants and taxonomy operational views/actions; media uses API workflows.
- [x] Implement pricing/settings action views for currency, tax behavior, shipping and variant pricing.
- [x] Implement promotions/coupons read and edit workflows.
- [x] Implement inventory levels, movements, adjustments and reservation visibility.
- [x] Implement privacy-safe support visibility for active carts and customer wishlists without exposing guest bearer tokens.
- [x] Implement order register, order detail, cancellation and shipment actions.
- [x] Implement fulfillment/returns/refunds operational actions.
- [x] Implement payment attempts, webhook events and refund visibility.
- [x] Implement review moderation queue and actions.
- [x] Implement notification delivery ledger and failed-delivery retry.
- [x] Implement analytics summaries and export creation/download visibility.
- [x] Implement recent audit visibility with server-side redaction; advanced filters remain enhancement work.
- [x] Implement content list/edit operations; enhanced preview/localization editor remains future UX work.
- [x] Implement system operations, health and direct-mode maintenance surface.
- [ ] Define reusable components: data table, filters, command palette, status badges, timeline, metric strip, editor shell, drawer, toast, confirmation, file/media panel, chart primitives.
- [x] Define form patterns: replaced JSON payload textarea in action dialog with dynamic, typed input fields.
- [ ] Define data layer: OpenAPI client, auth token storage, refresh handling, query keys, cache invalidation, pagination, mutations, optimistic updates, and error normalization.
- [ ] Define security model: route guards, permission gates, action visibility, token storage strategy, CSRF/CORS assumptions, and audit-aware interactions.
- [ ] Define accessibility plan: keyboard navigation, focus traps, reduced motion, contrast, semantic tables, ARIA for async states, and screen-reader testing.
- [ ] Define responsive plan: desktop primary, tablet operations mode, mobile triage mode, touch targets, and critical-action availability.
- [ ] Define customization plan: theme tokens, density, module visibility, saved views, user preferences, and safe brand overrides.
- [ ] Define performance budgets: bundle targets, route splitting, table virtualization thresholds, chart loading, image/media handling, and network waterfall limits.
- [ ] Define testing plan: unit, component, accessibility, API contract mocks, E2E critical paths, visual regression, and permission matrix tests.
- [ ] Define release plan: preview environment, smoke tests, analytics/telemetry, error monitoring, rollback, and dashboard go/no-go checklist.
- [x] Identify and close immediate read gaps for promotions/coupons, reservations and customers.
- [ ] Review the completed plan with the product owner before starting implementation.
