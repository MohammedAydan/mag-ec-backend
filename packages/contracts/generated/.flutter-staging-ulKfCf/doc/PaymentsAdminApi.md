# mag_api_client.api.PaymentsAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminPaymentsListAttempts**](PaymentsAdminApi.md#adminpaymentslistattempts) | **GET** /api/v1/payments/admin/attempts | List all payment attempts
[**adminPaymentsListRefunds**](PaymentsAdminApi.md#adminpaymentslistrefunds) | **GET** /api/v1/payments/admin/refunds | List all refunds
[**adminPaymentsListWebhookEvents**](PaymentsAdminApi.md#adminpaymentslistwebhookevents) | **GET** /api/v1/payments/admin/webhook-events | List all payment webhook events


# **adminPaymentsListAttempts**
> PaginatedPaymentAttemptsDto adminPaymentsListAttempts(cursor, limit, orderId, status, provider)

List all payment attempts

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPaymentsAdminApi();
final String cursor = cursor_example; // String | Pagination cursor (opaque token from previous page)
final num limit = 8.14; // num | Page size (1–100, default server-defined)
final String orderId = orderId_example; // String | Filter by order ID
final String status = status_example; // String | Filter by payment-attempt status
final String provider = provider_example; // String | Filter by payment provider

try {
    final response = api.adminPaymentsListAttempts(cursor, limit, orderId, status, provider);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PaymentsAdminApi->adminPaymentsListAttempts: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cursor** | **String**| Pagination cursor (opaque token from previous page) | [optional] 
 **limit** | **num**| Page size (1–100, default server-defined) | [optional] 
 **orderId** | **String**| Filter by order ID | [optional] 
 **status** | **String**| Filter by payment-attempt status | [optional] 
 **provider** | **String**| Filter by payment provider | [optional] 

### Return type

[**PaginatedPaymentAttemptsDto**](PaginatedPaymentAttemptsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminPaymentsListRefunds**
> PaginatedRefundsDto adminPaymentsListRefunds(cursor, limit, orderId, status, provider)

List all refunds

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPaymentsAdminApi();
final String cursor = cursor_example; // String | Pagination cursor (opaque token from previous page)
final num limit = 8.14; // num | Page size (1–100, default server-defined)
final String orderId = orderId_example; // String | Filter by order ID
final String status = status_example; // String | Filter by refund status
final String provider = provider_example; // String | Filter by payment provider

try {
    final response = api.adminPaymentsListRefunds(cursor, limit, orderId, status, provider);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PaymentsAdminApi->adminPaymentsListRefunds: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cursor** | **String**| Pagination cursor (opaque token from previous page) | [optional] 
 **limit** | **num**| Page size (1–100, default server-defined) | [optional] 
 **orderId** | **String**| Filter by order ID | [optional] 
 **status** | **String**| Filter by refund status | [optional] 
 **provider** | **String**| Filter by payment provider | [optional] 

### Return type

[**PaginatedRefundsDto**](PaginatedRefundsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminPaymentsListWebhookEvents**
> PaginatedPaymentWebhookEventsDto adminPaymentsListWebhookEvents(cursor, limit, orderId, status, provider)

List all payment webhook events

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPaymentsAdminApi();
final String cursor = cursor_example; // String | Pagination cursor (opaque token from previous page)
final num limit = 8.14; // num | Page size (1–100, default server-defined)
final String orderId = orderId_example; // String | Filter by order ID
final String status = status_example; // String | Filter by webhook-event status
final String provider = provider_example; // String | Filter by payment provider

try {
    final response = api.adminPaymentsListWebhookEvents(cursor, limit, orderId, status, provider);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PaymentsAdminApi->adminPaymentsListWebhookEvents: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cursor** | **String**| Pagination cursor (opaque token from previous page) | [optional] 
 **limit** | **num**| Page size (1–100, default server-defined) | [optional] 
 **orderId** | **String**| Filter by order ID | [optional] 
 **status** | **String**| Filter by webhook-event status | [optional] 
 **provider** | **String**| Filter by payment provider | [optional] 

### Return type

[**PaginatedPaymentWebhookEventsDto**](PaginatedPaymentWebhookEventsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

