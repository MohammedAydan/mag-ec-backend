# FulfillmentApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**customerFulfillmentListMyShipments**](FulfillmentApi.md#customerfulfillmentlistmyshipments) | **GET** /api/v1/orders/me/{orderId}/shipments | List my order shipments |



## customerFulfillmentListMyShipments

> Array&lt;FulfillmentResponseDto&gt; customerFulfillmentListMyShipments(orderId)

List my order shipments

### Example

```ts
import {
  Configuration,
  FulfillmentApi,
} from '@mag/generated-api-client';
import type { CustomerFulfillmentListMyShipmentsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new FulfillmentApi(config);

  const body = {
    // string | Order identifier
    orderId: orderId_example,
  } satisfies CustomerFulfillmentListMyShipmentsRequest;

  try {
    const data = await api.customerFulfillmentListMyShipments(body);
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

### Return type

[**Array&lt;FulfillmentResponseDto&gt;**](FulfillmentResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | List of shipments for the order |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |
| **404** | Order not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

