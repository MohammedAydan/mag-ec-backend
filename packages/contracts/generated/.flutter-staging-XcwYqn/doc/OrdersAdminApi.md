# mag_api_client.api.OrdersAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminOrderCancellationCancelOrder**](OrdersAdminApi.md#adminordercancellationcancelorder) | **POST** /api/v1/orders/admin/{orderId}/cancel | Admin cancel an order
[**adminOrdersGetOrder**](OrdersAdminApi.md#adminordersgetorder) | **GET** /api/v1/orders/admin/{orderId} | Get a single order by ID (admin view)
[**adminOrdersListOrders**](OrdersAdminApi.md#adminorderslistorders) | **GET** /api/v1/orders/admin | List all orders (admin view)


# **adminOrderCancellationCancelOrder**
> SerializedOrderDto adminOrderCancellationCancelOrder(cancelOrderDto, orderId)

Admin cancel an order

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getOrdersAdminApi();
final CancelOrderDto cancelOrderDto = ; // CancelOrderDto | 
final String orderId = orderId_example; // String | Order identifier

try {
    final response = api.adminOrderCancellationCancelOrder(cancelOrderDto, orderId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OrdersAdminApi->adminOrderCancellationCancelOrder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cancelOrderDto** | [**CancelOrderDto**](CancelOrderDto.md)|  | 
 **orderId** | **String**| Order identifier | 

### Return type

[**SerializedOrderDto**](SerializedOrderDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminOrdersGetOrder**
> SerializedOrderDto adminOrdersGetOrder(orderId)

Get a single order by ID (admin view)

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getOrdersAdminApi();
final String orderId = orderId_example; // String | Order ID

try {
    final response = api.adminOrdersGetOrder(orderId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OrdersAdminApi->adminOrdersGetOrder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderId** | **String**| Order ID | 

### Return type

[**SerializedOrderDto**](SerializedOrderDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminOrdersListOrders**
> BuiltList<SerializedOrderDto> adminOrdersListOrders()

List all orders (admin view)

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getOrdersAdminApi();

try {
    final response = api.adminOrdersListOrders();
    print(response);
} on DioException catch (e) {
    print('Exception when calling OrdersAdminApi->adminOrdersListOrders: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;SerializedOrderDto&gt;**](SerializedOrderDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

