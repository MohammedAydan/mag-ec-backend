# mag_api_client.api.FulfillmentApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**customerFulfillmentListMyShipments**](FulfillmentApi.md#customerfulfillmentlistmyshipments) | **GET** /api/v1/orders/me/{orderId}/shipments | List my order shipments


# **customerFulfillmentListMyShipments**
> BuiltList<FulfillmentResponseDto> customerFulfillmentListMyShipments(orderId)

List my order shipments

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getFulfillmentApi();
final String orderId = orderId_example; // String | Order identifier

try {
    final response = api.customerFulfillmentListMyShipments(orderId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling FulfillmentApi->customerFulfillmentListMyShipments: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderId** | **String**| Order identifier | 

### Return type

[**BuiltList&lt;FulfillmentResponseDto&gt;**](FulfillmentResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

