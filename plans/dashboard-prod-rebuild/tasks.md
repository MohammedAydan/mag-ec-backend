# Tasks

## Phase 1: Foundation Cleanup & Security Hardening
- [~] 1.1 — Security-harden the HTTP layer (CSRF token support, stricter error sanitization, CSP-safe headers)
- [ ] 1.2 — Security-harden the auth layer (token fingerprinting, session timeout, brute-force awareness)
- [ ] 1.3 — Delete all old components/ and CSS module files
- [ ] 1.4 — Rewrite `index.css` as minimal global reset + HeroUI theme variables only
- [ ] 1.5 — Rewrite `main.tsx` to include HeroUI Provider wrapper

## Phase 2: HeroUI Shell
- [ ] 2.1 — Build `ShellLayout.tsx` with HeroUI-native sidebar + topbar + main content area
- [ ] 2.2 — Build sidebar navigation with HeroUI ListBox/Button + nav grouping + active state
- [ ] 2.3 — Build top bar with breadcrumbs, user avatar, logout
- [ ] 2.4 — Responsive sidebar (drawer overlay on mobile, persistent on desktop)
- [ ] 2.5 — Build `LoadingScreen` with HeroUI Spinner
- [ ] 2.6 — Update `App.tsx` route tree (preserve existing routes, wire new shell)

## Phase 3: Shared Page Primitives
- [ ] 3.1 — Create `PageShell` wrapper (HeroUI Card + header/actions pattern for every page)
- [ ] 3.2 — Create `DataTable` abstraction using HeroUI Table component
- [ ] 3.3 — Create `StatCard` using HeroUI Card
- [ ] 3.4 — Create feedback/error components using HeroUI Alert
- [ ] 3.5 — Create confirmation/action Modal using HeroUI Modal + Form

## Phase 4: Pages — Core Operations
- [ ] 4.1 — LoginPage (HeroUI Form, Input, Button, Alert for errors)
- [ ] 4.2 — HomePage / Overview dashboard (stat cards, recent orders table, quick actions)
- [ ] 4.3 — OrdersPage (HeroUI Table with sorting, search, status badges, pagination)
- [ ] 4.4 — OrderDetailPage (stat rows, line items table, shipments section, action buttons)

## Phase 5: Pages — Catalog & Taxonomy
- [ ] 5.1 — CatalogPage (products table, search, create button, variant indicators)
- [ ] 5.2 — ProductDetailPage (product form, variant list, pricing section, media section)
- [ ] 5.3 — TaxonomyPage (Tabs for brands/categories/collections/tags/attributes, each with table + CRUD modal)

## Phase 6: Pages — Commerce Settings
- [ ] 6.1 — PricingPage (Tabs for settings/shipping-zones/promotions, tables + modals)
- [ ] 6.2 — InventoryPage (levels table, movements table, reservations table, adjustment modal)

## Phase 7: Pages — Finance & Engagement
- [ ] 7.1 — PaymentsPage (attempts table, webhook events table, refunds section)
- [ ] 7.2 — FulfillmentPage (Tabs for shipments/returns, tables with status badges, action modals)
- [ ] 7.3 — ReviewsPage (moderation table, approve/reject actions)
- [ ] 7.4 — NotificationsPage (dispatch records table, retry action)

## Phase 8: Pages — Governance
- [ ] 8.1 — StaffPage (Tabs for staff/roles/permissions/customers, tables + modals)
- [ ] 8.2 — ReportsPage (sales summary cards, inventory KPIs, top products table, export actions)
- [ ] 8.3 — ContentPage (pages table, create/edit modal)
- [ ] 8.4 — SystemPage (health status, maintenance controls)

## Phase 9: Verification
- [ ] 9.1 — Run `pnpm typecheck` and fix all type errors
- [ ] 9.2 — Run `pnpm lint` and fix all lint errors
- [ ] 9.3 — Run `pnpm build` and ensure clean production build
- [ ] 9.4 — Verify all routes render without runtime errors
