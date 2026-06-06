# Dashboard File Map

This is the high-signal file map for the redesign. It is not a complete repo diff.

## Core bootstrap and shell

- `apps/api/public/dashboard/src/index.css`
  - Tailwind-first HeroUI import order
  - theme tokens for light and dark
  - body and shell atmosphere styling

- `apps/api/public/dashboard/src/components/shell/ThemeSwitcher.tsx`
  - persistent light, dark, and system theme switcher

- `apps/api/public/dashboard/src/components/shell/ShellLayout.tsx`
  - top-level shell structure and background framing

- `apps/api/public/dashboard/src/components/shell/Sidebar.tsx`
  - revised navigation surface and dashboard identity block

- `apps/api/public/dashboard/src/components/shell/TopBar.tsx`
  - command-studio heading, refresh, theme switcher, user state

## Shared UI system

- `apps/api/public/dashboard/src/components/ui/PageShell.tsx`
  - consistent page framing

- `apps/api/public/dashboard/src/components/ui/ConfirmModal.tsx`
  - actual redesign centerpiece
  - now a schema-driven drawer-form renderer

- `apps/api/public/dashboard/src/lib/admin-actions.tsx`
  - action schema types
  - shared action execution logic
  - field-error flattening and invalidation wiring

## Pages converted during redesign

- `apps/api/public/dashboard/src/pages/LoginPage.tsx`
  - redesigned login screen

- `apps/api/public/dashboard/src/pages/CatalogPage.tsx`
  - structured create-product flow

- `apps/api/public/dashboard/src/pages/StaffPage.tsx`
  - structured invite-role-status-permission flows

- `apps/api/public/dashboard/src/pages/TaxonomyPage.tsx`
  - structured taxonomy creation flows
  - includes product types and attributes with nested controls

- `apps/api/public/dashboard/src/pages/SystemPage.tsx`
  - maintenance password drawer replaces prompt

## Important already-converted pages from the broader action-form migration

These were not the last pages converted, but they are part of the same shared form system:

- `apps/api/public/dashboard/src/pages/ContentPage.tsx`
- `apps/api/public/dashboard/src/pages/FulfillmentPage.tsx`
- `apps/api/public/dashboard/src/pages/InventoryPage.tsx`
- `apps/api/public/dashboard/src/pages/OrderDetailPage.tsx`
- `apps/api/public/dashboard/src/pages/OrdersPage.tsx`
- `apps/api/public/dashboard/src/pages/PricingPage.tsx`
- `apps/api/public/dashboard/src/pages/ProductDetailPage.tsx`
- `apps/api/public/dashboard/src/pages/ReportsPage.tsx`
- `apps/api/public/dashboard/src/pages/ReviewsPage.tsx`

## Planning and repo-brain files

- `plans/context.md`
- `plans/TECH_STACK.md`
- `plans/DECISIONS.md`
- `plans/SESSION_LOG.md`
- `plans/dashboard-theme-form-system/*`

## What another agent should inspect first

If modifying the redesign, start with:

1. `apps/api/public/dashboard/src/components/ui/ConfirmModal.tsx`
2. `apps/api/public/dashboard/src/lib/admin-actions.tsx`
3. `apps/api/public/dashboard/src/index.css`
4. `apps/api/public/dashboard/src/components/shell/ThemeSwitcher.tsx`
5. the specific page being changed
