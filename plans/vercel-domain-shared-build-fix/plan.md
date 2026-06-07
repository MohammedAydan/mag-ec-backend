# Plan: Vercel Domain Shared Build Fix

## Goal
Make the Vercel API-root build compile workspace package declarations before the API TypeScript build imports `@ecommerce/domain-shared`.

## Acceptance Criteria
- [ ] `apps/api` Vercel build path builds `@ecommerce/domain-shared` before compiling the API
- [ ] The fix preserves the existing dashboard-first embedded admin build behavior
- [ ] API typecheck and API build remain green locally
- [ ] Planning/session state records the new Vercel failure and fix

## Approach
1. Confirm the failing import resolves through `packages/domain-shared/dist/index.d.ts`
2. Add the domain-shared package build to `apps/api` `build:vercel`
3. Verify API compile paths
4. Update review and session logs

## Scope: IN
- Vercel build ordering for workspace package dependencies
- Planning and handoff docs for the new deploy failure

## Scope: OUT
- Refactoring `@ecommerce/domain-shared`
- Changing storage behavior
- Dashboard optimization

## Dependencies
- `apps/api/package.json`
- `packages/domain-shared/package.json`
- `tsconfig.base.json`

## Estimated Complexity: S
