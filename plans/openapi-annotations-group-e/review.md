# Review — OpenAPI Annotations Group E

## What was built
Added complete OpenAPI annotations across 9 controllers (skipping the already-correct webhook controller) and 4 DTO files in payments, fulfillment, returns, and notifications modules.

## Per-controller fixes
| Controller | @ApiOperation | Error responses | @ApiParam | Return types | Descriptions |
|---|---|---|---|---|---|
| customer-order-cancellation | ✅ Added | ✅ Unauthorized, BadRequest, NotFound | ✅ :orderId | ✅ Promise<SerializedOrderDto> | ✅ Had existing |
| admin-order-cancellation | ✅ Added | ✅ Unauthorized, Forbidden, BadRequest, NotFound | ✅ :orderId | ✅ Promise<SerializedOrderDto> | ✅ Had existing |
| admin-payments (3 endpoints) | ✅ Added on all 3 | ✅ Unauthorized, Forbidden on all 3 | N/A | ✅ Added on all 3 | ✅ Added on all 3 |
| customer-fulfillment | ✅ Added | ✅ Unauthorized, NotFound | ✅ :orderId | ✅ Promise<FulfillmentResponseDto[]> | ✅ Added |
| admin-fulfillment (3 endpoints) | ✅ Added on all 3 | ✅ Applied where relevant | ✅ :orderId, :shipmentId | ✅ Added on all 3 | ✅ Added on all 3 |
| customer-returns (3 endpoints) | ✅ Added on all 3 | ✅ Applied where relevant | ✅ :returnRequestId, :orderId | ✅ Added on all 3 | ✅ Added on all 3 |
| admin-returns (5 endpoints) | ✅ Added on all 5 | ✅ Applied where relevant | ✅ :returnRequestId on 4 endpoints | ✅ Added on all 5 | ✅ Added on all 5 |
| customer-notifications (5 endpoints) | ✅ Added on all 5 | ✅ Applied where relevant | ✅ :deviceId | ✅ Added on all 5 | ✅ Added on all 5 |
| admin-notifications (2 endpoints) | ✅ Added on listNotifications (already had on retry) | ✅ Unauthorized, Forbidden, NotFound | ✅ :notificationId | ✅ Added on both | ✅ Added on listNotifications; added on retry |

## Per-DTO fixes
| DTO file | Classes | @ApiProperty/@ApiPropertyOptional |
|---|---|---|
| cancel-order.dto.ts | CancelOrderDto | ✅ @ApiPropertyOptional on reason |
| fulfillment-admin.dto.ts | CreateShipmentItemDto, CreateShipmentDto | ✅ All fields annotated (UpdateShipmentStatusDto was already done) |
| returns.dto.ts | All 6 DTOs | ✅ All fields annotated with descriptions |
| notifications.dto.ts | All 3 DTOs | ✅ All fields annotated with descriptions and enums |

## Edge cases handled
- admin-notifications controller already had `@ApiOperation` on retryNotification — only added missing one on listNotifications
- No duplicate `@ApiParam` — controllers that already had `@Param()` but lacked `@ApiParam` got proper Swagger docs
- Controller-level permissions (e.g., `@RequirePermissions(['notifications.read'])`) respected: admin endpoints get `@ApiForbiddenResponse` but customer endpoints with AuthGuard only get `@ApiUnauthorizedResponse`
- DTOs with const-string enums (e.g., `notificationChannels`) have `enum` referenced in `@ApiProperty` descriptions

## Known limitations
1. **Pre-existing service-layer type mismatches**: Adding explicit return types to controller methods exposed type incompatibilities between raw Prisma service returns and DTO types (e.g., `Date` vs `string`, `string | null` vs `string`). These are pre-existing tech debt, not caused by this change.
2. **Pre-existing catalog/inventory/promotions/reporting/reviews type errors**: These are unrelated to the modules changed here and existed before this work.

## Verification
- `pnpm --filter @ecommerce/api typecheck`: Fulfillment controllers and all DTO files pass with zero errors. Other modules show only pre-existing errors unrelated to this change.
- The `ApiNotFoundResponse` import was initially missed in admin-notifications — fixed before closeout.
