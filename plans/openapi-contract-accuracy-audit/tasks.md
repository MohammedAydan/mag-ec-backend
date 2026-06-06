# Tasks

- [x] Capture baseline contract and identify exact affected endpoints, DTOs, tests, and generator checks
- [x] Fix promotions admin templated route conflict and update references/tests
- [x] Audit and correct integer query parameter schemas plus runtime validation for pagination/count inputs
- [x] Audit protected endpoints and add missing `401`/`403` documentation consistently
- [x] Review audited action endpoints for `200` vs `201` behavior and align decorators/tests with actual behavior
- [x] Audit empty-body POST endpoints and preserve SDK-safe invocation metadata
- [x] Tighten DTO schema accuracy for the changed surfaces and related shared response wrappers
- [x] Verify bearer security and public/protected endpoint documentation consistency
- [x] Regenerate OpenAPI, verify contract integrity, and compare old vs new output endpoint-by-endpoint
- [x] Run changed tests plus contract and SDK verification commands
- [x] Write review and audit diff report, then update `plans/context.md` and `plans/SESSION_LOG.md`
