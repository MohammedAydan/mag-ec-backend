# Plan: Vercel Runtime Diagnostics

## Goal
Add a deployment-side diagnostic endpoint that can run on Vercel without booting the NestJS API, so serverless cold-start crashes can be separated from environment/configuration problems.

## Acceptance Criteria
- [ ] A Vercel Function exists outside the NestJS bootstrap path
- [ ] The diagnostic response reports non-secret environment readiness for core production variables
- [ ] The diagnostic response never exposes secret values
- [ ] The endpoint is documented as temporary/diagnostic and not part of `/api/v1`
- [ ] Typecheck/build remain green
- [ ] Session state records the next Vercel checks

## Approach
1. Add `apps/api/api/diagnostics.ts` as a standalone Vercel Function using Web `Request`/`Response` APIs.
2. Return boolean/length/presence checks for deploy-critical env vars instead of values.
3. Include Vercel runtime metadata such as Node version and region when available.
4. Verify local compile/build paths still pass.
5. Update plans and session log with usage instructions.

## Scope: IN
- Standalone Vercel diagnostic function under `apps/api/api`
- Planning/review docs

## Scope: OUT
- Changing NestJS API route behavior
- Weakening required production secrets
- Database migrations or schema changes
- Dashboard UI changes

## Dependencies
- Vercel Node.js Functions support TypeScript files in an `api/` directory under the project root.

## Estimated Complexity: S
