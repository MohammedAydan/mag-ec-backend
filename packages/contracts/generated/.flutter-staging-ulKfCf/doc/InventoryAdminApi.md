# mag_api_client.api.InventoryAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**inventoryAdminAdjustStock**](InventoryAdminApi.md#inventoryadminadjuststock) | **POST** /api/v1/inventory/admin/adjustments | Adjust stock quantity for a variant in a warehouse
[**inventoryAdminGetReservations**](InventoryAdminApi.md#inventoryadmingetreservations) | **GET** /api/v1/inventory/admin/reservations | Query stock reservations with optional filters and status
[**inventoryAdminGetStockLevels**](InventoryAdminApi.md#inventoryadmingetstocklevels) | **GET** /api/v1/inventory/admin/levels | Query current stock levels with optional filters
[**inventoryAdminGetStockMovements**](InventoryAdminApi.md#inventoryadmingetstockmovements) | **GET** /api/v1/inventory/admin/movements | Query paginated stock movement history


# **inventoryAdminAdjustStock**
> StockAdjustmentResponseDto inventoryAdminAdjustStock(adjustStockDto)

Adjust stock quantity for a variant in a warehouse

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getInventoryAdminApi();
final AdjustStockDto adjustStockDto = ; // AdjustStockDto | 

try {
    final response = api.inventoryAdminAdjustStock(adjustStockDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling InventoryAdminApi->inventoryAdminAdjustStock: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **adjustStockDto** | [**AdjustStockDto**](AdjustStockDto.md)|  | 

### Return type

[**StockAdjustmentResponseDto**](StockAdjustmentResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventoryAdminGetReservations**
> BuiltList<StockReservationResponseDto> inventoryAdminGetReservations(warehouseId, variantId, status, limit)

Query stock reservations with optional filters and status

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getInventoryAdminApi();
final String warehouseId = warehouseId_example; // String | Filter by warehouse identifier
final String variantId = variantId_example; // String | Filter by variant identifier
final String status = status_example; // String | Filter by reservation status
final num limit = 8.14; // num | Maximum results to return (1–100)

try {
    final response = api.inventoryAdminGetReservations(warehouseId, variantId, status, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling InventoryAdminApi->inventoryAdminGetReservations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **warehouseId** | **String**| Filter by warehouse identifier | [optional] 
 **variantId** | **String**| Filter by variant identifier | [optional] 
 **status** | **String**| Filter by reservation status | [optional] 
 **limit** | **num**| Maximum results to return (1–100) | [optional] 

### Return type

[**BuiltList&lt;StockReservationResponseDto&gt;**](StockReservationResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventoryAdminGetStockLevels**
> BuiltList<StockLevelResponseDto> inventoryAdminGetStockLevels(warehouseId, variantId, sku)

Query current stock levels with optional filters

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getInventoryAdminApi();
final String warehouseId = warehouseId_example; // String | Filter by warehouse identifier
final String variantId = variantId_example; // String | Filter by variant identifier
final String sku = sku_example; // String | Filter by variant SKU

try {
    final response = api.inventoryAdminGetStockLevels(warehouseId, variantId, sku);
    print(response);
} on DioException catch (e) {
    print('Exception when calling InventoryAdminApi->inventoryAdminGetStockLevels: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **warehouseId** | **String**| Filter by warehouse identifier | [optional] 
 **variantId** | **String**| Filter by variant identifier | [optional] 
 **sku** | **String**| Filter by variant SKU | [optional] 

### Return type

[**BuiltList&lt;StockLevelResponseDto&gt;**](StockLevelResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inventoryAdminGetStockMovements**
> PaginatedStockMovementsDto inventoryAdminGetStockMovements(warehouseId, variantId, type, page, limit)

Query paginated stock movement history

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getInventoryAdminApi();
final String warehouseId = warehouseId_example; // String | Filter by warehouse identifier
final String variantId = variantId_example; // String | Filter by variant identifier
final String type = type_example; // String | Filter by movement type
final num page = 8.14; // num | Page number (1-based)
final num limit = 8.14; // num | Results per page (minimum 1)

try {
    final response = api.inventoryAdminGetStockMovements(warehouseId, variantId, type, page, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling InventoryAdminApi->inventoryAdminGetStockMovements: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **warehouseId** | **String**| Filter by warehouse identifier | [optional] 
 **variantId** | **String**| Filter by variant identifier | [optional] 
 **type** | **String**| Filter by movement type | [optional] 
 **page** | **num**| Page number (1-based) | [optional] 
 **limit** | **num**| Results per page (minimum 1) | [optional] 

### Return type

[**PaginatedStockMovementsDto**](PaginatedStockMovementsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

