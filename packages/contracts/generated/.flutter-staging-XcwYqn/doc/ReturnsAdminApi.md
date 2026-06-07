# mag_api_client.api.ReturnsAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminReturnsGetReturn**](ReturnsAdminApi.md#adminreturnsgetreturn) | **GET** /api/v1/returns/admin/{returnRequestId} | Get a return request by ID
[**adminReturnsListReturns**](ReturnsAdminApi.md#adminreturnslistreturns) | **GET** /api/v1/returns/admin | List all return requests
[**adminReturnsReceiveReturn**](ReturnsAdminApi.md#adminreturnsreceivereturn) | **POST** /api/v1/returns/admin/{returnRequestId}/receive | Receive a return request
[**adminReturnsRefundReturn**](ReturnsAdminApi.md#adminreturnsrefundreturn) | **POST** /api/v1/returns/admin/{returnRequestId}/refund | Execute a refund for a return request
[**adminReturnsReviewReturn**](ReturnsAdminApi.md#adminreturnsreviewreturn) | **POST** /api/v1/returns/admin/{returnRequestId}/review | Review a return request


# **adminReturnsGetReturn**
> ReturnRequestResponseDto adminReturnsGetReturn(returnRequestId)

Get a return request by ID

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReturnsAdminApi();
final String returnRequestId = returnRequestId_example; // String | Return request identifier

try {
    final response = api.adminReturnsGetReturn(returnRequestId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReturnsAdminApi->adminReturnsGetReturn: $e\n');
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

# **adminReturnsListReturns**
> BuiltList<ReturnRequestResponseDto> adminReturnsListReturns()

List all return requests

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReturnsAdminApi();

try {
    final response = api.adminReturnsListReturns();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReturnsAdminApi->adminReturnsListReturns: $e\n');
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

# **adminReturnsReceiveReturn**
> ReturnRequestResponseDto adminReturnsReceiveReturn(receiveReturnRequestDto, returnRequestId)

Receive a return request

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReturnsAdminApi();
final ReceiveReturnRequestDto receiveReturnRequestDto = ; // ReceiveReturnRequestDto | 
final String returnRequestId = returnRequestId_example; // String | Return request identifier

try {
    final response = api.adminReturnsReceiveReturn(receiveReturnRequestDto, returnRequestId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReturnsAdminApi->adminReturnsReceiveReturn: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **receiveReturnRequestDto** | [**ReceiveReturnRequestDto**](ReceiveReturnRequestDto.md)|  | 
 **returnRequestId** | **String**| Return request identifier | 

### Return type

[**ReturnRequestResponseDto**](ReturnRequestResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminReturnsRefundReturn**
> ReturnRequestResponseDto adminReturnsRefundReturn(executeReturnRefundDto, returnRequestId)

Execute a refund for a return request

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReturnsAdminApi();
final ExecuteReturnRefundDto executeReturnRefundDto = ; // ExecuteReturnRefundDto | 
final String returnRequestId = returnRequestId_example; // String | Return request identifier

try {
    final response = api.adminReturnsRefundReturn(executeReturnRefundDto, returnRequestId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReturnsAdminApi->adminReturnsRefundReturn: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **executeReturnRefundDto** | [**ExecuteReturnRefundDto**](ExecuteReturnRefundDto.md)|  | 
 **returnRequestId** | **String**| Return request identifier | 

### Return type

[**ReturnRequestResponseDto**](ReturnRequestResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminReturnsReviewReturn**
> ReturnRequestResponseDto adminReturnsReviewReturn(reviewReturnRequestDto, returnRequestId)

Review a return request

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReturnsAdminApi();
final ReviewReturnRequestDto reviewReturnRequestDto = ; // ReviewReturnRequestDto | 
final String returnRequestId = returnRequestId_example; // String | Return request identifier

try {
    final response = api.adminReturnsReviewReturn(reviewReturnRequestDto, returnRequestId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReturnsAdminApi->adminReturnsReviewReturn: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reviewReturnRequestDto** | [**ReviewReturnRequestDto**](ReviewReturnRequestDto.md)|  | 
 **returnRequestId** | **String**| Return request identifier | 

### Return type

[**ReturnRequestResponseDto**](ReturnRequestResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

