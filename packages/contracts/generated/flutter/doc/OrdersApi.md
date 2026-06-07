# mag_api_client.api.OrdersApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**customerOrderCancellationCancelOrder**](OrdersApi.md#customerordercancellationcancelorder) | **POST** /api/v1/orders/me/{orderId}/cancel | Cancel an order
[**customerOrdersGetMyOrder**](OrdersApi.md#customerordersgetmyorder) | **GET** /api/v1/orders/me/{orderId} | Get a single customer order by ID
[**customerOrdersListMyOrders**](OrdersApi.md#customerorderslistmyorders) | **GET** /api/v1/orders/me | List authenticated customer orders


# **customerOrderCancellationCancelOrder**
> SerializedOrderDto customerOrderCancellationCancelOrder(cancelOrderDto, orderId)

Cancel an order

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getOrdersApi();
final CancelOrderDto cancelOrderDto = ; // CancelOrderDto | 
final String orderId = orderId_example; // String | Order identifier

try {
    final response = api.customerOrderCancellationCancelOrder(cancelOrderDto, orderId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OrdersApi->customerOrderCancellationCancelOrder: $e\n');
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

# **customerOrdersGetMyOrder**
> SerializedOrderDto customerOrdersGetMyOrder(orderId)

Get a single customer order by ID

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getOrdersApi();
final String orderId = orderId_example; // String | Order ID

try {
    final response = api.customerOrdersGetMyOrder(orderId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OrdersApi->customerOrdersGetMyOrder: $e\n');
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

# **customerOrdersListMyOrders**
> BuiltList<SerializedOrderDto> customerOrdersListMyOrders()

List authenticated customer orders

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getOrdersApi();

try {
    final response = api.customerOrdersListMyOrders();
    print(response);
} on DioException catch (e) {
    print('Exception when calling OrdersApi->customerOrdersListMyOrders: $e\n');
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

