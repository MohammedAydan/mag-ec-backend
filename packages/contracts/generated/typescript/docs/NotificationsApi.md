# NotificationsApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**customerNotificationsGetPreference**](NotificationsApi.md#customernotificationsgetpreference) | **GET** /api/v1/notifications/me/preferences | Get my notification preferences |
| [**customerNotificationsListMyNotifications**](NotificationsApi.md#customernotificationslistmynotifications) | **GET** /api/v1/notifications/me | List my notifications |
| [**customerNotificationsRegisterPushDevice**](NotificationsApi.md#customernotificationsregisterpushdevice) | **POST** /api/v1/notifications/me/push-devices | Register a push device |
| [**customerNotificationsUnregisterPushDevice**](NotificationsApi.md#customernotificationsunregisterpushdevice) | **DELETE** /api/v1/notifications/me/push-devices/{deviceId} | Unregister a push device |
| [**customerNotificationsUpsertPreference**](NotificationsApi.md#customernotificationsupsertpreference) | **PUT** /api/v1/notifications/me/preferences | Upsert notification preferences |



## customerNotificationsGetPreference

> NotificationPreferenceResponseDto customerNotificationsGetPreference()

Get my notification preferences

### Example

```ts
import {
  Configuration,
  NotificationsApi,
} from '@mag/generated-api-client';
import type { CustomerNotificationsGetPreferenceRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new NotificationsApi(config);

  try {
    const data = await api.customerNotificationsGetPreference();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**NotificationPreferenceResponseDto**](NotificationPreferenceResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Notification preferences |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## customerNotificationsListMyNotifications

> PaginatedNotificationsDto customerNotificationsListMyNotifications(cursor, status, channel)

List my notifications

### Example

```ts
import {
  Configuration,
  NotificationsApi,
} from '@mag/generated-api-client';
import type { CustomerNotificationsListMyNotificationsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new NotificationsApi(config);

  const body = {
    // string | Cursor for pagination (optional)
    cursor: cursor_example,
    // 'PENDING' | 'PROCESSING' | 'SENT' | 'FAILED' | Filter by notification status (optional)
    status: status_example,
    // 'EMAIL' | 'PUSH' | 'IN_APP' | Filter by notification channel (optional)
    channel: channel_example,
  } satisfies CustomerNotificationsListMyNotificationsRequest;

  try {
    const data = await api.customerNotificationsListMyNotifications(body);
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
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## customerNotificationsRegisterPushDevice

> PushDeviceResponseDto customerNotificationsRegisterPushDevice(registerPushDeviceDto)

Register a push device

### Example

```ts
import {
  Configuration,
  NotificationsApi,
} from '@mag/generated-api-client';
import type { CustomerNotificationsRegisterPushDeviceRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new NotificationsApi(config);

  const body = {
    // RegisterPushDeviceDto
    registerPushDeviceDto: ...,
  } satisfies CustomerNotificationsRegisterPushDeviceRequest;

  try {
    const data = await api.customerNotificationsRegisterPushDevice(body);
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
| **registerPushDeviceDto** | [RegisterPushDeviceDto](RegisterPushDeviceDto.md) |  | |

### Return type

[**PushDeviceResponseDto**](PushDeviceResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Push device registered |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## customerNotificationsUnregisterPushDevice

> UnregisterPushDeviceResponseDto customerNotificationsUnregisterPushDevice(deviceId)

Unregister a push device

### Example

```ts
import {
  Configuration,
  NotificationsApi,
} from '@mag/generated-api-client';
import type { CustomerNotificationsUnregisterPushDeviceRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new NotificationsApi(config);

  const body = {
    // string | Push device identifier
    deviceId: deviceId_example,
  } satisfies CustomerNotificationsUnregisterPushDeviceRequest;

  try {
    const data = await api.customerNotificationsUnregisterPushDevice(body);
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
| **deviceId** | `string` | Push device identifier | [Defaults to `undefined`] |

### Return type

[**UnregisterPushDeviceResponseDto**](UnregisterPushDeviceResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Push device unregistered |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |
| **404** | Push device not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## customerNotificationsUpsertPreference

> NotificationPreferenceResponseDto customerNotificationsUpsertPreference(upsertNotificationPreferenceDto)

Upsert notification preferences

### Example

```ts
import {
  Configuration,
  NotificationsApi,
} from '@mag/generated-api-client';
import type { CustomerNotificationsUpsertPreferenceRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new NotificationsApi(config);

  const body = {
    // UpsertNotificationPreferenceDto
    upsertNotificationPreferenceDto: ...,
  } satisfies CustomerNotificationsUpsertPreferenceRequest;

  try {
    const data = await api.customerNotificationsUpsertPreference(body);
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
| **upsertNotificationPreferenceDto** | [UpsertNotificationPreferenceDto](UpsertNotificationPreferenceDto.md) |  | |

### Return type

[**NotificationPreferenceResponseDto**](NotificationPreferenceResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Updated notification preferences |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

