# mag_api_client.api.AuditAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminAuditListAuditLogs**](AuditAdminApi.md#adminauditlistauditlogs) | **GET** /api/v1/audit/admin | List audit log entries with optional filters and cursor pagination


# **adminAuditListAuditLogs**
> PaginatedAuditLogsDto adminAuditListAuditLogs(cursor, limit, category, action, entityType)

List audit log entries with optional filters and cursor pagination

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getAuditAdminApi();
final String cursor = cursor_example; // String | Pagination cursor
final int limit = 56; // int | Page size (1-100)
final String category = category_example; // String | Filter by audit-log category
final String action = action_example; // String | Filter by audit-log action
final String entityType = entityType_example; // String | Filter by entity type

try {
    final response = api.adminAuditListAuditLogs(cursor, limit, category, action, entityType);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuditAdminApi->adminAuditListAuditLogs: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cursor** | **String**| Pagination cursor | [optional] 
 **limit** | **int**| Page size (1-100) | [optional] 
 **category** | **String**| Filter by audit-log category | [optional] 
 **action** | **String**| Filter by audit-log action | [optional] 
 **entityType** | **String**| Filter by entity type | [optional] 

### Return type

[**PaginatedAuditLogsDto**](PaginatedAuditLogsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

