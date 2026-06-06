# Context — OpenAPI Annotations Group E

## Files to modify (all done ✅)

### Controllers (9)
1. `apps/api/src/modules/payments/controllers/customer-order-cancellation.controller.ts` ✅
2. `apps/api/src/modules/payments/controllers/admin-order-cancellation.controller.ts` ✅
3. `apps/api/src/modules/payments/controllers/admin-payments.controller.ts` ✅
4. `apps/api/src/modules/fulfillment/controllers/customer-fulfillment.controller.ts` ✅
5. `apps/api/src/modules/fulfillment/controllers/admin-fulfillment.controller.ts` ✅
6. `apps/api/src/modules/returns/controllers/customer-returns.controller.ts` ✅
7. `apps/api/src/modules/returns/controllers/admin-returns.controller.ts` ✅
8. `apps/api/src/modules/notifications/controllers/customer-notifications.controller.ts` ✅
9. `apps/api/src/modules/notifications/controllers/admin-notifications.controller.ts` ✅

### DTOs (4)
10. `apps/api/src/modules/payments/dto/cancel-order.dto.ts` ✅
11. `apps/api/src/modules/fulfillment/dto/fulfillment-admin.dto.ts` ✅
12. `apps/api/src/modules/returns/dto/returns.dto.ts` ✅
13. `apps/api/src/modules/notifications/dto/notifications.dto.ts` ✅

## Imports added
- `ApiOperation`, `ApiParam`, `ApiUnauthorizedResponse`, `ApiForbiddenResponse`, `ApiBadRequestResponse`, `ApiNotFoundResponse` from `@nestjs/swagger`
- `ApiProperty`, `ApiPropertyOptional` from `@nestjs/swagger` (DTOs)

## Observations
- Explicit return types exposed pre-existing type mismatches between raw Prisma service returns and DTO types (Date vs string, nullable vs non-nullable). These are pre-existing tech debt, not caused by this change.

