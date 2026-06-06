# Context

## Files inspected

- All 36 source files in `apps/api/public/dashboard/src/`
- `apps/api/public/dashboard/package.json`
- `apps/api/public/dashboard/vite.config.ts`
- `apps/api/public/dashboard/eslint.config.js`
- `apps/api/public/dashboard/index.html`
- `plans/dashboard-theme-form-system/*`
- `redesign-dashboard-summary/*`
- HeroUI official docs (already referenced in redesign summary)

## Files to change

- `src/index.css` — hardcoded theme colors in body/grid
- `src/components/shell/ShellLayout.tsx` — hardcoded gradient
- `src/components/ui/ConfirmModal.tsx` — Switch/Checkbox onChange contract
- `src/components/ui/Feedback.tsx` — auto-dismiss
- `src/components/ui/DataTable.tsx` — empty state improvement
- `src/components/shell/Sidebar.tsx` — ScrollShadow
- `src/pages/HomePage.tsx` — repeated statusTone calls
- `src/lib/format.ts` — statusTone edge cases

## New dependencies

- None planned; all fixes use existing HeroUI APIs

## Environment variables

- No new env vars needed
- Existing: `VITE_API_BASE_URL`, `VITE_CSRF_COOKIE_NAME`, `VITE_REQUEST_TIMEOUT_MS`, `VITE_API_PROXY_TARGET`

## Open questions

- Does HeroUI v3 Switch use `onChange` or `onValueChange`? (verify against local package types)
- Does the backend `/api/v1` correctly serve CSRF tokens for the dashboard?
