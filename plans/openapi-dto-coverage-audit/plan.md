# OpenAPI DTO Coverage Audit

## Goal

Verify that every exposed API feature under `apps/api/src/modules` is represented in OpenAPI with correct request DTOs, response DTOs, path parameters, security metadata, and SDK-safe input/output configuration.

## Acceptance Criteria

- Every feature tag exposed by module controllers appears in the OpenAPI contract.
- Every POST/PUT/PATCH operation has either a typed request body or an explicit empty-body SDK extension.
- Every non-204 successful response has typed content or an explicit empty-response SDK extension.
- Every path template parameter is declared in the operation parameters.
- Protected operational routes declare bearer security metadata.
- Any incorrect DTO/OpenAPI configuration found during audit is fixed immediately.

## Approach

- Regenerate/verify OpenAPI stability.
- Run the Flutter SDK contract audit.
- Inspect the generated OpenAPI contract programmatically by tag, method, request body, response schema, path params, security, and SDK extensions.
- Cross-check feature tags against the current module set.
- Document any fixes or confirm clean state.

## Scope

### In Scope

- `apps/api/src/modules/**` controllers and DTOs.
- `packages/contracts/openapi/openapi.json`.
- OpenAPI generator and SDK audit output.

### Out of Scope

- Business logic changes unrelated to DTO/OpenAPI correctness.
- Database-backed integration behavior.
- Dashboard UI behavior.

## Dependencies

- Existing OpenAPI generation and Flutter SDK audit scripts.
- The previous `openapi-settings-audit` closeout.

## Estimated Complexity

M
