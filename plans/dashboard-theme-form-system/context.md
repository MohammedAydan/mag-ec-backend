# Context

## Design brief

- Use the existing `Commerce Command Studio` direction from `plans/phase-13-dashboard-ui/design-system.md`.
- Keep the dashboard embedded at `apps/api/public/dashboard` and outputting to `/admin`.
- Respect HeroUI's official v3 guidance for quick start, theming, dark mode, forms, and overlays.

## Files likely to modify

- `apps/api/public/dashboard/src/main.tsx`
- `apps/api/public/dashboard/src/index.css`
- `apps/api/public/dashboard/src/App.tsx`
- `apps/api/public/dashboard/src/components/shell/**`
- `apps/api/public/dashboard/src/components/ui/**`
- `apps/api/public/dashboard/src/lib/admin-actions.tsx`
- `apps/api/public/dashboard/src/pages/**`
- `plans/context.md`
- `plans/TECH_STACK.md`
- `plans/SESSION_LOG.md`
- `plans/dashboard-theme-form-system/review.md`

## New deps

- None expected initially; use the installed HeroUI surface first.

## Open questions

- Whether to prefer `Drawer` for edit/create flows and reserve `AlertDialog` for destructive confirmation. Default plan: yes.
- Whether any action payloads need per-page bespoke editors instead of the shared schema renderer. Likely yes for nested catalog, shipment, and return item arrays.

## Outcome

- Implemented HeroUI quick-start CSS import order with `@import "tailwindcss";` before `@import "@heroui/styles";`.
- Added persistent light, dark, and system theme switching via HeroUI `useTheme`.
- Replaced remaining generic JSON-entry action pages (`CatalogPage`, `StaffPage`, `TaxonomyPage`, `SystemPage`) with structured drawer forms and header-based maintenance secret handling.
- Refreshed shell, page, and login surfaces to the approved dashboard design direction while preserving the embedded `/admin` deployment model.
- Verified dashboard package and workspace builds; the pre-existing Vite large-chunk warning remains a non-blocking follow-up.
