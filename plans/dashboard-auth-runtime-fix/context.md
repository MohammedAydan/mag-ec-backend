# Dashboard Auth Runtime Fix Context

## Status

- Created on: 2026-06-05
- Status: complete
- Trigger: dashboard login requests to `/api/v1/auth/login` return HTTP 500 at runtime

## Files Expected To Change

- `apps/api/src/modules/identity/**`
- `apps/api/src/bootstrap/**` if runtime serving or middleware contributes to the failure
- `apps/api/public/dashboard/src/**`
- `plans/dashboard-auth-runtime-fix/*`
- `plans/context.md`
- `plans/SESSION_LOG.md`

## New Dependencies Expected

- None expected

## Assumptions

- The seeded admin login flow should work against the embedded SPA without cross-origin changes.
- The current failure is either a backend auth/runtime regression or a dashboard request contract mismatch introduced during the rebuild.
- The desired UI direction is to keep HeroUI components but reduce custom theming and wrapper styling.

## Open Questions

- None remaining for the reported runtime failures. The login issue was local schema drift, and the remaining admin-list failures were string query params reaching Prisma without explicit coercion.
