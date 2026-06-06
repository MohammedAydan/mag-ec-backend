# Context: Endpoint & OpenAPI Consistency Audit

## Files to examine
- `apps/api/src/modules/*/controllers/*.controller.ts` (32 files)
- `apps/api/src/health/health.controller.ts`
- `apps/api/src/modules/*/dto/*.dto.ts`
- `packages/contracts/openapi/openapi.json`
- `apps/api/src/openapi/openapi.config.ts`

## OpenAPI Config Baseline
- Prefix: `/api/v1`
- Auth: Bearer JWT (`bearer` scheme)
- Deep scan: enabled
- Version: 1.0.0
- operationId: `{ControllerKey}_{methodKey}`

## Check Criteria per Endpoint
1. @ApiTags matches intent (admin vs public)
2. @ApiOperation({ summary }) present
3. @ApiResponse for success (200/201) and common errors (400/401/403/404)
4. @ApiBody / @ApiParam / @ApiQuery present when needed
5. @ApiBearerAuth present on protected endpoints
6. Return type is a serializable DTO class, not a domain entity
7. Decorators match NestJS route decorators (@Get, @Post, @Patch, @Delete, @Put)
8. No duplicate paths
