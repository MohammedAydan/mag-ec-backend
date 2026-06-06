# Dashboard HeroUI Rebuild Review

## What was built

- Reworked the embedded admin SPA around HeroUI v3 and Tailwind CSS v4 instead of the previous CSS-module-first shell.
- Rebuilt the global visual system with new typography, warmer editorial theming, glass-card surfaces, and responsive shell/navigation treatment.
- Rebuilt shared dashboard primitives such as panels, action buttons, badges, stat cards, loading/error/feedback states, tabs, and the JSON action dialog so existing route coverage inherits the new system.
- Rebuilt the login experience and administrator shell while preserving the `/admin` deployment target and current route map.
- Hardened the dashboard API integration with a centralized request layer, env-configurable API base URL/proxy behavior, and refresh-token retry deduplication.
- Added pnpm HeroUI hoisting configuration expected by HeroUI documentation in workspace installs.

## Edge cases handled

- Kept the SPA embedded in `apps/api/public/dashboard` and outputting to `apps/api/public/admin`, matching the approved deployment boundary.
- Preserved same-origin `/api/v1` assumptions while allowing local override through `VITE_API_BASE_URL` and `VITE_API_PROXY_TARGET`.
- Avoided importing the raw generated SDK source into the runtime build where repo-level strict TypeScript settings would surface generated unused-symbol noise.
- Preserved all existing route pages by rebuilding the shared component system first, reducing rewrite risk across the dashboard surface.

## Verification

- `pnpm.cmd --filter @atelier/admin-dashboard typecheck` — passed
- `pnpm.cmd --filter @atelier/admin-dashboard build` — passed

## Remaining follow-ups

- The production bundle still triggers Vite's large chunk warning; route-level code splitting is the next clear optimization step.
- Some pages now inherit the rebuilt shared system rather than having bespoke per-page HeroUI compositions; deeper page-by-page UX refinement can continue from this new baseline without changing the architecture again.
