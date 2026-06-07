# Plan: Vercel Deployment Shape Fix

## Goal
Make the repository deployable to Vercel as a single NestJS function rooted at `apps/api`, with the embedded dashboard built and served by that same API deployment.

## Acceptance Criteria
- [ ] The repo contains an app-root Vercel config for `apps/api` instead of relying on ambiguous project dashboard settings
- [ ] The API package has a standalone Vercel build path that builds the embedded dashboard before compiling the NestJS app
- [ ] The Vercel config preserves the maintenance cron route already documented for direct mode
- [ ] Local verification proves the standalone Vercel build path succeeds
- [ ] Planning and session state capture the exact Vercel root-directory requirement

## Approach
1. Treat the latest Vercel log as a deploy-shape failure, not a compile failure
2. Configure `apps/api` as the intended Vercel project root with repo-owned `vercel.json`
3. Add an API-local build script that compiles the dashboard, regenerates Prisma, and then compiles the NestJS app
4. Verify that standalone build path locally and update deployment docs/state

## Scope: IN
- `apps/api` Vercel deployment config
- API-local standalone build scripts for Vercel
- Direct-mode deployment documentation and planning state

## Scope: OUT
- Dashboard code splitting or frontend performance work
- Queue-mode worker deployment on Vercel
- Non-Vercel hosting changes

## Dependencies
- `apps/api/package.json`
- `apps/api/src/main.ts`
- `apps/api/vercel.direct.example.json`
- `docs/operations/execution-modes-and-serverless.md`

## Estimated Complexity: S
