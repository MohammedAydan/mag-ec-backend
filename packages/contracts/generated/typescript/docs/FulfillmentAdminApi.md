# FulfillmentAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**adminFulfillmentCreateShipment**](FulfillmentAdminApi.md#adminfulfillmentcreateshipment) | **POST** /api/v1/orders/admin/{orderId}/shipments | Create a shipment for an order |
| [**adminFulfillmentListShipments**](FulfillmentAdminApi.md#adminfulfillmentlistshipments) | **GET** /api/v1/orders/admin/{orderId}/shipments | List shipments for an order |
| [**adminFulfillmentUpdateShipmentStatus**](FulfillmentAdminApi.md#adminfulfillmentupdateshipmentstatus) | **PATCH** /api/v1/orders/admin/{orderId}/shipments/{shipmentId}/status | Update shipment status |



## adminFulfillmentCreateShipment

> FulfillmentResponseDto adminFulfillmentCreateShipment(orderId, createShipmentDto)

Create a shipment for an order

### Example

```ts
import {
  Configuration,
  FulfillmentAdminApi,
} from '@mag/generated-api-client';
import type { AdminFulfillmentCreateShipmentRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new FulfillmentAdminApi(config);

  const body = {
    // string | Order identifier
    orderId: orderId_example,
    // CreateShipmentDto
    createShipmentDto: ...,
  } satisfies AdminFulfillmentCreateShipmentRequest;

  try {
    const data = await api.adminFulfillmentCreateShipment(body);
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
| **createShipmentDto** | [CreateShipmentDto](CreateShipmentDto.md) |  | |

### Return type

[**FulfillmentResponseDto**](FulfillmentResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Shipment created |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Order not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminFulfillmentListShipments

> Array&lt;FulfillmentResponseDto&gt; adminFulfillmentListShipments(orderId)

List shipments for an order

### Example

```ts
import {
  Configuration,
  FulfillmentAdminApi,
} from '@mag/generated-api-client';
import type { AdminFulfillmentListShipmentsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new FulfillmentAdminApi(config);

  const body = {
    // string | Order identifier
    orderId: orderId_example,
  } satisfies AdminFulfillmentListShipmentsRequest;

  try {
    const data = await api.adminFulfillmentListShipments(body);
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
| **403** | Insufficient permissions |  -  |
| **404** | Order not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminFulfillmentUpdateShipmentStatus

> FulfillmentResponseDto adminFulfillmentUpdateShipmentStatus(orderId, shipmentId, updateShipmentStatusDto)

Update shipment status

### Example

```ts
import {
  Configuration,
  FulfillmentAdminApi,
} from '@mag/generated-api-client';
import type { AdminFulfillmentUpdateShipmentStatusRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new FulfillmentAdminApi(config);

  const body = {
    // string | Order identifier
    orderId: orderId_example,
    // string | Shipment identifier
    shipmentId: shipmentId_example,
    // UpdateShipmentStatusDto
    updateShipmentStatusDto: ...,
  } satisfies AdminFulfillmentUpdateShipmentStatusRequest;

  try {
    const data = await api.adminFulfillmentUpdateShipmentStatus(body);
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
| **shipmentId** | `string` | Shipment identifier | [Defaults to `undefined`] |
| **updateShipmentStatusDto** | [UpdateShipmentStatusDto](UpdateShipmentStatusDto.md) |  | |

### Return type

[**FulfillmentResponseDto**](FulfillmentResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Shipment status updated |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Order or shipment not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

