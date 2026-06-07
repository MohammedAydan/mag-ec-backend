# AuditAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**adminAuditListAuditLogs**](AuditAdminApi.md#adminauditlistauditlogs) | **GET** /api/v1/audit/admin | List audit log entries with optional filters and cursor pagination |



## adminAuditListAuditLogs

> PaginatedAuditLogsDto adminAuditListAuditLogs(cursor, limit, category, action, entityType)

List audit log entries with optional filters and cursor pagination

### Example

```ts
import {
  Configuration,
  AuditAdminApi,
} from '@mag/generated-api-client';
import type { AdminAuditListAuditLogsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AuditAdminApi(config);

  const body = {
    // string | Pagination cursor (optional)
    cursor: cursor_example,
    // number | Page size (1-100) (optional)
    limit: 56,
    // string | Filter by audit-log category (optional)
    category: category_example,
    // string | Filter by audit-log action (optional)
    action: action_example,
    // string | Filter by entity type (optional)
    entityType: entityType_example,
  } satisfies AdminAuditListAuditLogsRequest;

  try {
    const data = await api.adminAuditListAuditLogs(body);
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
| **cursor** | `string` | Pagination cursor | [Optional] [Defaults to `undefined`] |
| **limit** | `number` | Page size (1-100) | [Optional] [Defaults to `undefined`] |
| **category** | `string` | Filter by audit-log category | [Optional] [Defaults to `undefined`] |
| **action** | `string` | Filter by audit-log action | [Optional] [Defaults to `undefined`] |
| **entityType** | `string` | Filter by entity type | [Optional] [Defaults to `undefined`] |

### Return type

[**PaginatedAuditLogsDto**](PaginatedAuditLogsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Cursor-paginated audit log entries |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

