# Review: Vercel Postbuild Type Scan Fix

## What was built
- Excluded `public/dashboard` and `public/admin` from the API TypeScript configs so package-level API scans do not compile the embedded dashboard source.
- Added Vercel function packaging rules for `src/main.ts` to exclude `public/dashboard/**` from the Nest function bundle and include built `public/admin/**` dashboard assets.
- Superseded by `vercel-invalid-functions-config-fix`: Vercel rejected `functions.src/main.ts` because `functions` patterns only match files under an `api` directory.
- Replaced the Prisma schema guard's two-argument `Error` constructor with a one-argument form compatible with Vercel's TypeScript/lib scan.

## Root Cause
- The latest Vercel build progressed past dependency install, shared package build, dashboard build, Prisma generation, API build, asset copy, and NestJS entrypoint detection.
- Vercel then ran a postbuild TypeScript/function scan from the `apps/api` root and included `public/dashboard/src/**/*.tsx`.
- Those dashboard files require the dashboard package's JSX/alias tsconfig, so compiling them as API sources produced `--jsx` and `@/` resolution errors.
- `PrismaSchemaGuardService` also used `new Error(message, { cause })`, but Vercel's scan reported an older or narrower lib signature where `Error` accepts only 0-1 arguments.

## Verification
- `Get-Content apps/api/vercel.json | ConvertFrom-Json | Out-Null` - passed
- `pnpm.cmd --filter @ecommerce/api typecheck` - passed
- `pnpm.cmd --filter @ecommerce/api build` - passed

## Notes
- The next Vercel build should progress past the reported `prisma-schema-guard.service.ts(79,11)` error and should not typecheck `public/dashboard/src` as API code.
- `build:vercel` still intentionally builds the dashboard first; the function exclusion only applies to deployment packaging, not to the build step.
- The attempted `vercel.json.functions` approach was removed in the follow-up fix. The corrected approach prunes dashboard source at the end of the Vercel build command.
