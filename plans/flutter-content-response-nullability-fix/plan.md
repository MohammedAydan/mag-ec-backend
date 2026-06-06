# Flutter Content Response Nullability Fix

## Goal

Fix the generated Flutter deserialization failure for content admin list responses by making backend content payloads and OpenAPI nullability agree.

## Acceptance Criteria

- `ContentPageResponseDto` cannot fail Flutter deserialization because `title` is unexpectedly null.
- Content admin/public response DTO nullability matches actual database/service behavior.
- Generated Flutter runtime tests cover the content response nullability case reported by the user.
- OpenAPI and Flutter SDK regenerate and verify cleanly.
- API lint, typecheck, and affected tests pass.

## Approach

- Inspect content schema, service serialization, and DTO definitions to determine whether `title` should be required or nullable.
- Prefer fixing backend serialization if `title` is a required domain field; otherwise update DTO nullability deliberately.
- Add coverage so generated Flutter model conversion catches content rows with nullable fields.
- Regenerate contracts and SDK, then run verification.

## Scope

### In Scope

- Content response DTOs and content service serialization.
- Generated Flutter runtime test samples for content responses.
- OpenAPI/Flutter regeneration and verification.

### Out of Scope

- Flutter app UI changes.
- Content editor UX changes.
- Database migrations unless the schema itself is wrong.

## Dependencies

- Existing OpenAPI/Flutter generation workflow.
- Local Dart/OpenAPI generator tooling.

## Estimated Complexity

M
