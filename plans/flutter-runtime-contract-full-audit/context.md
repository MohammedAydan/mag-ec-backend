# Flutter Runtime Contract Full Audit Context

## User Evidence

The user confirmed the problem is not isolated to content:

> The problem wasn't just with the content section; the problem was with most, if not all, of the features.

Earlier concrete failure:

```text
DioException [unknown]: null
Error: Deserializing to 'BuiltList<ContentPageResponseDto>' failed due to: Deserializing to 'ContentPageResponseDto' failed due to: Tried to construct class "ContentPageResponseDto" with null for non-nullable field "title".
```

## Initial Hypothesis

Several modules likely document flattened DTOs for OpenAPI while services/controllers return raw Prisma records, partially-selected records, or plain objects with different nesting/nullability.

## Files to Inspect

- `apps/api/src/modules/**/controllers/*.ts`
- `apps/api/src/modules/**/dto/*.ts`
- `apps/api/src/modules/**/services/*.ts`
- `apps/api/src/health/**`
- `packages/contracts/openapi/openapi.json`
- `packages/contracts/openapi/generate-flutter-client.ts`
- `packages/contracts/generated/flutter/test/model_runtime_test.dart`
- Existing smoke/test scripts under `scripts/`

## Files Expected to Modify

- Affected backend DTO/controller/service files.
- `packages/contracts/openapi/generate-flutter-client.ts`.
- `packages/contracts/openapi/openapi.json`.
- `packages/contracts/generated/flutter/**`.
- Plan closeout files.

## Contract Mismatches Found

- Content pages could return null `title`/`body` values while `ContentPageResponseDto` required non-null strings.
- Wishlist service returned raw Prisma wishlist items with `createdAt`; the Flutter model requires `addedAt`.
- Commerce support admin cart/wishlist endpoints documented cart/wishlist DTOs but returned partial support projections missing required item/user fields.
- Pricing shipping-zone responses documented `isDefault` and `currencyCode`, which are not runtime fields on the shipping zone model; the actual runtime contract is `isActive` plus `countryCodes`.
- Notification preference lookup could return `null` while the documented success response is `NotificationPreferenceResponseDto`.
- Identity RBAC/profile handlers exposed raw relation names such as `rolePermissions` and `userRoles`, while the documented DTOs require flattened `permissions`, `roles`, `staffCount`, and ISO date strings.

## Files Modified

- `apps/api/src/modules/content/**` - prior slice fixed content page/legal-reference runtime shapes.
- `apps/api/src/modules/wishlist/services/wishlist.service.ts` - serializes `WishlistResponseDto` with `addedAt`.
- `apps/api/src/modules/wishlist/services/wishlist.service.spec.ts` - covers wishlist timestamp serialization.
- `apps/api/src/modules/carts/controllers/commerce-support-admin.controller.ts` - maps support cart/wishlist projections to documented DTOs.
- `apps/api/src/modules/pricing/dto/pricing-response.dto.ts` - aligned `ShippingZoneResponseDto` to runtime fields.
- `apps/api/src/modules/pricing/services/pricing-admin.service.ts` - serializes pricing admin responses with DTO-shaped objects and ISO dates.
- `apps/api/src/modules/notifications/services/notifications.service.ts` - creates a default preference when none exists.
- `apps/api/src/modules/identity/services/admin-access.service.ts` - serializes permissions, roles, and staff detail DTOs.
- `apps/api/src/modules/identity/services/user.service.ts` - serializes profile roles and dates to `UserProfileDto`.
- `apps/api/src/modules/identity/services/user.service.spec.ts` - covers user profile DTO serialization.
- `packages/contracts/openapi/generate-flutter-client.ts` - expands generated Dart model runtime tests for patched DTO groups.
- `packages/contracts/openapi/openapi.json` and `packages/contracts/generated/flutter/**` - regenerated artifacts.

## Verification

- `pnpm.cmd exec prettier --write ...` - passed for changed source/plan files.
- `pnpm.cmd openapi:generate` - passed, 141 operations.
- `pnpm.cmd flutter:client:audit` - passed, 0 errors / 0 warnings.
- `pnpm.cmd flutter:client:generate` - passed, including Dart analyze and 6 generated runtime tests.
- `pnpm.cmd openapi:verify` - passed, contract stable against regeneration.
- `pnpm.cmd flutter:client:verify` - passed, generated output up to date and generated runtime tests passed.
- `pnpm.cmd --filter @ecommerce/api test -- wishlist.service.spec.ts user.service.spec.ts` - passed, 19 tests.
- `pnpm.cmd --filter @ecommerce/api lint` - passed.
- `pnpm.cmd typecheck` - passed.

## New Dependencies

None.

## Open Questions

- Live endpoint smoke checks against `localhost:3003` were not rerun in this slice; the backend contract, generated SDK, generated Dart model conversion, lint, typecheck, and focused tests are green.
