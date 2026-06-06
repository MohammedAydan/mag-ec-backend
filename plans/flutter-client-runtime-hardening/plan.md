# Flutter Client Runtime Hardening

## Goal

Make the generated Flutter/Dart API client reliable for real feature usage by fixing model naming, serialization, deserialization, and conversion issues at the generator/source-contract level.

## Acceptance Criteria

- Generated Flutter code passes `dart analyze --fatal-infos`, `dart format`, and build generation.
- All generated model classes can be instantiated or decoded without invalid imports, invalid names, or broken converters.
- Representative request and response DTOs across every feature module have automated serialization/deserialization coverage.
- OpenAPI schemas use clean, stable names where the backend contract controls naming.
- Generator post-processing remains deterministic; no manual edits are required inside `packages/contracts/generated/flutter`.
- OpenAPI generation and verification remain stable.

## Approach

- Audit the generated Flutter package and OpenAPI contract for model naming, inline schemas, free-form object handling, `DateTime` handling, enum handling, nullable handling, arrays, maps, and PATCH optional semantics.
- Add or extend a generated-client verification path that catches runtime model conversion failures, not only analyzer failures.
- Fix root causes in OpenAPI DTO metadata and/or `packages/contracts/openapi/generate-flutter-client.ts`.
- Regenerate OpenAPI and Flutter SDK, then run contract, Dart, backend lint/typecheck/test verification.

## Scope

### In Scope

- OpenAPI DTO/schema metadata needed for clean generated Dart models.
- Flutter generation config and deterministic post-processing.
- Generated Flutter client runtime conversion tests or audit scripts.
- Naming cleanup for generated models where currently caused by contract/generator behavior.
- Regeneration of OpenAPI and Flutter SDK artifacts.

### Out of Scope

- Customer Flutter app UI integration.
- Backend business logic changes unrelated to contract correctness.
- Manual edits inside generated Dart files that are not reproduced by generation.
- New external dependencies unless required for deterministic verification.

## Dependencies

- Existing NestJS OpenAPI generation scripts.
- `@openapitools/openapi-generator-cli` access through the current `pnpm.cmd flutter:*` commands.
- Local Dart tooling for generated package verification.

## Estimated Complexity

L
