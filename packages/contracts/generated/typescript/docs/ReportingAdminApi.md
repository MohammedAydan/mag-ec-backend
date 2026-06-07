# ReportingAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**adminReportingCreateExport**](ReportingAdminApi.md#adminreportingcreateexport) | **POST** /api/v1/reports/admin/exports | Request a new asynchronous report export |
| [**adminReportingCreateExportDownloadUrl**](ReportingAdminApi.md#adminreportingcreateexportdownloadurl) | **GET** /api/v1/reports/admin/exports/{exportId}/download | Generate a short-lived download URL for an export result |
| [**adminReportingGetInventoryKpis**](ReportingAdminApi.md#adminreportinggetinventorykpis) | **GET** /api/v1/reports/admin/inventory-kpis | Retrieve inventory KPI metrics |
| [**adminReportingGetPromotionPerformance**](ReportingAdminApi.md#adminreportinggetpromotionperformance) | **GET** /api/v1/reports/admin/promotion-performance | Retrieve promotion usage and performance analytics |
| [**adminReportingGetSalesSummary**](ReportingAdminApi.md#adminreportinggetsalessummary) | **GET** /api/v1/reports/admin/sales-summary | Retrieve aggregate sales summary metrics |
| [**adminReportingGetTopProducts**](ReportingAdminApi.md#adminreportinggettopproducts) | **GET** /api/v1/reports/admin/top-products | List top-selling products by quantity |
| [**adminReportingListExports**](ReportingAdminApi.md#adminreportinglistexports) | **GET** /api/v1/reports/admin/exports | List report exports with cursor pagination |



## adminReportingCreateExport

> ReportExportResponseDto adminReportingCreateExport(createReportExportDto)

Request a new asynchronous report export

### Example

```ts
import {
  Configuration,
  ReportingAdminApi,
} from '@mag/generated-api-client';
import type { AdminReportingCreateExportRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportingAdminApi(config);

  const body = {
    // CreateReportExportDto
    createReportExportDto: ...,
  } satisfies AdminReportingCreateExportRequest;

  try {
    const data = await api.adminReportingCreateExport(body);
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
| **createReportExportDto** | [CreateReportExportDto](CreateReportExportDto.md) |  | |

### Return type

[**ReportExportResponseDto**](ReportExportResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Report export created and enqueued |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminReportingCreateExportDownloadUrl

> ReportExportDownloadResponseDto adminReportingCreateExportDownloadUrl(exportId)

Generate a short-lived download URL for an export result

### Example

```ts
import {
  Configuration,
  ReportingAdminApi,
} from '@mag/generated-api-client';
import type { AdminReportingCreateExportDownloadUrlRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportingAdminApi(config);

  const body = {
    // string | Unique identifier of the report export
    exportId: exportId_example,
  } satisfies AdminReportingCreateExportDownloadUrlRequest;

  try {
    const data = await api.adminReportingCreateExportDownloadUrl(body);
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
| **exportId** | `string` | Unique identifier of the report export | [Defaults to `undefined`] |

### Return type

[**ReportExportDownloadResponseDto**](ReportExportDownloadResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Pre-signed download URL for the export |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Requested export not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminReportingGetInventoryKpis

> InventoryKpisResponseDto adminReportingGetInventoryKpis()

Retrieve inventory KPI metrics

### Example

```ts
import {
  Configuration,
  ReportingAdminApi,
} from '@mag/generated-api-client';
import type { AdminReportingGetInventoryKpisRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportingAdminApi(config);

  try {
    const data = await api.adminReportingGetInventoryKpis();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**InventoryKpisResponseDto**](InventoryKpisResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Inventory KPI aggregate data |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminReportingGetPromotionPerformance

> Array&lt;PromotionPerformanceDto&gt; adminReportingGetPromotionPerformance()

Retrieve promotion usage and performance analytics

### Example

```ts
import {
  Configuration,
  ReportingAdminApi,
} from '@mag/generated-api-client';
import type { AdminReportingGetPromotionPerformanceRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportingAdminApi(config);

  try {
    const data = await api.adminReportingGetPromotionPerformance();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;PromotionPerformanceDto&gt;**](PromotionPerformanceDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Promotion performance analytics data |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminReportingGetSalesSummary

> SalesSummaryResponseDto adminReportingGetSalesSummary()

Retrieve aggregate sales summary metrics

### Example

```ts
import {
  Configuration,
  ReportingAdminApi,
} from '@mag/generated-api-client';
import type { AdminReportingGetSalesSummaryRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportingAdminApi(config);

  try {
    const data = await api.adminReportingGetSalesSummary();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**SalesSummaryResponseDto**](SalesSummaryResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Sales summary aggregate data |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminReportingGetTopProducts

> Array&lt;TopProductDto&gt; adminReportingGetTopProducts()

List top-selling products by quantity

### Example

```ts
import {
  Configuration,
  ReportingAdminApi,
} from '@mag/generated-api-client';
import type { AdminReportingGetTopProductsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportingAdminApi(config);

  try {
    const data = await api.adminReportingGetTopProducts();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;TopProductDto&gt;**](TopProductDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Top products performance data |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminReportingListExports

> PaginatedReportExportsDto adminReportingListExports(cursor, limit)

List report exports with cursor pagination

### Example

```ts
import {
  Configuration,
  ReportingAdminApi,
} from '@mag/generated-api-client';
import type { AdminReportingListExportsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportingAdminApi(config);

  const body = {
    // string | Cursor for the next page of results (optional)
    cursor: cursor_example,
    // number | Results per page (1-100) (optional)
    limit: 56,
  } satisfies AdminReportingListExportsRequest;

  try {
    const data = await api.adminReportingListExports(body);
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
| **cursor** | `string` | Cursor for the next page of results | [Optional] [Defaults to `undefined`] |
| **limit** | `number` | Results per page (1-100) | [Optional] [Defaults to `undefined`] |

### Return type

[**PaginatedReportExportsDto**](PaginatedReportExportsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Cursor-paginated list of report exports |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

