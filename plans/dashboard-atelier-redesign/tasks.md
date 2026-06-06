# Dashboard Atelier Redesign — Tasks

## Phase 1: Foundation
- [ ] 1.1 Replace `index.css` with Atelier design tokens + Tailwind v4 config
- [ ] 1.2 Update `package.json`: remove HeroUI deps, add `motion`
- [ ] 1.3 Update `main.tsx` to remove HeroUI provider wrapper
- [ ] 1.4 Create `lib/toast.tsx` toast notification context + provider
- [ ] 1.5 Create `lib/animation.ts` shared motion presets

## Phase 2: Shell Rebuild
- [ ] 2.1 Rebuild `Sidebar.tsx` with Atelier brand header + reorganized nav sections
- [ ] 2.2 Rebuild `TopBar.tsx` with Atelier header styling
- [ ] 2.3 Rebuild `ShellLayout.tsx` with maintenance banner + new layout
- [ ] 2.4 Remove `ThemeSwitcher.tsx` (dark-only design)

## Phase 3: Shared UI Components
- [ ] 3.1 Rebuild `PageShell.tsx` without HeroUI Card
- [ ] 3.2 Rebuild `DataTable.tsx` with Atelier table styling
- [ ] 3.3 Rebuild `StatCard.tsx` with Atelier card design
- [ ] 3.4 Rebuild `Feedback.tsx` as Toast-based system
- [ ] 3.5 Rebuild `ConfirmModal.tsx` with Atelier modal styling
- [ ] 3.6 Rebuild `LoadingScreen.tsx` & `PageLoading.tsx` with Atelier spinner
- [ ] 3.7 Rebuild `ErrorBoundary.tsx` with Atelier error styling

## Phase 4: Page Redesign (Operate)
- [ ] 4.1 Redesign `HomePage.tsx` (Overview) with stats grid, revenue chart, recent orders
- [ ] 4.2 Redesign `OrdersPage.tsx` with filter rail + data table
- [ ] 4.3 Redesign `OrderDetailPage.tsx` with stat cards + shipment table
- [ ] 4.4 Redesign `FulfillmentPage.tsx` with returns/refunds sections

## Phase 5: Page Redesign (Sell)
- [ ] 5.1 Redesign `CatalogPage.tsx` with product grid + create drawer
- [ ] 5.2 Redesign `ProductDetailPage.tsx` with variant management
- [ ] 5.3 Redesign `TaxonomyPage.tsx` with tabbed taxonomy management
- [ ] 5.4 Redesign `PricingPage.tsx` with currency + promotions sections
- [ ] 5.5 Redesign `InventoryPage.tsx` with stock/movements/reservations

## Phase 6: Page Redesign (Finance & Engagement)
- [ ] 6.1 Redesign `PaymentsPage.tsx` with attempts/events/refunds tabs
- [ ] 6.2 Redesign `ReviewsPage.tsx` with moderation workflow
- [ ] 6.3 Redesign `NotificationsPage.tsx` with retry management
- [ ] 6.4 Redesign `ReportsPage.tsx` with metrics + exports

## Phase 7: Page Redesign (Govern)
- [ ] 7.1 Redesign `StaffPage.tsx` with RBAC management
- [ ] 7.2 Redesign `ContentPage.tsx` with pages + audit sections
- [ ] 7.3 Redesign `SystemPage.tsx` with health + maintenance controls

## Phase 8: Verify
- [ ] 8.1 Run `pnpm install` to update lockfile
- [ ] 8.2 Run `tsc --noEmit` typecheck
- [ ] 8.3 Run `pnpm build` in dashboard package
- [ ] 8.4 Verify all imports resolve correctly
- [ ] 8.5 Write `review.md`
