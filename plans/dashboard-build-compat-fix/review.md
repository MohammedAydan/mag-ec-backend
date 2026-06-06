# What was built

- Realigned the dashboard page code with the locally installed HeroUI contract by replacing stale button, chip, input, and tabs props that no longer exist in this checkout.
- Removed unsupported loading and validation props from the login and confirm flows while preserving disabled states and inline validation messages.
- Tightened the promotions coupon rendering path so it works against the dashboard's dynamic `DataRecord` helpers without an unsafe callback annotation.
- Added the missing `@tailwindcss/vite` dev dependency to the embedded dashboard package so `vite.config.ts` resolves during production builds again.

## Edge cases handled

- Kept the existing local HeroUI variant vocabulary (`primary`, `ghost`, `danger-soft`, `soft`) instead of widening theme contracts during a build repair.
- Used `aria-invalid` plus existing error text for login validation because the local input primitive does not expose an `isInvalid` prop.
- Preserved the existing large-chunk warning as a non-blocking follow-up rather than changing bundle behavior inside a compile-fix task.

## Verification

- `pnpm.cmd --filter @atelier/admin-dashboard typecheck`
- `pnpm.cmd --filter @atelier/admin-dashboard build`
- `pnpm.cmd build`

## Remaining follow-ups

- The dashboard bundle still emits the known Vite large-chunk warning; route-level code splitting remains the next performance task if the user wants to continue in this area.
