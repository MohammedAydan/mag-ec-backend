# OpenAPI Before/After Diff Report

Baseline files:
- `plans/openapi-contract-accuracy-audit/openapi.before.json`
- `plans/openapi-contract-accuracy-audit/openapi.after.json`

## Breaking changes
- `PUT /api/v1/promotions/admin/{promotionKey}` was removed.
- `PUT /api/v1/promotions/admin/by-key/{promotionKey}` was added.
- Impact: any admin client, script, or SDK method calling the old key-based promotions path must switch to the new explicit `by-key` route.

## Endpoint-by-endpoint changes
- `PUT /api/v1/promotions/admin/{promotionKey}` -> removed to eliminate the templated-path conflict with `GET /api/v1/promotions/admin/{promotionId}`.
- `PUT /api/v1/promotions/admin/by-key/{promotionKey}` -> added with the same success/error surface as the old key-based upsert route (`200,400,401,403`).
- `POST /api/v1/orders/me/{orderId}/cancel` -> response set changed from `200,400,401,404` to `200,400,401,403,404`.
- `POST /api/v1/carts/{id}/coupon` -> success response changed from `201` to `200`.
- `POST /api/v1/carts/merge` -> success response changed from `201` to `200`.
- `POST /api/v1/checkout/preview` -> success response changed from `201` to `200`.
- `POST /api/v1/checkout/reserve` -> success response changed from `201` to `200`.
- `POST /api/v1/pricing/checkout/preview` -> success response changed from `201` to `200`.
- `POST /api/v1/returns/admin/{returnRequestId}/review` -> success response changed from `201` to `200`.
- `POST /api/v1/returns/admin/{returnRequestId}/receive` -> success response changed from `201` to `200`.
- `POST /api/v1/returns/admin/{returnRequestId}/refund` -> success response changed from `201` to `200`.

## Query schema differences
- `GET /api/v1/catalog/admin/products`
  - `limit`: `number` -> `integer`, minimum `1`, maximum `100`, default `20`
- `GET /api/v1/catalog/products`
  - `page`: `number` -> `integer`, minimum `1`, default `1`
  - `pageSize`: `number` -> `integer`, minimum `1`, maximum `50`, default `12`
- `GET /api/v1/inventory/admin/movements`
  - `page`: `number` -> `integer`, minimum `1`
  - `limit`: `number` -> `integer`, minimum `1`
- `GET /api/v1/inventory/admin/reservations`
  - `limit`: `number` -> `integer`, minimum `1`, maximum `100`
- `GET /api/v1/payments/admin/attempts`
  - `limit`: `number` -> `integer`, minimum `1`, maximum `100`
- `GET /api/v1/payments/admin/webhook-events`
  - `limit`: `number` -> `integer`, minimum `1`, maximum `100`
- `GET /api/v1/payments/admin/refunds`
  - `limit`: `number` -> `integer`, minimum `1`, maximum `100`
- `GET /api/v1/reports/admin/exports`
  - `limit`: `number` -> `integer`, minimum `1`, maximum `100`
- `GET /api/v1/audit/admin`
  - `limit`: `number` -> `integer`, minimum `1`, maximum `100`
- `GET /api/v1/reviews/admin`
  - `limit`: `number` -> `integer`, minimum `1`, maximum `100`, default `20`
- `GET /api/v1/reviews/me`
  - `limit`: `number` -> `integer`, minimum `1`, maximum `100`, default `20`

## Contract integrity results
- Operation count stayed stable at `139`.
- The conflicting promotions templated path no longer exists.
- Integer pagination parameters now emit `schema.type: integer`.
- The audited secured cancellation endpoint now includes `401` and `403`.
- Both committed generated SDK packages were regenerated from the repaired contract, and `typescript:client:verify:fast` plus `flutter:client:verify:fast` now pass.
- `openapi:contract:verify` passes with structural checks for:
  - deterministic regeneration
  - duplicate templated path detection
  - duplicate and invalid `operationId` detection
  - required path parameter declarations
  - secured-operation `401`/`403` coverage
  - empty-body POST/PUT/PATCH SDK extension coverage
  - unresolved local `$ref` detection
