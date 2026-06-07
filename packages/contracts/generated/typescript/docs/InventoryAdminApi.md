# InventoryAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**inventoryAdminAdjustStock**](InventoryAdminApi.md#inventoryadminadjuststock) | **POST** /api/v1/inventory/admin/adjustments | Adjust stock quantity for a variant in a warehouse |
| [**inventoryAdminGetReservations**](InventoryAdminApi.md#inventoryadmingetreservations) | **GET** /api/v1/inventory/admin/reservations | Query stock reservations with optional filters and status |
| [**inventoryAdminGetStockLevels**](InventoryAdminApi.md#inventoryadmingetstocklevels) | **GET** /api/v1/inventory/admin/levels | Query current stock levels with optional filters |
| [**inventoryAdminGetStockMovements**](InventoryAdminApi.md#inventoryadmingetstockmovements) | **GET** /api/v1/inventory/admin/movements | Query paginated stock movement history |



## inventoryAdminAdjustStock

> StockAdjustmentResponseDto inventoryAdminAdjustStock(adjustStockDto)

Adjust stock quantity for a variant in a warehouse

### Example

```ts
import {
  Configuration,
  InventoryAdminApi,
} from '@mag/generated-api-client';
import type { InventoryAdminAdjustStockRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new InventoryAdminApi(config);

  const body = {
    // AdjustStockDto
    adjustStockDto: ...,
  } satisfies InventoryAdminAdjustStockRequest;

  try {
    const data = await api.inventoryAdminAdjustStock(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **adjustStockDto** | [AdjustStockDto](AdjustStockDto.md) |  | |

### Return type

[**StockAdjustmentResponseDto**](StockAdjustmentResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Stock adjustment applied |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## inventoryAdminGetReservations

> Array&lt;StockReservationResponseDto&gt; inventoryAdminGetReservations(warehouseId, variantId, status, limit)

Query stock reservations with optional filters and status

### Example

```ts
import {
  Configuration,
  InventoryAdminApi,
} from '@mag/generated-api-client';
import type { InventoryAdminGetReservationsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new InventoryAdminApi(config);

  const body = {
    // string | Filter by warehouse identifier (optional)
    warehouseId: warehouseId_example,
    // string | Filter by variant identifier (optional)
    variantId: variantId_example,
    // 'RESERVED' | 'REDEEMED' | 'RELEASED' | 'EXPIRED' | Filter by reservation status (optional)
    status: status_example,
    // number | Maximum results to return (1-100) (optional)
    limit: 56,
  } satisfies InventoryAdminGetReservationsRequest;

  try {
    const data = await api.inventoryAdminGetReservations(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **warehouseId** | `string` | Filter by warehouse identifier | [Optional] [Defaults to `undefined`] |
| **variantId** | `string` | Filter by variant identifier | [Optional] [Defaults to `undefined`] |
| **status** | `RESERVED`, `REDEEMED`, `RELEASED`, `EXPIRED` | Filter by reservation status | [Optional] [Defaults to `undefined`] [Enum: RESERVED, REDEEMED, RELEASED, EXPIRED] |
| **limit** | `number` | Maximum results to return (1-100) | [Optional] [Defaults to `undefined`] |

### Return type

[**Array&lt;StockReservationResponseDto&gt;**](StockReservationResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Stock reservations |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## inventoryAdminGetStockLevels

> Array&lt;StockLevelResponseDto&gt; inventoryAdminGetStockLevels(warehouseId, variantId, sku)

Query current stock levels with optional filters

### Example

```ts
import {
  Configuration,
  InventoryAdminApi,
} from '@mag/generated-api-client';
import type { InventoryAdminGetStockLevelsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new InventoryAdminApi(config);

  const body = {
    // string | Filter by warehouse identifier (optional)
    warehouseId: warehouseId_example,
    // string | Filter by variant identifier (optional)
    variantId: variantId_example,
    // string | Filter by variant SKU (optional)
    sku: sku_example,
  } satisfies InventoryAdminGetStockLevelsRequest;

  try {
    const data = await api.inventoryAdminGetStockLevels(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **warehouseId** | `string` | Filter by warehouse identifier | [Optional] [Defaults to `undefined`] |
| **variantId** | `string` | Filter by variant identifier | [Optional] [Defaults to `undefined`] |
| **sku** | `string` | Filter by variant SKU | [Optional] [Defaults to `undefined`] |

### Return type

[**Array&lt;StockLevelResponseDto&gt;**](StockLevelResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Current stock levels |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## inventoryAdminGetStockMovements

> PaginatedStockMovementsDto inventoryAdminGetStockMovements(warehouseId, variantId, type, page, limit)

Query paginated stock movement history

### Example

```ts
import {
  Configuration,
  InventoryAdminApi,
} from '@mag/generated-api-client';
import type { InventoryAdminGetStockMovementsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new InventoryAdminApi(config);

  const body = {
    // string | Filter by warehouse identifier (optional)
    warehouseId: warehouseId_example,
    // string | Filter by variant identifier (optional)
    variantId: variantId_example,
    // 'RECEIPT' | 'ADJUSTMENT' | 'SALE' | 'RETURN_RESTOCK' | 'WASTE' | Filter by movement type (optional)
    type: type_example,
    // number | Page number (1-based) (optional)
    page: 56,
    // number | Results per page (minimum 1) (optional)
    limit: 56,
  } satisfies InventoryAdminGetStockMovementsRequest;

  try {
    const data = await api.inventoryAdminGetStockMovements(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **warehouseId** | `string` | Filter by warehouse identifier | [Optional] [Defaults to `undefined`] |
| **variantId** | `string` | Filter by variant identifier | [Optional] [Defaults to `undefined`] |
| **type** | `RECEIPT`, `ADJUSTMENT`, `SALE`, `RETURN_RESTOCK`, `WASTE` | Filter by movement type | [Optional] [Defaults to `undefined`] [Enum: RECEIPT, ADJUSTMENT, SALE, RETURN_RESTOCK, WASTE] |
| **page** | `number` | Page number (1-based) | [Optional] [Defaults to `undefined`] |
| **limit** | `number` | Results per page (minimum 1) | [Optional] [Defaults to `undefined`] |

### Return type

[**PaginatedStockMovementsDto**](PaginatedStockMovementsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Paginated stock movements |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

