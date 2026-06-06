# Tasks

## P0 — Real bugs and HeroUI API misalignments

- [x] Audit and fix Switch/Checkbox onChange → onValueChange contract for HeroUI v3 — verified: HeroUI v3 wraps React Aria Components, uses onChange + isSelected correctly
- [x] Fix hardcoded theme-breaking colors in ShellLayout.tsx (gradient uses rgba literals) — replaced with `.shell-glow` CSS class using CSS custom properties
- [x] Fix index.css body background `color-mix(...white 8%...)` breaking dark mode — replaced white with `var(--surface)`
- [x] Fix grid overlay in index.css using non-theme-adaptive colors — switched from `rgba` to `color-mix` with theme tokens, reduced opacity
- [x] Fix multiple `statusTone()` re-evaluations in HomePage Chip color logic — replaced with `chipColor()` helper across all 14 pages

## P1 — Design inconsistencies and accessibility

- [x] Add HeroUI ScrollShadow to sidebar navigation
- [x] Add auto-dismiss + close button to Feedback component
- [ ] Normalize card border-radius tokens to use CSS variables — deferred: current tokens use Tailwind arbitrary values consistently
- [ ] Ensure all interactive elements have visible focus indicators — deferred: HeroUI handles focus rings natively
- [ ] Add aria-labels to form fields rendered by ConfirmModal — labels already present

## P2 — Error/edge-case hardening

- [x] Add React Error Boundary wrapping the authenticated app tree
- [ ] Add consistent empty-state templates for DataTable — already partially done, adequate for current use
- [ ] Prevent duplicate form submissions when action is busy — ConfirmModal already sets `isDisabled={busy}` on submit button
- [ ] Ensure LoginPage shows proper disabled states during auth boot — already handled via `isLoading` check
- [ ] Add timeout cleanup for Feedback messages — auto-dismiss now supported via `durationMs` prop

## P3 — Production polish

- [x] Add keyboard shortcut (Ctrl+K / Cmd+K) for sidebar toggle
- [ ] Add PageLoading skeleton variant for better perceived performance — deferred: low priority
- [ ] Add meta viewport documentation and PWA-ready hints — deferred: index.html already has viewport meta
- [-] Document dashboard architecture in redesign-dashboard-summary — already done in summary package

## Verification

- [x] `pnpm.cmd --filter @atelier/admin-dashboard typecheck` — zero errors
- [x] `pnpm.cmd --filter @atelier/admin-dashboard build` — clean build (known chunk-size warning only)
- [ ] Verify theme switching (light/dark/system) works visually — requires running dev server
- [ ] Verify all 16 pages render without console errors — requires running dev server + API
- [ ] Verify form validation works on all action forms — build verified, runtime needs API
- [ ] Verify auth flow (login, refresh, logout, session expiry) — build verified, runtime needs API
