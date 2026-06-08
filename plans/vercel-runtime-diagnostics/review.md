# Review: Vercel Runtime Diagnostics

## What was built
- Added `apps/api/api/diagnostics.ts`, a standalone Vercel Function outside the NestJS bootstrap path.
- The endpoint returns only non-secret deployment readiness metadata:
  - Node version and Vercel region
  - selected execution/provider modes
  - presence, length, and validity booleans for required env values
  - optional provider readiness booleans
- Included `api/**/*.ts` in the API tsconfig so the diagnostic function is typechecked locally.

## Why
- The deployed NestJS function still returns Vercel's generic `FUNCTION_INVOCATION_FAILED` page after the previous config fix.
- That page does not expose the app exception, and the repo has no local `.vercel` metadata or Vercel CLI auth available to fetch logs.
- A standalone function lets us verify whether Vercel can execute any project function and whether the deployment is missing critical env values, without importing NestJS, Prisma, or app modules.

## How to Use
- After redeploy, open:
  - `/api/diagnostics`
- If `/api/diagnostics` returns JSON but `/` or `/admin` still crashes, the problem is in NestJS bootstrap, Prisma/database access, or app module initialization.
- If `/api/diagnostics` also crashes, the issue is project-level Vercel function execution or Vercel project settings.
- If `required.*.valid` is `false`, fix the corresponding Vercel environment variable and redeploy.

## Verification
- `pnpm.cmd --filter @ecommerce/api typecheck` - passed
- `pnpm.cmd --filter @ecommerce/api build` - passed
- `node -e "import('./dist/apps/api/api/diagnostics.js').then((m)=>m.GET()).then(async(r)=>{console.log(r.status); console.log(await r.text());})"` - returned `200` and non-secret JSON

## Notes
- This endpoint is diagnostic infrastructure, not part of the public `/api/v1` contract.
- It intentionally does not print secret values.
