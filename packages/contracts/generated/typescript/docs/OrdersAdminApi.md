# OrdersAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**adminOrderCancellationCancelOrder**](OrdersAdminApi.md#adminordercancellationcancelorder) | **POST** /api/v1/orders/admin/{orderId}/cancel | Admin cancel an order |
| [**adminOrdersGetOrder**](OrdersAdminApi.md#adminordersgetorder) | **GET** /api/v1/orders/admin/{orderId} | Get a single order by ID (admin view) |
| [**adminOrdersListOrders**](OrdersAdminApi.md#adminorderslistorders) | **GET** /api/v1/orders/admin | List all orders (admin view) |



## adminOrderCancellationCancelOrder

> SerializedOrderDto adminOrderCancellationCancelOrder(orderId, cancelOrderDto)

Admin cancel an order

### Example

```ts
import {
  Configuration,
  OrdersAdminApi,
} from '@mag/generated-api-client';
import type { AdminOrderCancellationCancelOrderRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new OrdersAdminApi(config);

  const body = {
    // string | Order identifier
    orderId: orderId_example,
    // CancelOrderDto
    cancelOrderDto: ...,
  } satisfies AdminOrderCancellationCancelOrderRequest;

  try {
    const data = await api.adminOrderCancellationCancelOrder(body);
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
| **orderId** | `string` | Order identifier | [Defaults to `undefined`] |
| **cancelOrderDto** | [CancelOrderDto](CancelOrderDto.md) |  | |

### Return type

[**SerializedOrderDto**](SerializedOrderDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Order cancelled |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Order not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminOrdersGetOrder

> SerializedOrderDto adminOrdersGetOrder(orderId)

Get a single order by ID (admin view)

### Example

```ts
import {
  Configuration,
  OrdersAdminApi,
} from '@mag/generated-api-client';
import type { AdminOrdersGetOrderRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new OrdersAdminApi(config);

  const body = {
    // string | Order ID
    orderId: orderId_example,
  } satisfies AdminOrdersGetOrderRequest;

  try {
    const data = await api.adminOrdersGetOrder(body);
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
| **orderId** | `string` | Order ID | [Defaults to `undefined`] |

### Return type

[**SerializedOrderDto**](SerializedOrderDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Order details (admin view) |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Order not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminOrdersListOrders

> Array&lt;SerializedOrderDto&gt; adminOrdersListOrders()

List all orders (admin view)

### Example

```ts
import {
  Configuration,
  OrdersAdminApi,
} from '@mag/generated-api-client';
import type { AdminOrdersListOrdersRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new OrdersAdminApi(config);

  try {
    const data = await api.adminOrdersListOrders();
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

[**Array&lt;SerializedOrderDto&gt;**](SerializedOrderDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | List of all orders (admin view) |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

