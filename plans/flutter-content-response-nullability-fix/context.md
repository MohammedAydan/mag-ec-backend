# Flutter Content Response Nullability Fix Context

## User Evidence

The user's Flutter call:

- `client.getContentAdminApi().adminContentListPages()`

failed with:

```text
DioException [unknown]: null
Error: Deserializing to 'BuiltList<ContentPageResponseDto>' failed due to: Deserializing to 'ContentPageResponseDto' failed due to: Tried to construct class "ContentPageResponseDto" with null for non-nullable field "title".
```

## Files to Inspect

- `apps/api/src/modules/content/**`
- `prisma/schema.prisma`
- `packages/contracts/openapi/openapi.json`
- `packages/contracts/openapi/generate-flutter-client.ts`
- `packages/contracts/generated/flutter/lib/src/model/content_page_response_dto.dart`

## Files Expected to Modify

- Content DTO/service files if the API payload is wrong.
- `packages/contracts/openapi/generate-flutter-client.ts` for generated runtime test coverage.
- `packages/contracts/openapi/openapi.json`
- `packages/contracts/generated/flutter/**`
- `plans/flutter-content-response-nullability-fix/*`
- `plans/context.md`
- `plans/SESSION_LOG.md`

## New Dependencies

None.

## Findings

- The runtime payload for content pages did not match `ContentPageResponseDto`; the service returned raw Prisma content-page records with translations nested under `translations`.
- `ContentPageResponseDto.title`, `body`, and `locale` are generated as non-null in Dart, so legacy or translation-less content rows must be serialized with stable fallback values.
- Admin legal-reference endpoints returned key mappings but were documented as public legal-reference objects. A separate `AdminLegalReferencesResponseDto` now documents the admin response shape.
- Public legal references now return the documented top-level `{ terms, privacy, returns, shipping }` shape.
