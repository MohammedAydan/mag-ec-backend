# Dashboard HeroUI Rebuild Context

## Status

- Created on: 2026-06-05
- Status: planning complete, implementation starting
- Approved location: `apps/api/public/dashboard` building to `apps/api/public/admin`

## Files Expected To Change

- `apps/api/public/dashboard/package.json`
- `apps/api/public/dashboard/vite.config.ts`
- `apps/api/public/dashboard/src/main.tsx`
- `apps/api/public/dashboard/src/App.tsx`
- `apps/api/public/dashboard/src/index.css`
- `apps/api/public/dashboard/src/lib/**`
- `apps/api/public/dashboard/src/components/**`
- `apps/api/public/dashboard/src/pages/**`
- `plans/dashboard-heroui-rebuild/*`
- `plans/context.md`
- `plans/TECH_STACK.md`
- `plans/DECISIONS.md` if the integration architecture changes materially

## New Dependencies Expected

- `@heroui/react`
- `@heroui/styles`
- `tailwindcss`

## Assumptions

- The existing embedded dashboard boundary is approved and remains in effect.
- The generated TypeScript client under `packages/contracts/generated/typescript` is the preferred API surface for the web dashboard.
- The dashboard should continue using same-origin `/api/v1` access in production and Vite proxying in local development.

## Open Questions

- Whether all route pages should become fully data-dense in this pass or whether some low-frequency pages should share generic module scaffolding.
- Whether any generated-client method names diverge enough from current usage to require small adaptation helpers.
