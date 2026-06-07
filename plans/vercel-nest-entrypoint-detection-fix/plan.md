# Plan: Vercel Nest Entrypoint Detection Fix

## Goal
Make `apps/api/src/main.ts` satisfy Vercel's NestJS entrypoint detector while preserving the existing shared bootstrap path.

## Acceptance Criteria
- [ ] `src/main.ts` directly imports a NestJS package that Vercel can detect
- [ ] The existing `createApiApplication()` bootstrap remains the single app creation path
- [ ] API typecheck and build pass locally
- [ ] Session state documents the Vercel-specific detector requirement

## Approach
1. Keep the application bootstrap delegated to `bootstrap/create-api-application.ts`
2. Add a direct `@nestjs/core` import in `src/main.ts` for Vercel static detection
3. Verify the API compile path
4. Update review and session logs

## Scope: IN
- `apps/api/src/main.ts`
- Deployment plan/session documentation

## Scope: OUT
- Rewriting the NestJS bootstrap architecture
- Runtime route changes
- Dashboard changes

## Dependencies
- Vercel NestJS entrypoint detection documentation
- Existing API bootstrap module

## Estimated Complexity: S
