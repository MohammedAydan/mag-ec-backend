# Plan: Vercel Serverless Runtime Crash Fix

## Goal
Make the API boot reliably on Vercel direct-mode deployments without requiring inactive optional integrations to be configured.

## Acceptance Criteria
- [ ] Production config no longer requires S3 credentials unless S3-backed reports/storage are explicitly enabled
- [ ] Production config no longer requires Resend credentials unless `EMAIL_PROVIDER=resend`
- [ ] Required production secrets for core API boot remain fail-closed
- [ ] Local tests cover Vercel-style production config with optional integrations disabled
- [ ] API typecheck and build pass
- [ ] Vercel runtime requirements are documented in the feature review and session log

## Approach
1. Add focused config tests that reproduce a Vercel production cold-start environment with direct mode, database URL, JWT secrets, and maintenance secret, but no S3/Resend credentials.
2. Relax only inactive optional integration validation rules: S3 credentials should be required when S3/report storage is enabled, and Resend credentials should be required when `EMAIL_PROVIDER=resend`.
3. Verify config still fails closed for missing core production values such as `DATABASE_URL`, JWT secrets, and maintenance secret.
4. Run the API config tests, typecheck, and build.
5. Update review/session planning artifacts with root cause, fix, Vercel env requirements, and remaining deployment checks.

## Scope: IN
- API production config validation
- Focused config tests
- Vercel runtime-crash planning and review docs

## Scope: OUT
- Database migration changes
- Dashboard UI changes
- Payment provider changes
- External Vercel project setting changes

## Dependencies
- Existing direct-mode Vercel deployment path under `apps/api`
- Vercel project must still provide `DATABASE_URL`, `JWT_ACCESS_SECRET`, `JWT_REFRESH_SECRET`, and `MAINTENANCE_SECRET`

## Estimated Complexity: S
