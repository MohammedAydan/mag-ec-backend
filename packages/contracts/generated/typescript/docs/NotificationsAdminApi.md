# NotificationsAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**adminNotificationsListNotifications**](NotificationsAdminApi.md#adminnotificationslistnotifications) | **GET** /api/v1/notifications/admin | List all notifications |
| [**adminNotificationsRetryNotification**](NotificationsAdminApi.md#adminnotificationsretrynotification) | **POST** /api/v1/notifications/admin/{notificationId}/retry | Retry a failed notification |



## adminNotificationsListNotifications

> PaginatedNotificationsDto adminNotificationsListNotifications(cursor, status, channel)

List all notifications

### Example

```ts
import {
  Configuration,
  NotificationsAdminApi,
} from '@mag/generated-api-client';
import type { AdminNotificationsListNotificationsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new NotificationsAdminApi(config);

  const body = {
    // string | Cursor for pagination (optional)
    cursor: cursor_example,
    // 'PENDING' | 'PROCESSING' | 'SENT' | 'FAILED' | Filter by notification status (optional)
    status: status_example,
    // 'EMAIL' | 'PUSH' | 'IN_APP' | Filter by notification channel (optional)
    channel: channel_example,
  } satisfies AdminNotificationsListNotificationsRequest;

  try {
    const data = await api.adminNotificationsListNotifications(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **cursor** | `string` | Cursor for pagination | [Optional] [Defaults to `undefined`] |
| **status** | `PENDING`, `PROCESSING`, `SENT`, `FAILED` | Filter by notification status | [Optional] [Defaults to `undefined`] [Enum: PENDING, PROCESSING, SENT, FAILED] |
| **channel** | `EMAIL`, `PUSH`, `IN_APP` | Filter by notification channel | [Optional] [Defaults to `undefined`] [Enum: EMAIL, PUSH, IN_APP] |

### Return type

[**PaginatedNotificationsDto**](PaginatedNotificationsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Paginated list of notifications |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminNotificationsRetryNotification

> NotificationResponseDto adminNotificationsRetryNotification(notificationId)

Retry a failed notification

### Example

```ts
import {
  Configuration,
  NotificationsAdminApi,
} from '@mag/generated-api-client';
import type { AdminNotificationsRetryNotificationRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new NotificationsAdminApi(config);

  const body = {
    // string | Notification identifier
    notificationId: notificationId_example,
  } satisfies AdminNotificationsRetryNotificationRequest;

  try {
    const data = await api.adminNotificationsRetryNotification(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **notificationId** | `string` | Notification identifier | [Defaults to `undefined`] |

### Return type

[**NotificationResponseDto**](NotificationResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Notification retry initiated |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Notification not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

