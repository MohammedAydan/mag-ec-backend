# Context

## Files to modify

- `apps/api/public/dashboard/package.json`
- `apps/api/public/dashboard/vite.config.ts`
- `apps/api/public/dashboard/src/components/ui/**`
- `apps/api/public/dashboard/src/pages/**`
- `plans/context.md`
- `plans/TECH_STACK.md`
- `plans/SESSION_LOG.md`
- `plans/dashboard-build-compat-fix/review.md`

## Files changed

- `apps/api/public/dashboard/package.json`
- `apps/api/public/dashboard/src/components/ui/ConfirmModal.tsx`
- `apps/api/public/dashboard/src/components/ui/StatCard.tsx`
- `apps/api/public/dashboard/src/pages/CatalogPage.tsx`
- `apps/api/public/dashboard/src/pages/FulfillmentPage.tsx`
- `apps/api/public/dashboard/src/pages/InventoryPage.tsx`
- `apps/api/public/dashboard/src/pages/LoginPage.tsx`
- `apps/api/public/dashboard/src/pages/OrderDetailPage.tsx`
- `apps/api/public/dashboard/src/pages/OrdersPage.tsx`
- `apps/api/public/dashboard/src/pages/PricingPage.tsx`
- `apps/api/public/dashboard/src/pages/ProductDetailPage.tsx`
- `apps/api/public/dashboard/src/pages/TaxonomyPage.tsx`
- `plans/context.md`
- `plans/TECH_STACK.md`
- `plans/SESSION_LOG.md`
- `plans/dashboard-build-compat-fix/tasks.md`
- `plans/dashboard-build-compat-fix/review.md`

## New dependencies

- `@tailwindcss/vite` if it is not currently declared in the dashboard package

## Env vars

- None expected

## Open questions

- Resolved: declare `@tailwindcss/vite` in the dashboard package where `vite.config.ts` imports it.
