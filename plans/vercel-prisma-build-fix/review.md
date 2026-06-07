# Review: Vercel Prisma Build Fix

## What was built
- Hardened `@ecommerce/api` build so it runs `pnpm --dir ../.. prisma:generate` before TypeScript compilation.
- Hardened `@ecommerce/api` OpenAPI generation so contract builds also regenerate Prisma first.
- Hardened `@ecommerce/worker` build so worker-only compile paths do not rely on a previously generated client in the checkout.

## Root Cause
- The Vercel deployment ran in a clean pnpm 10 environment where dependency build scripts were ignored during install.
- Because Prisma client generation was only happening as an install-time side effect, `@prisma/client` reached the API compile step without generated enums, models, and namespaces.
- That directly matches the deployed errors such as missing `Prisma`, missing enums like `UserStatus` and `ShipmentStatus`, and missing `PrismaService` model properties like `user`, `order`, and `catalogProduct`.

## Verification
- `pnpm.cmd --filter @ecommerce/api build` - passed, and now shows an inline `prisma generate` before TypeScript compilation.
- `pnpm.cmd --filter @ecommerce/worker build` - passed, and now shows an inline `prisma generate` before TypeScript compilation.
- `pnpm.cmd build:direct` - not fully green on this machine because the dashboard package hit a separate native Vite/Tailwind oxide load failure before the API step. This is unrelated to the Prisma deploy break and did not appear in the provided Vercel log, where the dashboard build already succeeded.

## Notes
- This fix does not depend on pnpm install-script approvals. Even if Vercel keeps warning about ignored build scripts, the repo-owned build commands now regenerate Prisma explicitly before compile.
- If you want to remove the warning itself later, add an explicit pnpm `allowBuilds` policy for the approved packages in `pnpm-workspace.yaml`.
