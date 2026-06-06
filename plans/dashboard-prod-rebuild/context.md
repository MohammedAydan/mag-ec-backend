# Context: dashboard-prod-rebuild

## Files to modify
- `src/main.tsx` — add HeroUI Provider, drop old imports
- `src/App.tsx` — preserve route tree, wire new shell
- `src/index.css` — replace with minimal HeroUI-compatible reset
- `src/lib/http.ts` — CSRF support, error sanitization hardening
- `src/lib/auth.tsx` — token fingerprinting, brute-force awareness

## Files to delete
- `src/components/` — entire directory (shell + ui subdirs)
- All `*.module.css` files

## Files to create
- `src/components/shell/ShellLayout.tsx` — HeroUI-native layout
- `src/components/shell/Sidebar.tsx` — HeroUI-native navigation
- `src/components/shell/TopBar.tsx` — HeroUI-native top bar
- `src/components/ui/LoadingScreen.tsx` — HeroUI Spinner-based
- `src/components/ui/PageShell.tsx` — shared page wrapper
- `src/components/ui/DataTable.tsx` — HeroUI Table abstraction
- `src/components/ui/StatCard.tsx` — HeroUI Card-based
- `src/components/ui/ConfirmModal.tsx` — HeroUI Modal + Form
- `src/components/ui/Feedback.tsx` — HeroUI Alert-based
- All page files rewritten in `src/pages/`

## New deps
- None (all already installed)

## Env vars
- `VITE_CSRF_COOKIE_NAME` (optional, default: `XSRF-TOKEN`)

## Open questions
- Dark mode: defer to follow-up
- Real-time updates (WebSocket/polling): defer
- Role-based UI visibility: defer (backend already enforces, UI can be CSS-hidden later)
