# mag_api_client.api.ReportingAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminReportingCreateExport**](ReportingAdminApi.md#adminreportingcreateexport) | **POST** /api/v1/reports/admin/exports | Request a new asynchronous report export
[**adminReportingCreateExportDownloadUrl**](ReportingAdminApi.md#adminreportingcreateexportdownloadurl) | **GET** /api/v1/reports/admin/exports/{exportId}/download | Generate a short-lived download URL for an export result
[**adminReportingGetInventoryKpis**](ReportingAdminApi.md#adminreportinggetinventorykpis) | **GET** /api/v1/reports/admin/inventory-kpis | Retrieve inventory KPI metrics
[**adminReportingGetPromotionPerformance**](ReportingAdminApi.md#adminreportinggetpromotionperformance) | **GET** /api/v1/reports/admin/promotion-performance | Retrieve promotion usage and performance analytics
[**adminReportingGetSalesSummary**](ReportingAdminApi.md#adminreportinggetsalessummary) | **GET** /api/v1/reports/admin/sales-summary | Retrieve aggregate sales summary metrics
[**adminReportingGetTopProducts**](ReportingAdminApi.md#adminreportinggettopproducts) | **GET** /api/v1/reports/admin/top-products | List top-selling products by quantity
[**adminReportingListExports**](ReportingAdminApi.md#adminreportinglistexports) | **GET** /api/v1/reports/admin/exports | List report exports with cursor pagination


# **adminReportingCreateExport**
> ReportExportResponseDto adminReportingCreateExport(createReportExportDto)

Request a new asynchronous report export

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReportingAdminApi();
final CreateReportExportDto createReportExportDto = ; // CreateReportExportDto | 

try {
    final response = api.adminReportingCreateExport(createReportExportDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReportingAdminApi->adminReportingCreateExport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createReportExportDto** | [**CreateReportExportDto**](CreateReportExportDto.md)|  | 

### Return type

[**ReportExportResponseDto**](ReportExportResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminReportingCreateExportDownloadUrl**
> ReportExportDownloadResponseDto adminReportingCreateExportDownloadUrl(exportId)

Generate a short-lived download URL for an export result

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReportingAdminApi();
final String exportId = exportId_example; // String | Unique identifier of the report export

try {
    final response = api.adminReportingCreateExportDownloadUrl(exportId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReportingAdminApi->adminReportingCreateExportDownloadUrl: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exportId** | **String**| Unique identifier of the report export | 

### Return type

[**ReportExportDownloadResponseDto**](ReportExportDownloadResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminReportingGetInventoryKpis**
> InventoryKpisResponseDto adminReportingGetInventoryKpis()

Retrieve inventory KPI metrics

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReportingAdminApi();

try {
    final response = api.adminReportingGetInventoryKpis();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReportingAdminApi->adminReportingGetInventoryKpis: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InventoryKpisResponseDto**](InventoryKpisResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminReportingGetPromotionPerformance**
> BuiltList<PromotionPerformanceDto> adminReportingGetPromotionPerformance()

Retrieve promotion usage and performance analytics

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReportingAdminApi();

try {
    final response = api.adminReportingGetPromotionPerformance();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReportingAdminApi->adminReportingGetPromotionPerformance: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;PromotionPerformanceDto&gt;**](PromotionPerformanceDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminReportingGetSalesSummary**
> SalesSummaryResponseDto adminReportingGetSalesSummary()

Retrieve aggregate sales summary metrics

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReportingAdminApi();

try {
    final response = api.adminReportingGetSalesSummary();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReportingAdminApi->adminReportingGetSalesSummary: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**SalesSummaryResponseDto**](SalesSummaryResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminReportingGetTopProducts**
> BuiltList<TopProductDto> adminReportingGetTopProducts()

List top-selling products by quantity

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReportingAdminApi();

try {
    final response = api.adminReportingGetTopProducts();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReportingAdminApi->adminReportingGetTopProducts: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;TopProductDto&gt;**](TopProductDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminReportingListExports**
> PaginatedReportExportsDto adminReportingListExports(cursor, limit)

List report exports with cursor pagination

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReportingAdminApi();
final String cursor = cursor_example; // String | Cursor for the next page of results
final num limit = 8.14; // num | Results per page (1–100)

try {
    final response = api.adminReportingListExports(cursor, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReportingAdminApi->adminReportingListExports: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cursor** | **String**| Cursor for the next page of results | [optional] 
 **limit** | **num**| Results per page (1–100) | [optional] 

### Return type

[**PaginatedReportExportsDto**](PaginatedReportExportsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

