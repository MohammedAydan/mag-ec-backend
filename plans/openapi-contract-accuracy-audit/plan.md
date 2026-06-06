# Feature: OpenAPI Contract Accuracy Audit

## Goal
Audit and repair the NestJS API implementation and Swagger decorators so the generated OpenAPI contract is accurate, SDK-safe, and production-ready without removing existing functionality.

## Acceptance Criteria
- The promotions admin key-based update route no longer conflicts with the ID-based admin route in OpenAPI.
- Integer query parameters such as `page`, `pageSize`, `limit`, and similar pagination/count fields generate `type: integer` with correct minimum bounds where applicable.
- Protected endpoints consistently document `401` and `403` responses where authentication, permissions, or ownership apply.
- Success status codes documented in OpenAPI match actual controller behavior for the audited endpoints.
- Empty-body POST endpoints that intentionally accept no body are represented in a way that existing SDK generation can call safely.
- Request and response DTO schemas accurately reflect required, optional, nullable, enum, array, date-time, UUID, boolean, and money-like fields for the audited surfaces.
- Protected endpoints use bearer security only where required; public endpoints do not inherit bearer security accidentally.
- Generated `packages/contracts/openapi/openapi.json` passes repository verification with no duplicate/conflicting templated paths, duplicate `operationId`s, missing path params, unresolved refs, or integer pagination regressions.
- Relevant OpenAPI, E2E, and SDK verification tests pass for the changed scope.
- A before/after audit report is produced with endpoint-level OpenAPI differences and explicit breaking-change flags.

## Approach
1. Capture the current OpenAPI baseline and inspect the live controllers/DTOs/tests around promotions, pagination, auth docs, and status-code-sensitive action endpoints.
2. Repair the route conflict and decorator/runtime mismatches with minimal code changes, keeping actual endpoint behavior intact unless a documented status code is wrong relative to implementation.
3. Tighten DTO/query metadata so generated schemas use stable primitive types and validation constraints.
4. Regenerate OpenAPI, run contract/SDK verification, and diff the new contract against the saved baseline.
5. Update planning artifacts and produce a concise migration and risk report.

## Scope: IN
- NestJS controllers, DTOs, and OpenAPI generation code involved in the audited endpoints
- Tests covering OpenAPI generation, endpoint docs, route shapes, and changed status codes
- Generated `packages/contracts/openapi/openapi.json`
- A saved before/after contract audit artifact under `plans/openapi-contract-accuracy-audit/`

## Scope: OUT
- Unrelated dashboard/UI work
- Broad refactors outside the affected OpenAPI/runtime surfaces
- Database schema changes unless strictly required by an audited endpoint bug

## Dependencies
- Existing OpenAPI generation and verification scripts
- TypeScript and Flutter client audit/verification scripts
- Current NestJS Swagger configuration under `apps/api/src/openapi/`

## Estimated Complexity
L
