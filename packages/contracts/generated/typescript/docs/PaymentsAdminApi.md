# PaymentsAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**adminPaymentsListAttempts**](PaymentsAdminApi.md#adminpaymentslistattempts) | **GET** /api/v1/payments/admin/attempts | List all payment attempts |
| [**adminPaymentsListRefunds**](PaymentsAdminApi.md#adminpaymentslistrefunds) | **GET** /api/v1/payments/admin/refunds | List all refunds |
| [**adminPaymentsListWebhookEvents**](PaymentsAdminApi.md#adminpaymentslistwebhookevents) | **GET** /api/v1/payments/admin/webhook-events | List all payment webhook events |



## adminPaymentsListAttempts

> PaginatedPaymentAttemptsDto adminPaymentsListAttempts(cursor, limit, orderId, status, provider)

List all payment attempts

### Example

```ts
import {
  Configuration,
  PaymentsAdminApi,
} from '@mag/generated-api-client';
import type { AdminPaymentsListAttemptsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PaymentsAdminApi(config);

  const body = {
    // string | Pagination cursor (opaque token from previous page) (optional)
    cursor: cursor_example,
    // number | Page size (1-100, default server-defined) (optional)
    limit: 56,
    // string | Filter by order ID (optional)
    orderId: orderId_example,
    // 'AWAITING_CUSTOMER_ACTION' | 'PROCESSING' | 'SUCCEEDED' | 'FAILED' | 'CANCELLED' | Filter by payment-attempt status (optional)
    status: status_example,
    // 'COD' | 'STRIPE' | Filter by payment provider (optional)
    provider: provider_example,
  } satisfies AdminPaymentsListAttemptsRequest;

  try {
    const data = await api.adminPaymentsListAttempts(body);
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
| **cursor** | `string` | Pagination cursor (opaque token from previous page) | [Optional] [Defaults to `undefined`] |
| **limit** | `number` | Page size (1-100, default server-defined) | [Optional] [Defaults to `undefined`] |
| **orderId** | `string` | Filter by order ID | [Optional] [Defaults to `undefined`] |
| **status** | `AWAITING_CUSTOMER_ACTION`, `PROCESSING`, `SUCCEEDED`, `FAILED`, `CANCELLED` | Filter by payment-attempt status | [Optional] [Defaults to `undefined`] [Enum: AWAITING_CUSTOMER_ACTION, PROCESSING, SUCCEEDED, FAILED, CANCELLED] |
| **provider** | `COD`, `STRIPE` | Filter by payment provider | [Optional] [Defaults to `undefined`] [Enum: COD, STRIPE] |

### Return type

[**PaginatedPaymentAttemptsDto**](PaginatedPaymentAttemptsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Paginated list of payment attempts |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminPaymentsListRefunds

> PaginatedRefundsDto adminPaymentsListRefunds(cursor, limit, orderId, status, provider)

List all refunds

### Example

```ts
import {
  Configuration,
  PaymentsAdminApi,
} from '@mag/generated-api-client';
import type { AdminPaymentsListRefundsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PaymentsAdminApi(config);

  const body = {
    // string | Pagination cursor (opaque token from previous page) (optional)
    cursor: cursor_example,
    // number | Page size (1-100, default server-defined) (optional)
    limit: 56,
    // string | Filter by order ID (optional)
    orderId: orderId_example,
    // 'PENDING' | 'SUCCEEDED' | 'FAILED' | Filter by refund status (optional)
    status: status_example,
    // 'COD' | 'STRIPE' | Filter by payment provider (optional)
    provider: provider_example,
  } satisfies AdminPaymentsListRefundsRequest;

  try {
    const data = await api.adminPaymentsListRefunds(body);
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
| **cursor** | `string` | Pagination cursor (opaque token from previous page) | [Optional] [Defaults to `undefined`] |
| **limit** | `number` | Page size (1-100, default server-defined) | [Optional] [Defaults to `undefined`] |
| **orderId** | `string` | Filter by order ID | [Optional] [Defaults to `undefined`] |
| **status** | `PENDING`, `SUCCEEDED`, `FAILED` | Filter by refund status | [Optional] [Defaults to `undefined`] [Enum: PENDING, SUCCEEDED, FAILED] |
| **provider** | `COD`, `STRIPE` | Filter by payment provider | [Optional] [Defaults to `undefined`] [Enum: COD, STRIPE] |

### Return type

[**PaginatedRefundsDto**](PaginatedRefundsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Paginated list of refunds |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminPaymentsListWebhookEvents

> PaginatedPaymentWebhookEventsDto adminPaymentsListWebhookEvents(cursor, limit, orderId, status, provider)

List all payment webhook events

### Example

```ts
import {
  Configuration,
  PaymentsAdminApi,
} from '@mag/generated-api-client';
import type { AdminPaymentsListWebhookEventsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PaymentsAdminApi(config);

  const body = {
    // string | Pagination cursor (opaque token from previous page) (optional)
    cursor: cursor_example,
    // number | Page size (1-100, default server-defined) (optional)
    limit: 56,
    // string | Filter by order ID (optional)
    orderId: orderId_example,
    // 'RECEIVED' | 'PROCESSED' | 'DUPLICATE' | 'FAILED' | Filter by webhook-event status (optional)
    status: status_example,
    // 'COD' | 'STRIPE' | Filter by payment provider (optional)
    provider: provider_example,
  } satisfies AdminPaymentsListWebhookEventsRequest;

  try {
    const data = await api.adminPaymentsListWebhookEvents(body);
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
| **cursor** | `string` | Pagination cursor (opaque token from previous page) | [Optional] [Defaults to `undefined`] |
| **limit** | `number` | Page size (1-100, default server-defined) | [Optional] [Defaults to `undefined`] |
| **orderId** | `string` | Filter by order ID | [Optional] [Defaults to `undefined`] |
| **status** | `RECEIVED`, `PROCESSED`, `DUPLICATE`, `FAILED` | Filter by webhook-event status | [Optional] [Defaults to `undefined`] [Enum: RECEIVED, PROCESSED, DUPLICATE, FAILED] |
| **provider** | `COD`, `STRIPE` | Filter by payment provider | [Optional] [Defaults to `undefined`] [Enum: COD, STRIPE] |

### Return type

[**PaginatedPaymentWebhookEventsDto**](PaginatedPaymentWebhookEventsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Paginated list of payment webhook events |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

