# Tasks — OpenAPI Annotations Group E

## Controllers

### Payments
- [x] 1. customer-order-cancellation.controller.ts — @ApiOperation, error responses, @ApiParam on :orderId, return type
- [x] 2. admin-order-cancellation.controller.ts — @ApiOperation, error responses, @ApiParam on :orderId, return type
- [x] 3. admin-payments.controller.ts — @ApiOperation, error responses, descriptions on @ApiOkResponse, return types
- [x] 4. payments-webhook.controller.ts — skipped (already @ApiExcludeController)

### Fulfillment
- [x] 5. customer-fulfillment.controller.ts — @ApiOperation, error responses, @ApiParam, description, return type
- [x] 6. admin-fulfillment.controller.ts — @ApiOperation on all 3 methods, error responses, @ApiParam on :orderId/:shipmentId, descriptions, return types

### Returns
- [x] 7. customer-returns.controller.ts — @ApiOperation on all 3 methods, error responses, @ApiParam, descriptions, return types
- [x] 8. admin-returns.controller.ts — @ApiOperation on all 5 methods, error responses, @ApiParam, descriptions, return types

### Notifications
- [x] 9. customer-notifications.controller.ts — @ApiOperation on all 5 methods, error responses, @ApiParam, descriptions, return types
- [x] 10. admin-notifications.controller.ts — @ApiOperation on listNotifications, error responses, @ApiParam on :notificationId, description, return types

## DTO Files
- [x] 11. cancel-order.dto.ts — add @ApiPropertyOptional
- [x] 12. fulfillment-admin.dto.ts — add @ApiProperty/@ApiPropertyOptional on CreateShipmentItemDto and CreateShipmentDto
- [x] 13. returns.dto.ts — add @ApiProperty/@ApiPropertyOptional on all 6 DTOs
- [x] 14. notifications.dto.ts — add @ApiProperty/@ApiPropertyOptional on all 3 DTOs

## Verification
- [x] 15. Run `pnpm --filter @ecommerce/api typecheck` — Fulfillment and DTO files clean; remaining errors are pre-existing service-layer type mismatches
