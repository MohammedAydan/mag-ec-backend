# Dashboard Atelier Redesign — Context

## Files to Create
- `apps/api/public/dashboard/src/lib/toast.tsx` — Toast notification context/provider
- `apps/api/public/dashboard/src/lib/animation.ts` — Shared motion animation presets

## Files to Modify
- `apps/api/public/dashboard/src/index.css` — Full replacement with Atelier design tokens
- `apps/api/public/dashboard/package.json` — Remove HeroUI, add motion
- `apps/api/public/dashboard/src/main.tsx` — Remove HeroUI provider
- `apps/api/public/dashboard/src/App.tsx` — Minor update for toast provider
- `apps/api/public/dashboard/src/components/shell/ShellLayout.tsx` — Full rebuild
- `apps/api/public/dashboard/src/components/shell/Sidebar.tsx` — Full rebuild with reorganized sections
- `apps/api/public/dashboard/src/components/shell/TopBar.tsx` — Full rebuild
- `apps/api/public/dashboard/src/components/ui/PageShell.tsx` — Rebuild without HeroUI
- `apps/api/public/dashboard/src/components/ui/DataTable.tsx` — Rebuild
- `apps/api/public/dashboard/src/components/ui/StatCard.tsx` — Rebuild
- `apps/api/public/dashboard/src/components/ui/Feedback.tsx` — Rebuild as toast-based
- `apps/api/public/dashboard/src/components/ui/ConfirmModal.tsx` — Rebuild
- `apps/api/public/dashboard/src/components/ui/LoadingScreen.tsx` — Rebuild
- `apps/api/public/dashboard/src/components/ui/PageLoading.tsx` — Rebuild
- `apps/api/public/dashboard/src/components/ui/ErrorBoundary.tsx` — Rebuild
- All 16 page files in `pages/` — Full redesign

## Files to Delete
- `apps/api/public/dashboard/src/components/shell/ThemeSwitcher.tsx` — Dark-only design

## New Dependencies
- `motion` (^12.23.24) — Animation library (framer-motion successor)

## Removed Dependencies
- `@heroui/react`
- `@heroui/styles`

## Env Vars Needed
- None new (existing `VITE_API_BASE_URL` etc. remain)

## Open Questions
- Should we keep react-hook-form + zod for form validation? → Yes, keep for complex forms
- Should we keep @tanstack/react-query? → Yes, core data fetching
- Should we keep react-router-dom hash routing? → Yes, works with NestJS static serving
