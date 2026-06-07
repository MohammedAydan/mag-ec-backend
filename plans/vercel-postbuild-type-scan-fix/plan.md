# Plan: Vercel Postbuild Type Scan Fix

## Goal
Make Vercel's postbuild NestJS TypeScript scan compile only the API sources and accept the API code under its compiler settings.

## Acceptance Criteria
- [ ] Vercel scanner no longer typechecks `apps/api/public/dashboard/src/**/*.tsx` as part of the API app
- [ ] `PrismaSchemaGuardService` does not use TypeScript/lib-specific `Error` constructor overloads
- [ ] API typecheck passes locally
- [ ] API build passes locally
- [ ] Session state documents the postbuild scan root cause and fix

## Approach
1. Exclude nested dashboard source/output directories from the API tsconfig files Vercel may load.
2. Replace the two-argument `Error` constructor in the Prisma schema guard with a one-argument form.
3. Verify the API typecheck/build path.
4. Update review and session handoff notes.

## Scope: IN
- API TypeScript configuration under `apps/api`
- Prisma schema guard error wrapping
- Deployment planning/session documentation

## Scope: OUT
- Moving the embedded dashboard package
- Changing API runtime routes
- Changing Vercel project settings beyond the already documented `apps/api` root

## Dependencies
- Existing Vercel project root: `apps/api`
- Existing dashboard build step in `build:vercel`

## Estimated Complexity: S
