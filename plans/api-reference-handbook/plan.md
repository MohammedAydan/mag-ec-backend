# Plan: API Reference Handbook

## Goal
Create a durable documentation file that explains the project's APIs and endpoints, how to use them, the request inputs and response outputs for each endpoint, and an example page-to-endpoint mapping for the application.

## Acceptance Criteria
- [ ] A new docs file exists under `docs/` covering all current API areas from the generated OpenAPI contract
- [ ] The handbook explains authentication, versioning, common headers, pagination, and response conventions
- [ ] Every endpoint is documented with method, path, purpose, auth expectation, request inputs, and main response outputs
- [ ] The doc includes an example application page map showing which pages exist and which APIs each page uses
- [ ] The content is grounded in current repo sources, especially `packages/contracts/openapi/openapi.json`

## Approach
1. Use the generated OpenAPI contract as the endpoint source of truth
2. Extract endpoint groupings, schemas, request bodies, query/path params, and response DTO references
3. Combine that contract data with existing dashboard planning docs to produce a practical page-to-endpoint map
4. Save the result as a repo doc and update planning/session state

## Scope: IN
- Project-wide REST API overview
- Endpoint inventory from the current generated OpenAPI contract
- Request/response documentation derived from current schemas
- Example admin-application page breakdown and endpoint usage map

## Scope: OUT
- Implementing or changing backend endpoints
- Building frontend pages in this task
- Replacing the generated OpenAPI contract itself

## Dependencies
- `packages/contracts/openapi/openapi.json`
- Existing planning docs under `plans/phase-13-dashboard-ui/`
- Current repo routing and DTO metadata

## Estimated Complexity: M
