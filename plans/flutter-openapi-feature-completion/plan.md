# Flutter OpenAPI Feature Completion Plan

## Goal

Verify every exposed API feature is represented in the OpenAPI contract, regenerate the contract, and regenerate/verify the Flutter client from that contract.

## Acceptance Criteria

- OpenAPI feature coverage still matches the exposed NestJS API surface.
- OpenAPI generation is stable against checked-in `packages/contracts/openapi/openapi.json`.
- Flutter client generation completes from the pinned OpenAPI Generator configuration.
- Flutter client verification reports no generated output drift.
- API lint, typecheck, and tests pass after generation.

## Approach

- Reuse the existing OpenAPI DTO coverage audit results as the baseline.
- Run the contract verification scripts that regenerate OpenAPI from NestJS metadata.
- Generate the Flutter/Dio client through `packages/contracts/openapi/generate-flutter-client.ts`.
- Run focused backend quality checks after generated artifacts are updated.
- Record exact commands, outcomes, limitations, and generated paths in this plan slice.

## Scope

In scope:

- OpenAPI contract generation and verification.
- Flutter/Dio client generation and verification.
- Contract audit output under `packages/contracts/generated/`.
- Plan/review closeout artifacts.

Out of scope:

- New business functionality beyond already exposed API modules.
- Dashboard UI changes.
- External staging deployment.
- Redis/MySQL integration runner repairs unless generation depends on them.

## Dependencies

- Existing NestJS Swagger/OpenAPI decorators and metadata.
- `@openapitools/openapi-generator-cli` pinned through the generator script.
- Local Dart tooling for generated client quality checks.
- Existing package scripts in root `package.json`.

## Estimated Complexity

M
