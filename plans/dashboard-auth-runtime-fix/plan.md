# Feature: Dashboard Auth Runtime Fix

## Goal

Fix the live dashboard login/API runtime failures and align the embedded SPA with a simple stock-HeroUI presentation that keeps the current component set but removes custom visual divergence.

## Acceptance Criteria

- `POST /api/v1/auth/login` succeeds with valid seeded admin credentials instead of returning 500.
- Similar dashboard-blocking API/runtime issues discovered during the login flow are fixed in the same pass.
- The embedded dashboard can authenticate against the same-origin API at `http://localhost:3003/admin` in local development.
- The dashboard keeps using HeroUI components, but styling is simplified toward HeroUI defaults rather than custom wrappers/theme treatments.
- Affected API and dashboard packages pass their relevant verification commands after the fixes.

## Approach

1. Reproduce the login failure against the local API and capture the exact backend exception path.
2. Fix the backend auth/runtime bug first, then smoke adjacent auth/session endpoints for similar failures.
3. Trim the dashboard shell/login styling back toward stock HeroUI component usage without changing the route coverage or deployment boundary.
4. Rebuild and verify both the API and dashboard outputs, then record the runtime findings and remaining follow-ups.

## Scope

### In Scope

- Backend auth/runtime fixes required for dashboard login and nearby auth/session flows.
- Dashboard request/auth integration fixes if the failure surface is partly client-side.
- Dashboard shell/login simplification inside `apps/api/public/dashboard` using existing HeroUI components.
- Plan and session documentation updates required by the AGENTS workflow.

### Out of Scope

- New backend product features unrelated to dashboard access.
- A bespoke dashboard redesign beyond simplifying the existing HeroUI-based surface.
- Moving the dashboard out of the embedded `/admin` deployment path.

## Dependencies

- `apps/api/src/modules/identity/**`
- `apps/api/src/bootstrap/create-api-application.ts`
- `apps/api/public/dashboard/**`
- Seeded admin credentials and current `/api/v1` auth/session endpoints

## Estimated Complexity

M
