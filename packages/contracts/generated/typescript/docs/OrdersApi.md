# OrdersApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**customerOrderCancellationCancelOrder**](OrdersApi.md#customerordercancellationcancelorder) | **POST** /api/v1/orders/me/{orderId}/cancel | Cancel an order |
| [**customerOrdersGetMyOrder**](OrdersApi.md#customerordersgetmyorder) | **GET** /api/v1/orders/me/{orderId} | Get a single customer order by ID |
| [**customerOrdersListMyOrders**](OrdersApi.md#customerorderslistmyorders) | **GET** /api/v1/orders/me | List authenticated customer orders |



## customerOrderCancellationCancelOrder

> SerializedOrderDto customerOrderCancellationCancelOrder(orderId, cancelOrderDto)

Cancel an order

### Example

```ts
import {
  Configuration,
  OrdersApi,
} from '@mag/generated-api-client';
import type { CustomerOrderCancellationCancelOrderRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new OrdersApi(config);

  const body = {
    // string | Order identifier
    orderId: orderId_example,
    // CancelOrderDto
    cancelOrderDto: ...,
  } satisfies CustomerOrderCancellationCancelOrderRequest;

  try {
    const data = await api.customerOrderCancellationCancelOrder(body);
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
| **403** | Order cannot be cancelled by this authenticated user |  -  |
| **404** | Order not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## customerOrdersGetMyOrder

> SerializedOrderDto customerOrdersGetMyOrder(orderId)

Get a single customer order by ID

### Example

```ts
import {
  Configuration,
  OrdersApi,
} from '@mag/generated-api-client';
import type { CustomerOrdersGetMyOrderRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new OrdersApi(config);

  const body = {
    // string | Order ID
    orderId: orderId_example,
  } satisfies CustomerOrdersGetMyOrderRequest;

  try {
    const data = await api.customerOrdersGetMyOrder(body);
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
| **200** | Customer order details |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |
| **404** | Order not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## customerOrdersListMyOrders

> Array&lt;SerializedOrderDto&gt; customerOrdersListMyOrders()

List authenticated customer orders

### Example

```ts
import {
  Configuration,
  OrdersApi,
} from '@mag/generated-api-client';
import type { CustomerOrdersListMyOrdersRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new OrdersApi(config);

  try {
    const data = await api.customerOrdersListMyOrders();
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
| **200** | List of customer orders |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

