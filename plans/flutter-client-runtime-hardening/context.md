# Flutter Client Runtime Hardening Context

## Files to Inspect

- `packages/contracts/openapi/openapi.json`
- `packages/contracts/openapi/generate-flutter-client.ts`
- `packages/contracts/openapi/dart-dio-config.yaml`
- `packages/contracts/generated/flutter/`
- `packages/contracts/generated/flutter-contract-audit.json`
- `apps/api/src/modules/**/dto/*.ts`
- `apps/api/src/modules/**/controllers/*.ts`

## Files Expected to Modify

- `packages/contracts/openapi/generate-flutter-client.ts`
- `packages/contracts/openapi/openapi.json`
- `packages/contracts/generated/flutter/**`
- DTO/controller files only if the OpenAPI source metadata is incorrect.
- `plans/flutter-client-runtime-hardening/*`
- `plans/context.md`
- `plans/SESSION_LOG.md`

## New Dependencies

None planned.

## Env Vars Needed

None expected for OpenAPI or Flutter generation.

## Open Questions

- The user reported runtime usage problems in the generated Flutter client but did not provide exact stack traces. The first pass will reproduce likely failures from generated model conversion paths and broaden verification to catch them.

## Initial Evidence

- Previous generation compiled and analyzed cleanly, but compile/analyze did not prove real model serialization/deserialization behavior.
- Prior known generator limitations included inline health schemas and reserved-word/free-form object schema naming warnings.
- Audit found 7 Pricing Admin request bodies referencing `#/components/schemas/Function`, producing generated Dart methods with `JsonObject body` instead of pricing DTOs.
- Audit found inline health response schemas producing generated names such as `HealthGetReadiness200ResponseInfoValue`.
- Reporting metric fields used broad `type: Object` schemas for structured `_count` / `_sum` values, producing `JsonObject` fields where named DTOs are cleaner.

## Final Evidence

- Pricing Admin generated Dart methods now use `UpdateStoreCurrencyDto`, `UpdatePricingBehaviorDto`, `UpsertVariantPriceDto`, `UpsertTaxClassDto`, `UpsertManualTaxRateDto`, `UpsertShippingZoneDto`, and `UpsertShippingMethodDto` body parameters.
- OpenAPI contains no `Function` schema references, no empty object DTO schemas, and no inline object response schemas.
- Generated health models now include `HealthLivenessResponseDto`, `HealthReadinessResponseDto`, and `HealthIndicatorDetailDto`.
- Generated reporting models now include named aggregate DTOs such as `ReportingCountMetricDto`, `SalesSummaryAmountSumDto`, and `TopProductSumDto`.
- Generated Flutter verification runs `dart test`; `test/model_runtime_test.dart` passed 6 tests covering method signatures and representative model conversion across all feature areas.
- Final verification commands all passed: OpenAPI generate/verify, Flutter audit/generate/verify, API lint/typecheck/unit tests.
