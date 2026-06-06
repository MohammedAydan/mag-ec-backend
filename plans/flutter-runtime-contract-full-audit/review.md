# Flutter Runtime Contract Full Audit Review

## What Was Built

- Audited the OpenAPI-to-Flutter runtime contract across the exposed feature modules after the user confirmed the issue was broad, not content-only.
- Fixed DTO/runtime mismatches in content, wishlist, commerce support, pricing admin, notification preferences, and identity/profile surfaces.
- Regenerated `packages/contracts/openapi/openapi.json`.
- Regenerated `packages/contracts/generated/flutter/**`.
- Expanded generated Dart runtime conversion tests so strict `built_value` deserialization catches representative model drift across all feature groups.

## Key Fixes

- Content pages now serialize fallback non-null `title`, `body`, `locale`, `slug`, and ISO timestamps before reaching Flutter.
- Wishlist responses now expose `WishlistItemResponseDto.addedAt` instead of leaking Prisma `createdAt`.
- Commerce support admin cart/wishlist lists now return the same DTO-shaped cart and wishlist objects that OpenAPI advertises.
- Pricing admin write responses now serialize DTO-shaped store settings, variant prices, tax classes, tax rates, shipping zones, and shipping methods.
- `ShippingZoneResponseDto` now matches runtime reality: `isActive`, `countryCodes`, and `updatedAt`.
- Notification preference lookup now returns a default `NotificationPreferenceResponseDto` when a user has no saved preference.
- Identity admin RBAC and profile responses now flatten roles/permissions and emit ISO date strings according to their documented DTOs.

## Documentation Basis

- The implementation keeps NestJS OpenAPI output aligned with concrete named DTOs and generated documents, following the official NestJS OpenAPI guidance for `SwaggerModule.createDocument()` and decorator-driven API specifications: `https://docs.nestjs.com/openapi/introduction`.

## Verification

- `pnpm.cmd openapi:generate` - passed, 141 operations.
- `pnpm.cmd flutter:client:audit` - passed, 0 errors / 0 warnings.
- `pnpm.cmd flutter:client:generate` - passed; generated SDK ran `dart analyze` and 6 generated runtime tests.
- `pnpm.cmd openapi:verify` - passed; OpenAPI contract stable.
- `pnpm.cmd flutter:client:verify` - passed; generated SDK output up to date and runtime tests passed.
- `pnpm.cmd --filter @ecommerce/api test -- wishlist.service.spec.ts user.service.spec.ts` - passed, 19 tests.
- `pnpm.cmd --filter @ecommerce/api lint` - passed.
- `pnpm.cmd typecheck` - passed.

## Edge Cases Handled

- Translation-less content pages no longer break non-null Flutter strings.
- Missing notification preferences no longer deserialize as null for a non-null DTO endpoint.
- Nullable dates are emitted as `null`; present dates are emitted as ISO strings.
- Support/admin projections no longer omit fields required by the public DTO model.
- Generated model tests now cover nested lists, nullable fields, date conversion, admin/public legal reference shapes, notification preferences, identity RBAC, and representative commerce modules.

## Known Limitations

- I did not rerun a live Dart smoke script against `localhost:3003` in this slice; the contract and generated SDK verification passed offline against the regenerated artifacts.
- The local OpenAPI Generator path still uses `npx`, which emits npm config warnings in this environment, but generation and verification succeeded.
