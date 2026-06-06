# Feature: Dashboard HeroUI Rebuild

## Goal

Rebuild the embedded administrator dashboard as a professional HeroUI-based SPA with a stronger design system and a proper generated-client API integration layer.

## Acceptance Criteria

- The dashboard package uses HeroUI and Tailwind CSS v4 as the primary UI foundation.
- The app shell, login experience, navigation, and core operational pages are visually rebuilt rather than lightly reskinned.
- API access is centralized through a typed client layer based on `packages/contracts/generated/typescript`, including authenticated requests and token refresh handling.
- The dashboard still builds into `apps/api/public/admin` and remains compatible with `/admin` serving plus same-origin `/api/v1` backend access.
- Existing high-value workflows remain reachable: authentication, overview, orders, catalog, inventory, pricing, payments, fulfillment, reviews, notifications, reports, staff, content, and system.
- Dashboard package lint and typecheck pass, and the production build succeeds.

## Approach

1. Replace the CSS-module-heavy shell with a HeroUI provider, Tailwind v4 theme tokens, and a new layout/navigation system.
2. Add a typed dashboard API client wrapper around the generated OpenAPI TypeScript SDK, including auth storage, refresh recovery, and query-friendly helpers.
3. Rebuild shared primitives first, then migrate route pages onto the new primitives and client hooks.
4. Preserve route coverage and `/admin` output while reducing one-off fetch and table code.

## Scope

### In Scope

- `apps/api/public/dashboard` dependency, build, styling, provider, and route architecture changes.
- New shared HeroUI components, layout system, and theme tokens.
- New typed API integration layer using the generated TypeScript client.
- Reworked login, overview, and module pages within the existing route map.

### Out of Scope

- Backend API contract changes unless a hard integration mismatch is discovered.
- New server endpoints, persistence models, or auth semantics.
- Changes outside the dashboard package except required plan and stack documentation updates.

## Dependencies

- `packages/contracts/generated/typescript`
- Existing `/api/v1` admin endpoints and refresh-token auth flow
- Existing `/admin` Vite build output and NestJS static serving path

## Estimated Complexity

L
