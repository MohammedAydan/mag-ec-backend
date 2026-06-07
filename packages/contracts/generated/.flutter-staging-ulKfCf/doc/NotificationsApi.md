# mag_api_client.api.NotificationsApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**customerNotificationsGetPreference**](NotificationsApi.md#customernotificationsgetpreference) | **GET** /api/v1/notifications/me/preferences | Get my notification preferences
[**customerNotificationsListMyNotifications**](NotificationsApi.md#customernotificationslistmynotifications) | **GET** /api/v1/notifications/me | List my notifications
[**customerNotificationsRegisterPushDevice**](NotificationsApi.md#customernotificationsregisterpushdevice) | **POST** /api/v1/notifications/me/push-devices | Register a push device
[**customerNotificationsUnregisterPushDevice**](NotificationsApi.md#customernotificationsunregisterpushdevice) | **DELETE** /api/v1/notifications/me/push-devices/{deviceId} | Unregister a push device
[**customerNotificationsUpsertPreference**](NotificationsApi.md#customernotificationsupsertpreference) | **PUT** /api/v1/notifications/me/preferences | Upsert notification preferences


# **customerNotificationsGetPreference**
> NotificationPreferenceResponseDto customerNotificationsGetPreference()

Get my notification preferences

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getNotificationsApi();

try {
    final response = api.customerNotificationsGetPreference();
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->customerNotificationsGetPreference: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**NotificationPreferenceResponseDto**](NotificationPreferenceResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **customerNotificationsListMyNotifications**
> PaginatedNotificationsDto customerNotificationsListMyNotifications(cursor, status, channel)

List my notifications

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getNotificationsApi();
final String cursor = cursor_example; // String | Cursor for pagination
final String status = status_example; // String | Filter by notification status
final String channel = channel_example; // String | Filter by notification channel

try {
    final response = api.customerNotificationsListMyNotifications(cursor, status, channel);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->customerNotificationsListMyNotifications: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cursor** | **String**| Cursor for pagination | [optional] 
 **status** | **String**| Filter by notification status | [optional] 
 **channel** | **String**| Filter by notification channel | [optional] 

### Return type

[**PaginatedNotificationsDto**](PaginatedNotificationsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **customerNotificationsRegisterPushDevice**
> PushDeviceResponseDto customerNotificationsRegisterPushDevice(registerPushDeviceDto)

Register a push device

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getNotificationsApi();
final RegisterPushDeviceDto registerPushDeviceDto = ; // RegisterPushDeviceDto | 

try {
    final response = api.customerNotificationsRegisterPushDevice(registerPushDeviceDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->customerNotificationsRegisterPushDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerPushDeviceDto** | [**RegisterPushDeviceDto**](RegisterPushDeviceDto.md)|  | 

### Return type

[**PushDeviceResponseDto**](PushDeviceResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **customerNotificationsUnregisterPushDevice**
> UnregisterPushDeviceResponseDto customerNotificationsUnregisterPushDevice(deviceId)

Unregister a push device

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getNotificationsApi();
final String deviceId = deviceId_example; // String | Push device identifier

try {
    final response = api.customerNotificationsUnregisterPushDevice(deviceId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->customerNotificationsUnregisterPushDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**| Push device identifier | 

### Return type

[**UnregisterPushDeviceResponseDto**](UnregisterPushDeviceResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **customerNotificationsUpsertPreference**
> NotificationPreferenceResponseDto customerNotificationsUpsertPreference(upsertNotificationPreferenceDto)

Upsert notification preferences

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getNotificationsApi();
final UpsertNotificationPreferenceDto upsertNotificationPreferenceDto = ; // UpsertNotificationPreferenceDto | 

try {
    final response = api.customerNotificationsUpsertPreference(upsertNotificationPreferenceDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsApi->customerNotificationsUpsertPreference: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **upsertNotificationPreferenceDto** | [**UpsertNotificationPreferenceDto**](UpsertNotificationPreferenceDto.md)|  | 

### Return type

[**NotificationPreferenceResponseDto**](NotificationPreferenceResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

