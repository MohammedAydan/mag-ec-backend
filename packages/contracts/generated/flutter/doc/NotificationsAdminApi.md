# mag_api_client.api.NotificationsAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminNotificationsListNotifications**](NotificationsAdminApi.md#adminnotificationslistnotifications) | **GET** /api/v1/notifications/admin | List all notifications
[**adminNotificationsRetryNotification**](NotificationsAdminApi.md#adminnotificationsretrynotification) | **POST** /api/v1/notifications/admin/{notificationId}/retry | Retry a failed notification


# **adminNotificationsListNotifications**
> PaginatedNotificationsDto adminNotificationsListNotifications(cursor, status, channel)

List all notifications

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getNotificationsAdminApi();
final String cursor = cursor_example; // String | Cursor for pagination
final String status = status_example; // String | Filter by notification status
final String channel = channel_example; // String | Filter by notification channel

try {
    final response = api.adminNotificationsListNotifications(cursor, status, channel);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsAdminApi->adminNotificationsListNotifications: $e\n');
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

# **adminNotificationsRetryNotification**
> NotificationResponseDto adminNotificationsRetryNotification(notificationId)

Retry a failed notification

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getNotificationsAdminApi();
final String notificationId = notificationId_example; // String | Notification identifier

try {
    final response = api.adminNotificationsRetryNotification(notificationId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling NotificationsAdminApi->adminNotificationsRetryNotification: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **notificationId** | **String**| Notification identifier | 

### Return type

[**NotificationResponseDto**](NotificationResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

