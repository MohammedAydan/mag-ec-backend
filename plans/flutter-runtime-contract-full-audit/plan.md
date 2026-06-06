# Flutter Runtime Contract Full Audit Plan

## Goal

Make the backend runtime responses, generated OpenAPI document, and generated Flutter/Dio SDK agree across all exposed feature modules.

## Acceptance Criteria

- Every documented success response uses a named DTO schema or an intentional free-form JSON schema.
- Service/controller return shapes match their documented OpenAPI response DTOs for all feature modules.
- Generated Flutter model conversion tests cover representative request/response payloads across all modules, including nullable fields, nested DTOs, pagination wrappers, and admin/public shape differences.
- OpenAPI generation and verification are stable.
- Flutter SDK generation and verification pass.
- API lint, typecheck, and focused tests pass for changed modules.

## Approach

1. Audit the current OpenAPI schemas, controller decorators, DTOs, and service serializers by module.
2. Use the generated SDK runtime tests and static contract audit to identify broad classes of mismatches.
3. Patch backend serializers/DTO metadata where runtime JSON and documented schemas diverge.
4. Regenerate OpenAPI and the Flutter SDK.
5. Run contract, Flutter, and backend verification.

## Scope

In scope:

- `apps/api/src/modules/**` controller/DTO/service response contracts.
- `apps/api/src/health/**` OpenAPI-facing response contracts.
- `packages/contracts/openapi/generate-flutter-client.ts` generated SDK audit/runtime tests.
- `packages/contracts/openapi/openapi.json`.
- `packages/contracts/generated/flutter/**`.

Out of scope:

- Product feature redesign.
- Database schema migrations unless a runtime contract issue requires one.
- Frontend UI changes.
- Third-party provider live integration tests.

## Dependencies

- Existing NestJS OpenAPI generation path.
- Existing Dart/OpenAPI Generator based SDK generation path.
- Local toolchain for pnpm, Node, Dart, and OpenAPI Generator CLI.

## Estimated Complexity

XL
