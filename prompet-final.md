You are a senior production engineer, full-stack architect, security reviewer, QA automation engineer, and release manager.

You are working on a NestJS + MySQL + Prisma e-commerce admin dashboard project with a Vite/React admin dashboard, OpenAPI contract generation, Playwright browser testing, and API regression tests.

The project is currently a strong Production Candidate. Your task is to perform the final Production Readiness Hardening Pass and bring the project to a true 10/10 production-ready state.

Do not rewrite the project from scratch. Do not introduce unnecessary large refactors. Do not break existing working functionality. Focus on correctness, evidence, security, reliability, automation, and production readiness.

============================================================
CURRENT VERIFIED STATE
======================

The latest verification report says:

* All 4 workspace packages build green.
* OpenAPI regenerated successfully.
* OpenAPI operation count is 145 operations, up from 139.
* The server runs on port 3003.
* 11/11 new/fixed endpoints passed.
* POST create endpoints now return 201 Created.
* Dashboard renders 14 pages.
* Auth works.
* Arabic/RTL works.
* Critical backend issues are fixed.

Important remaining concerns:

1. Previous manual PowerShell/curl commands were partially messy and sometimes cancelled.
2. Some verification relied on "sufficient test evidence" instead of one clean deterministic test script.
3. A JWT/token appeared in terminal output/log snippets. This must never happen in production reports.
4. Playwright result needs exact pass/fail counts, not only summary text.
5. The project was tested on Node v25.9.0 while the target is Node v24 LTS.
6. Vite warns about a chunk larger than 500KB.
7. SMTP is missing in dev, but this must be represented as expected behavior, not a production failure.
8. Need final evidence that OpenAPI, runtime status codes, dashboard behavior, API tests, and build output all match.

Your mission:
Make the project production-ready and produce clean, repeatable, deterministic release evidence.

============================================================
ABSOLUTE RULES
==============

1. Do not remove existing working features.
2. Do not fake tests.
3. Do not hide failures.
4. Do not log access tokens, refresh tokens, secrets, API keys, cookies, database URLs, SMTP passwords, or any sensitive values.
5. Do not claim production-ready unless every acceptance gate below passes.
6. Use the existing architecture, naming conventions, DTO style, guards, services, repositories, modules, and package scripts.
7. Inspect package.json files before running commands.
8. Use actual project scripts, not invented scripts.
9. Add minimal production-grade changes only where needed.
10. Every change must be backed by tests or documented verification.

============================================================
PHASE 1 — CLEAN RELEASE SMOKE TEST SCRIPT
=========================================

Create a deterministic release smoke test script.

Preferred file:

scripts/release-smoke-test.mjs

If the repo already has a better convention, follow it.

The script must:

1. Start from a clean authenticated session.
2. Login using environment-provided test credentials.
3. Never print the access token or refresh token.
4. Print only:

   * "Token acquired: yes"
   * token length if needed
   * never the token itself
5. Run all critical API checks in one clean pass.
6. Produce exact pass/fail counts.
7. Exit with code 0 only if all checks pass.
8. Exit with code 1 if any check fails.
9. Print request names, HTTP status codes, and safe response summaries.
10. Support a configurable base URL:

    * API_BASE_URL=http://localhost:3003/api/v1
11. Support configurable credentials:

    * ADMIN_EMAIL
    * ADMIN_PASSWORD
12. Generate unique test data using timestamp/random suffixes.
13. Avoid duplicate slug/email/SKU conflicts.
14. Clean up test data if the project already has delete/archive endpoints.
15. If cleanup is not available, use predictable "release-test-" prefixes and document that these are harmless test artifacts.
16. Save a machine-readable result file:

    * artifacts/release-smoke-result.json
17. Save a human-readable result file:

    * artifacts/release-smoke-report.md

The smoke test must cover at least:

Auth:

* POST /auth/login
* GET /auth/me
* POST /auth/refresh if available and safe
* POST /auth/logout if it does not break remaining checks, otherwise run it at the end

Health:

* GET /health/liveness
* GET /health/readiness

Pricing:

* GET /pricing/admin/settings/behavior => 200
* GET /pricing/admin/settings/currency => 200
* GET /pricing/admin/tax-classes/standard => 200
* GET /pricing/admin/tax-classes/nonexistent => 404
* GET /pricing/admin/shipping-zones/domestic => 200

Promotions:

* POST /promotions/admin => 201
* Verify response contains id/key/status or project-equivalent fields
* If list endpoint exists, verify created promotion appears in list

Content:

* POST /content/admin/pages => 201
* Verify response contains id/key/slug/title/status or project-equivalent fields
* If list endpoint exists, verify created page appears in list

Catalog/Product:

* POST /catalog/admin/products without variants => 201 and status DRAFT
* Verify response variants is empty array or project-equivalent
* POST /catalog/admin/products/:id/publish without active variant => 400 with clear domain message
* Create product with at least one valid variant if supported
* Publish product with valid variant if supported
* Verify publish succeeds only when domain requirements are met

Staff:

* POST /identity/admin/staff/invitations => 201
* In dev without SMTP, response must be success with emailDelivered:false or equivalent warning
* Account must not be destroyed or disabled due to email delivery failure
* POST /identity/admin/staff/:id/resend-invitation with no body and no Content-Type header
* Test resend specifically on a newly created INVITED staff user, not only ACTIVE staff
* Expected: success or success-with-warning if SMTP is missing
* Do not require an empty JSON body

OpenAPI/runtime consistency:

* Fetch or read generated openapi.json
* Verify the following paths exist:

  * /pricing/admin/settings/behavior
  * /pricing/admin/settings/currency
  * /pricing/admin/tax-classes/{key}
  * /pricing/admin/shipping-zones/{key}
  * /promotions/admin
  * /content/admin/pages
* Verify POST create operations document 201 Created where runtime returns 201

Output format example:

Release Smoke Test Result
Total: 40
Passed: 40
Failed: 0
Skipped: 0
Result: PASS

Do not output secrets.

============================================================
PHASE 2 — PLAYWRIGHT PRODUCTION E2E PASS
========================================

Create or improve Playwright tests for the dashboard.

The tests must provide exact pass/fail counts.

Cover:

1. Login page loads.
2. Admin login works.
3. All 14 dashboard routes render in English:

   * #/home
   * #/orders
   * #/fulfillment
   * #/catalog
   * #/taxonomy
   * #/pricing
   * #/inventory
   * #/payments
   * #/reviews
   * #/notifications
   * #/reports
   * #/staff
   * #/content
   * #/system
4. Switch language to Arabic.
5. Verify document direction is RTL.
6. Verify all 14 dashboard routes render in Arabic.
7. Verify Arabic create buttons are fully translated and do not contain raw English entity keys:

   * brands
   * categories
   * tags
   * product-types
   * products
   * collections
   * attributes
   * pages
   * promotions
8. Verify no broken "brands جديد" style labels exist.
9. Verify main dashboard tables do not crash on empty data.
10. Verify pricing page does not crash when settings load.
11. Verify content page creation flow if UI exposes it.
12. Verify promotion creation flow if UI exposes it.
13. Verify staff invitation warning state if SMTP is missing.
14. Verify product draft creation UX matches backend behavior.

Add script if missing:

pnpm test:e2e
or
pnpm test:playwright

Use existing project conventions.

The final report must show:

Playwright:

* Total tests
* Passed
* Failed
* Skipped
* Browser used
* Base URL
* Screenshots/videos only on failure if configured

============================================================
PHASE 3 — NODE TARGET VERSION VERIFICATION
==========================================

The latest report mentioned Node v25.9.0 while the target is Node v24 LTS.

Production readiness requires verification on the target runtime.

Tasks:

1. Add or update .nvmrc with the target Node version if missing.
2. Add or update package.json engines if the project uses it.
3. Verify builds/tests on Node v24 LTS.
4. If using Corepack/pnpm, document the exact pnpm version.
5. If the repo has CI, make CI use Node v24 LTS.
6. If the repo does not have CI, add a minimal GitHub Actions workflow if appropriate.

Required evidence:

* node --version
* pnpm --version
* pnpm build
* pnpm test or actual equivalent
* pnpm test:e2e or actual equivalent
* OpenAPI generation/verification

Do not silently ignore runtime version mismatch.

============================================================
PHASE 4 — SECURITY HARDENING
============================

Perform a production security review and implement safe minimal fixes.

Check and harden:

Authentication:

* Access token expiry is reasonable.
* Refresh token behavior is safe.
* Logout invalidates refresh token/session where applicable.
* No tokens are logged.
* Auth errors do not leak sensitive details.

Authorization:

* Admin endpoints require admin auth.
* Pricing/promotions/content/staff/catalog admin routes require proper permissions/roles.
* Staff invitation/resend cannot be used by unauthorized users.
* Customer/user endpoints cannot access admin data.

Input validation:

* DTOs validate required fields.
* Unknown or dangerous fields are rejected or ignored based on project convention.
* Slugs/keys/SKUs/emails are normalized consistently.
* Duplicate slug/key/email/SKU behavior is clear and tested.
* Date ranges are validated for promotions.
* Numeric values such as discounts, prices, and tax rates are bounded.

Security headers:

* Add or verify Helmet or equivalent.
* CSP must not break dashboard assets.
* X-Content-Type-Options enabled.
* Referrer-Policy configured.
* Frame options configured unless intentionally embedded.

CORS:

* Production CORS must be restricted to configured origins.
* Dev CORS can be permissive only in dev.
* Environment variables must control allowed origins.

Rate limiting:

* Add or verify rate limiting for:

  * login
  * refresh
  * staff invitation
  * resend invitation
  * write-heavy admin endpoints
* Do not block local automated tests unnecessarily.

Secrets:

* Ensure .env files are not committed.
* Add .env.example with safe placeholders.
* Validate required env vars at startup.
* Never log:

  * DATABASE_URL
  * JWT secret
  * refresh secret
  * SMTP credentials
  * API keys
  * tokens
  * cookies

Errors:

* Global exception filter should return consistent safe errors.
* No stack traces in production responses.
* Stack traces are allowed only in development logs.

Deliverables:

* SECURITY_CHECKLIST.md
* Any minimal code fixes needed
* Tests proving unauthorized access returns 401/403
* Tests proving validation errors return 400

============================================================
PHASE 5 — ENVIRONMENT VALIDATION
================================

Add fail-fast environment validation if missing.

Required behavior:

* In production, app must fail startup if critical env vars are missing.
* In development/test, safe defaults may be used only if already project convention.
* Print safe config summary without secrets.

Validate at least:

* NODE_ENV
* PORT
* DATABASE_URL
* JWT/access token secret
* JWT/refresh token secret if applicable
* CORS allowed origins
* SMTP host/user/pass/from if email sending is enabled
* OpenAPI enable/disable flag if used
* Redis/queue vars if worker/queue is enabled

Add/update:

* .env.example
* docs/ENVIRONMENT.md
* startup validation tests if feasible

============================================================
PHASE 6 — DATABASE, MIGRATIONS, SEEDING, AND BACKUP READINESS
=============================================================

Verify database production readiness.

Tasks:

1. Confirm Prisma schema is valid.
2. Confirm migrations are up to date.
3. Confirm no accidental schema drift.
4. Confirm seeds are deterministic and safe.
5. Add a test data seed/reset script if missing:

   * should create admin user
   * roles/permissions
   * basic catalog seed
   * tax class standard
   * shipping zone domestic
   * pricing settings
6. Document how to reset dev/test DB.
7. Document production migration command.
8. Document backup/restore recommendation for MySQL.

Add/update:

* docs/DATABASE.md
* scripts/seed-test-data if needed
* scripts/check-db-readiness if useful

Required evidence:

* prisma generate
* prisma migrate status or project equivalent
* seed command result if applicable

============================================================
PHASE 7 — OBSERVABILITY AND OPERATIONS
======================================

Add or verify production observability.

Required:

1. Structured logs.
2. Request ID/correlation ID per request.
3. Safe error logging.
4. Health endpoints:

   * liveness
   * readiness
5. Readiness must check:

   * database connectivity
   * memory
   * task execution/worker if applicable
6. No sensitive data in logs.
7. Document log format.

Optional but recommended:

* Metrics endpoint if existing architecture supports it.
* Slow request logging.
* Audit logging for admin writes:

  * create promotion
  * create content page
  * staff invite
  * staff role changes
  * product publish/archive
  * inventory adjustments
  * pricing changes

Add/update:

* docs/OPERATIONS.md
* docs/LOGGING.md
* tests for health endpoints

============================================================
PHASE 8 — PERFORMANCE AND BUNDLE OPTIMIZATION
=============================================

The latest report mentioned a Vite chunk warning greater than 500KB.

Investigate and improve if safe.

Tasks:

1. Run dashboard build with bundle analysis if available.
2. Identify large dependencies/chunks.
3. Add lazy loading / dynamic imports for heavy routes if appropriate.
4. Split admin dashboard pages by route if not already split.
5. Avoid changing UI behavior.
6. Keep changes minimal.
7. If optimization is not safe in this pass, document exact cause and create TODO with recommendation.

Target:

* Remove or reduce the >500KB warning if reasonable.
* If not possible without risky refactor, document as non-blocking with clear plan.

Add/update:

* docs/PERFORMANCE.md
* Bundle size note in final report

============================================================
PHASE 9 — API CONTRACT AND SDK READINESS
========================================

OpenAPI is already at 145 operations. Now verify quality.

Tasks:

1. Regenerate OpenAPI.
2. Verify operation count.
3. Verify all admin routes have:

   * auth requirements
   * tags
   * request body schemas
   * response schemas
   * correct status codes
   * examples where helpful
4. Verify no endpoint in dashboard calls a route missing from OpenAPI.
5. Verify no OpenAPI route returns a different status code at runtime.
6. If SDK/client generation exists, run verify/generate scripts.
7. Ensure generated clients do not drift.

Required evidence:

* OpenAPI generation command
* OpenAPI verify command if exists
* operation count
* changed files
* diff summary

============================================================
PHASE 10 — CI/CD RELEASE GATE
=============================

If CI exists:

* Update it to run the full production gate.

If CI does not exist:

* Add a minimal GitHub Actions workflow if appropriate.

CI should run:

1. install
2. typecheck
3. lint
4. unit tests
5. API/integration tests
6. dashboard build
7. API build
8. worker build
9. OpenAPI generate/verify
10. Playwright tests if environment supports it
11. release smoke test if server can be started in CI

Use Node v24 LTS.

Add/update:

* .github/workflows/ci.yml

Do not add CI if the repo intentionally avoids GitHub Actions. If skipped, explain why.

============================================================
PHASE 11 — DOCUMENTATION REQUIRED FOR PRODUCTION
================================================

Add or update production docs:

1. README.md production section
2. docs/DEPLOYMENT.md
3. docs/ENVIRONMENT.md
4. docs/DATABASE.md
5. docs/SECURITY_CHECKLIST.md
6. docs/OPERATIONS.md
7. docs/RELEASE_CHECKLIST.md
8. docs/API_CONTRACT.md if helpful
9. docs/TROUBLESHOOTING.md if helpful

Docs must include:

* install
* build
* run API
* run worker
* run dashboard if separate
* generate OpenAPI
* run tests
* run Playwright
* run release smoke test
* required env vars
* DB migration steps
* seed steps
* backup/restore notes
* SMTP setup
* CORS setup
* production health check URLs
* rollback guidance
* known non-blocking warnings

============================================================
PHASE 12 — FINAL ACCEPTANCE GATES
=================================

The project is 10/10 production-ready only if all gates pass:

Build:

* All packages build successfully.
* No TypeScript errors.
* No missing assets.

Tests:

* Unit tests pass.
* API/integration tests pass.
* Playwright tests pass with exact counts.
* Release smoke test passes with exact counts.
* Existing previously passing endpoints do not regress.

API:

* OpenAPI regenerated.
* OpenAPI operation count documented.
* Runtime status codes match OpenAPI.
* Create endpoints return 201 where documented.
* Missing route count is 0.
* Misleading 500 count is 0.

Security:

* No tokens/secrets in logs.
* Admin routes require auth.
* Unauthorized tests pass.
* Env validation works.
* Production CORS configured.
* Security headers verified.
* Rate limiting verified or documented.

Runtime:

* Verified on Node v24 LTS.
* Health/readiness pass.
* No critical startup warnings.
* No unhandled promise rejections.
* No fatal memory leaks in smoke test.

Dashboard:

* 14 pages render in English.
* 14 pages render in Arabic.
* RTL works.
* No mixed Arabic/English create labels.
* Main dashboard flows do not crash.

Data:

* Migrations valid.
* Seed/test data deterministic.
* No schema drift.
* Backup/restore documented.

Operations:

* Logs are safe.
* Request IDs exist or are documented if intentionally skipped.
* Release checklist exists.
* Deployment docs exist.

Performance:

* Vite chunk warning resolved or documented as non-blocking with clear plan.
* No severe performance regression.

Final result must be one of:

* PRODUCTION_READY
* NOT_READY

Do not output PRODUCTION_READY unless all critical gates pass.

============================================================
FINAL OUTPUT REQUIRED
=====================

Produce a final report named:

artifacts/production-readiness-report.md

Also print a concise terminal summary.

The final report must include:

1. Executive Summary
2. Final verdict:

   * PRODUCTION_READY
   * or NOT_READY
3. Score out of 10
4. Commands run exactly
5. Environment:

   * Node version
   * pnpm version
   * OS
   * database
   * API base URL
6. Build results by package
7. Test results:

   * unit
   * integration/API
   * Playwright
   * release smoke
8. API/OpenAPI results:

   * operation count
   * status-code consistency
   * endpoints verified
9. Security review result:

   * passed checks
   * fixed issues
   * remaining risks
10. Database readiness:

* migrations
* seeds
* backup/restore docs

11. Dashboard readiness:

* English routes
* Arabic routes
* RTL
* i18n issues

12. Performance result:

* bundle warning status
* optimizations applied or deferred

13. Files changed
14. Artifacts created
15. Remaining warnings
16. Blockers if NOT_READY
17. Production launch checklist
18. Rollback checklist

The final line must be exactly one of:

FINAL VERDICT: PRODUCTION_READY

or

FINAL VERDICT: NOT_READY

============================================================
IMPORTANT IMPLEMENTATION NOTES
==============================

* Prefer adding a clean release smoke script over more manual curl commands.
* Avoid PowerShell escaping problems by using Node.js scripts for HTTP tests where possible.
* Never print JWTs or secrets.
* Use safe summaries for responses.
* Use deterministic unique test data.
* Make every production claim backed by a command and output.
* Keep changes minimal, production-grade, and consistent with the existing project.
* If you find a critical issue, fix it before producing the final report.
* If a critical issue cannot be fixed, mark the final verdict as NOT_READY and explain exactly why.
