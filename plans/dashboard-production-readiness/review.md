# Review — Dashboard Production Readiness

## What was built

### P0 — Critical fixes applied

1. **Theme-breaking hardcoded colors fixed**
   - `index.css` body background: replaced `color-mix(...white 8%...)` with `var(--surface)` so dark mode doesn't bleach the page
   - `index.css` grid overlay: replaced hardcoded `rgba` values with `color-mix` referencing theme CSS variables (`--separator`)
   - `ShellLayout.tsx`: extracted hardcoded gradient to `.shell-glow` CSS class that uses `var(--accent)` and `var(--success)` tokens

2. **Performance fix — `chipColor()` helper**
   - Added `chipColor()` to `format.ts` that calls `statusTone()` once instead of the nested ternary calling it 4 times
   - Updated all 14 pages that used the `statusTone(X) === 'success' ? 'success' : statusTone(X) === ...` pattern
   - Reduced per-Chip function calls from 4 to 1

3. **HeroUI contract verified**
   - Switch and Checkbox use `onChange` + `isSelected` (React Aria Components pattern) — confirmed correct against local `@heroui/react` v3.1.0 types

### P1 — UI resilience improvements

4. **Feedback component with auto-dismiss**
   - Added `durationMs` prop for auto-dismiss with cleanup timer
   - Added close button (X) with `onDismiss` callback
   - Preserves backward compatibility — existing call sites unchanged

5. **ScrollShadow in sidebar**
   - Wrapped sidebar nav content with HeroUI `ScrollShadow` for smooth scroll indicators

### P2 — Error hardening

6. **React Error Boundary**
   - Added `ErrorBoundary` class component wrapping the full app tree in `main.tsx`
   - Shows branded error screen with error details, "Try again" reset, and "Go to dashboard" link
   - Logs errors to console with component stack trace

### P3 — Production polish

7. **Keyboard shortcut for sidebar**
   - `Ctrl+K` / `Cmd+K` toggles navigation sidebar
   - Menu button aria-label updated to hint at shortcut

## Edge cases handled

- Theme tokens: all gradient and overlay surfaces now respect light/dark/system mode
- Feedback dismiss: timer cleanup prevents state updates on unmounted component
- Error boundary: catches rendering errors without crashing the entire SPA
- Keyboard shortcut: respects `preventDefault()` to avoid browser search conflicts
- All existing page contracts preserved — no breaking changes to props or API

## Known limitations / follow-ups

- Large Vite chunk warning (784 kB JS) still present — route-level code splitting remains follow-up
- Browser visual QA not yet run (requires live API backend)
- `chipColor` migration used in 14 pages but `statusTone` import remains in some files where it's still used directly for non-Chip purposes (e.g., StatCard accent props) — this is correct
- Skeleton loading variants deferred as low priority
- No automated E2E/browser tests for the dashboard

## Files changed

### Modified
- `src/index.css` — body bg, grid overlay, `.shell-glow` class
- `src/components/shell/ShellLayout.tsx` — gradient via CSS class
- `src/components/shell/Sidebar.tsx` — ScrollShadow, chipColor import
- `src/components/shell/TopBar.tsx` — Ctrl+K shortcut, aria-label update
- `src/components/ui/Feedback.tsx` — auto-dismiss + close button
- `src/lib/format.ts` — added `chipColor()` helper
- `src/main.tsx` — ErrorBoundary wrapper
- `src/pages/HomePage.tsx` — chipColor migration
- `src/pages/CatalogPage.tsx` — chipColor migration
- `src/pages/OrdersPage.tsx` — chipColor migration
- `src/pages/FulfillmentPage.tsx` — chipColor migration
- `src/pages/InventoryPage.tsx` — chipColor migration
- `src/pages/PaymentsPage.tsx` — chipColor migration
- `src/pages/ReviewsPage.tsx` — chipColor migration
- `src/pages/NotificationsPage.tsx` — chipColor migration
- `src/pages/ContentPage.tsx` — chipColor migration
- `src/pages/OrderDetailPage.tsx` — chipColor migration
- `src/pages/PricingPage.tsx` — chipColor migration
- `src/pages/ProductDetailPage.tsx` — chipColor migration
- `src/pages/ReportsPage.tsx` — chipColor migration
- `src/pages/StaffPage.tsx` — chipColor migration
- `src/pages/TaxonomyPage.tsx` — chipColor migration

### Created
- `src/components/ui/ErrorBoundary.tsx` — React error boundary
- `plans/dashboard-production-readiness/plan.md`
- `plans/dashboard-production-readiness/tasks.md`
- `plans/dashboard-production-readiness/context.md`
