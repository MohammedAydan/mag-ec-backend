# mag_api_client.api.ReturnsApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**customerReturnsCreateReturn**](ReturnsApi.md#customerreturnscreatereturn) | **POST** /api/v1/returns/me/orders/{orderId} | Create a return request for an order
[**customerReturnsGetMyReturn**](ReturnsApi.md#customerreturnsgetmyreturn) | **GET** /api/v1/returns/me/{returnRequestId} | Get a return request by ID
[**customerReturnsListMyReturns**](ReturnsApi.md#customerreturnslistmyreturns) | **GET** /api/v1/returns/me | List my return requests


# **customerReturnsCreateReturn**
> ReturnRequestResponseDto customerReturnsCreateReturn(createReturnRequestDto, orderId)

Create a return request for an order

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReturnsApi();
final CreateReturnRequestDto createReturnRequestDto = ; // CreateReturnRequestDto | 
final String orderId = orderId_example; // String | Order identifier

try {
    final response = api.customerReturnsCreateReturn(createReturnRequestDto, orderId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReturnsApi->customerReturnsCreateReturn: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createReturnRequestDto** | [**CreateReturnRequestDto**](CreateReturnRequestDto.md)|  | 
 **orderId** | **String**| Order identifier | 

### Return type

[**ReturnRequestResponseDto**](ReturnRequestResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **customerReturnsGetMyReturn**
> ReturnRequestResponseDto customerReturnsGetMyReturn(returnRequestId)

Get a return request by ID

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReturnsApi();
final String returnRequestId = returnRequestId_example; // String | Return request identifier

try {
    final response = api.customerReturnsGetMyReturn(returnRequestId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReturnsApi->customerReturnsGetMyReturn: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **returnRequestId** | **String**| Return request identifier | 

### Return type

[**ReturnRequestResponseDto**](ReturnRequestResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **customerReturnsListMyReturns**
> BuiltList<ReturnRequestResponseDto> customerReturnsListMyReturns()

List my return requests

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReturnsApi();

try {
    final response = api.customerReturnsListMyReturns();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReturnsApi->customerReturnsListMyReturns: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ReturnRequestResponseDto&gt;**](ReturnRequestResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

