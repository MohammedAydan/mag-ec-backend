# Goal
Restore a clean dashboard production build by aligning the embedded admin SPA with the locally installed HeroUI/Tailwind contracts.

## Acceptance Criteria

- `pnpm.cmd --filter @atelier/admin-dashboard typecheck` passes
- `pnpm.cmd --filter @atelier/admin-dashboard build` passes
- `pnpm.cmd build` passes through the dashboard step that currently fails
- Dashboard pages use valid local HeroUI prop variants instead of stale wrapper-era props
- The Tailwind Vite plugin import resolves from declared package dependencies

## Approach

1. Audit the dashboard package for stale HeroUI prop usage and missing dependencies.
2. Normalize invalid `Button`, `Chip`, `Input`, and `Tabs` usage to the current locally typed API.
3. Tighten one unsafe promotion coupon mapping so it matches the current dynamic record helpers.
4. Add the missing Tailwind Vite plugin dependency and update planning docs for the package surface.
5. Re-run dashboard-specific and workspace build verification.

## Scope: IN

- `apps/api/public/dashboard/**` source and package metadata
- Related planning docs required by the repo workflow

## Scope: OUT

- New dashboard features or page redesign
- Backend API contract changes
- Route-level bundle splitting follow-up work

## Dependencies

- `@heroui/react`
- `@heroui/styles`
- `tailwindcss`
- `@tailwindcss/vite`

## Estimated Complexity

M
