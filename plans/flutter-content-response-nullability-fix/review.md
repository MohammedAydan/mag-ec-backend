# Flutter Content Response Nullability Fix Review

## What Was Built

- Added explicit content-page serialization in `ContentService` so content APIs return the flattened `ContentPageResponseDto` documented in OpenAPI.
- Added fallback values for translation-less content rows:
  - `title`: content page key
  - `body`: empty string
  - `locale`: `en`
  - `slug`: translated slug when available, otherwise page slug
- Converted content response timestamps to ISO strings before returning them.
- Split admin legal-reference responses into `AdminLegalReferencesResponseDto` so admin key mappings are no longer documented as public legal-reference objects.
- Changed public legal references to return the documented top-level `LegalReferencesResponseDto` shape.
- Added generated Flutter runtime model coverage for `ContentPageResponseDto` and `AdminLegalReferencesResponseDto`.

## Edge Cases Handled

- Content pages with zero translations no longer produce null values for non-nullable Flutter fields.
- Public legal-reference timestamps are serialized as strings instead of raw `Date` objects.
- Admin and public legal-reference endpoints now have separate, clean DTO names.

## Verification

- `pnpm.cmd exec prettier --write ...` - passed.
- `pnpm.cmd openapi:generate` - passed, 141 operations.
- `pnpm.cmd flutter:client:audit` - passed, 0 errors / 0 warnings.
- `pnpm.cmd flutter:client:generate` - passed, including Dart analyze and generated runtime tests.
- `pnpm.cmd openapi:verify` - passed, contract stable.
- `pnpm.cmd --filter @ecommerce/api test -- content.service.spec.ts` - passed, 5 tests.
- `pnpm.cmd --filter @ecommerce/api lint` - passed.
- `pnpm.cmd flutter:client:verify` - passed, generated output up to date.
- `pnpm.cmd typecheck` - passed.

## Known Limitations / Follow-ups

- I did not run the user's live Dart snippet against the local server in this pass. The backend serializer, OpenAPI contract, generated SDK, and generated model conversion tests now cover the failing field.
