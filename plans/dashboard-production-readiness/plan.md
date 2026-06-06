# Goal
Fix all logical bugs, design inconsistencies, and HeroUI compliance issues in the embedded admin dashboard. Verify end-to-end so the dashboard is production-ready.

## Acceptance Criteria

- Zero TypeScript errors (`pnpm.cmd --filter @atelier/admin-dashboard typecheck`)
- Clean build with no runtime-warnings aside from the known chunk-size notice (`pnpm.cmd --filter @atelier/admin-dashboard build`)
- All HeroUI component contracts align with the locally installed `@heroui/react` v3.1.0 API
- Theme adapts correctly: CSS-variable-driven colors, no hardcoded light-only values in gradients or backgrounds
- All pages handle loading, empty, error, and unauthorized states consistently
- Form system properly handles validation, busy states, and server error feedback on every action
- Data fetches respect error boundaries and don't silently swallow failures
- The `useAuth` and API layer correctly handle token refresh, session expiry, and CSRF tokens

## Approach

1. **P0 — Fix real bugs and HeroUI API misalignments**
   - Verify Switch/Checkbox/Radio onChange vs onValueChange contract
   - Fix hardcoded theme-breaking colors in ShellLayout and index.css
   - Fix multiple `statusTone()` re-evaluations in HomePage
   - Fix regex-based status matching edge cases in `format.ts`

2. **P1 — Fix design inconsistencies and accessibility**
   - Add proper HeroUI ScrollShadow to sidebar
   - Add auto-dismiss capability to Feedback
   - Normalize theme tokens across all surfaces
   - Add consistent focus rings and hover states

3. **P2 — Harden error/edge-case handling**
   - Add React Error Boundary
   - Add consistent empty-state illustrations for all pages
   - Ensure form busy states block duplicate submissions
   - Add proper aria-labels throughout

4. **P3 — Production polish**
   - Add keyboard shortcut for navigation toggle
   - Improve loading state UX with skeleton placeholders
   - Document dashboard architecture and known limitations

## Scope: IN

- `apps/api/public/dashboard/**` — all source files
- Theme/CSS system
- Shared UI components
- All page components
- API/auth layer

## Scope: OUT

- Backend API contract changes
- New dashboard routes
- Bundle-splitting (follow-up optimization)
- Screenshot/browser QA (requires running dev server + API)

## Dependencies

- HeroUI v3.1.0 (`@heroui/react`, `@heroui/styles`)
- Tailwind CSS v4 via `@tailwindcss/vite`
- React 19, React Router v7, TanStack Query v5

## Estimated Complexity

L (multiple files, theme layer, form system, error handling)
