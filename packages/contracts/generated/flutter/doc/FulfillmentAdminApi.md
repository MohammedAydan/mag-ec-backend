# mag_api_client.api.FulfillmentAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminFulfillmentCreateShipment**](FulfillmentAdminApi.md#adminfulfillmentcreateshipment) | **POST** /api/v1/orders/admin/{orderId}/shipments | Create a shipment for an order
[**adminFulfillmentListShipments**](FulfillmentAdminApi.md#adminfulfillmentlistshipments) | **GET** /api/v1/orders/admin/{orderId}/shipments | List shipments for an order
[**adminFulfillmentUpdateShipmentStatus**](FulfillmentAdminApi.md#adminfulfillmentupdateshipmentstatus) | **PATCH** /api/v1/orders/admin/{orderId}/shipments/{shipmentId}/status | Update shipment status


# **adminFulfillmentCreateShipment**
> FulfillmentResponseDto adminFulfillmentCreateShipment(createShipmentDto, orderId)

Create a shipment for an order

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getFulfillmentAdminApi();
final CreateShipmentDto createShipmentDto = ; // CreateShipmentDto | 
final String orderId = orderId_example; // String | Order identifier

try {
    final response = api.adminFulfillmentCreateShipment(createShipmentDto, orderId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling FulfillmentAdminApi->adminFulfillmentCreateShipment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createShipmentDto** | [**CreateShipmentDto**](CreateShipmentDto.md)|  | 
 **orderId** | **String**| Order identifier | 

### Return type

[**FulfillmentResponseDto**](FulfillmentResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminFulfillmentListShipments**
> BuiltList<FulfillmentResponseDto> adminFulfillmentListShipments(orderId)

List shipments for an order

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getFulfillmentAdminApi();
final String orderId = orderId_example; // String | Order identifier

try {
    final response = api.adminFulfillmentListShipments(orderId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling FulfillmentAdminApi->adminFulfillmentListShipments: $e\n');
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

# **adminFulfillmentUpdateShipmentStatus**
> FulfillmentResponseDto adminFulfillmentUpdateShipmentStatus(updateShipmentStatusDto, orderId, shipmentId)

Update shipment status

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getFulfillmentAdminApi();
final UpdateShipmentStatusDto updateShipmentStatusDto = ; // UpdateShipmentStatusDto | 
final String orderId = orderId_example; // String | Order identifier
final String shipmentId = shipmentId_example; // String | Shipment identifier

try {
    final response = api.adminFulfillmentUpdateShipmentStatus(updateShipmentStatusDto, orderId, shipmentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling FulfillmentAdminApi->adminFulfillmentUpdateShipmentStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateShipmentStatusDto** | [**UpdateShipmentStatusDto**](UpdateShipmentStatusDto.md)|  | 
 **orderId** | **String**| Order identifier | 
 **shipmentId** | **String**| Shipment identifier | 

### Return type

[**FulfillmentResponseDto**](FulfillmentResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

