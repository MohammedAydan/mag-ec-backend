# Plan: Vercel Prisma Build Fix

## Goal
Make clean Vercel builds generate the Prisma client deterministically so the API package compiles without missing `@prisma/client` exports.

## Acceptance Criteria
- [ ] A clean install that skips dependency build scripts still has an explicit repo-owned path to generate the Prisma client before TypeScript compilation
- [ ] The workspace build path used by Vercel invokes Prisma generation before `@ecommerce/api` or `@ecommerce/worker` compile steps that rely on generated Prisma types
- [ ] Local verification proves the updated build path succeeds
- [ ] Planning and session state are updated with the root cause and fix

## Approach
1. Treat the Vercel log as the baseline failure and confirm the missing Prisma exports align with an ungenerated client
2. Add an explicit `prisma:generate` step to the build flow instead of depending on dependency postinstall scripts
3. Verify the relevant build commands locally
4. Update plan review and project/session state with the deploy-specific fix

## Scope: IN
- Workspace build scripts
- Deployment-oriented Prisma generation hardening
- Planning and handoff docs for this fix

## Scope: OUT
- Schema changes
- Runtime endpoint changes unrelated to Prisma client generation
- Dashboard bundle optimization follow-ups

## Dependencies
- `package.json`
- `apps/api/package.json`
- `prisma/schema.prisma`
- Vercel clean-install behavior with pnpm 10 build-script approvals

## Estimated Complexity: S
