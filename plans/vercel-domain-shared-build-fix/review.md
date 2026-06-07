# Review: Vercel Domain Shared Build Fix

## What was built
- Updated `apps/api` `build:vercel` to build `@ecommerce/domain-shared` before the dashboard and API compile steps.
- Preserved the existing Vercel flow: build shared declarations, build embedded dashboard, regenerate Prisma, compile API, copy dashboard assets.

## Root Cause
- Vercel is now correctly rooted at `apps/api` and runs `pnpm run build:vercel`.
- The API imports `@ecommerce/domain-shared` from `apps/api/src/modules/storage/object-storage.service.ts`.
- `@ecommerce/domain-shared` declares its types at `packages/domain-shared/dist/index.d.ts`, and `tsconfig.base.json` also maps the package to that dist declaration.
- In a clean Vercel checkout, that dist declaration does not exist until the shared package has been built, so the API compile failed with `TS2307`.

## Verification
- `pnpm.cmd --filter @ecommerce/domain-shared build` - passed
- `pnpm.cmd --filter @ecommerce/api typecheck` - passed
- `pnpm.cmd --filter @ecommerce/api build` - passed

## Notes
- The next Vercel log should show `@ecommerce/domain-shared` building before `@atelier/admin-dashboard` and `@ecommerce/api`.
- The pnpm ignored-build warning can remain non-blocking because Prisma generation is explicit in the API build path.
