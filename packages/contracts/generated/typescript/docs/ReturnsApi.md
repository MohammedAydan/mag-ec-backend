# ReturnsApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**customerReturnsCreateReturn**](ReturnsApi.md#customerreturnscreatereturn) | **POST** /api/v1/returns/me/orders/{orderId} | Create a return request for an order |
| [**customerReturnsGetMyReturn**](ReturnsApi.md#customerreturnsgetmyreturn) | **GET** /api/v1/returns/me/{returnRequestId} | Get a return request by ID |
| [**customerReturnsListMyReturns**](ReturnsApi.md#customerreturnslistmyreturns) | **GET** /api/v1/returns/me | List my return requests |



## customerReturnsCreateReturn

> ReturnRequestResponseDto customerReturnsCreateReturn(orderId, createReturnRequestDto)

Create a return request for an order

### Example

```ts
import {
  Configuration,
  ReturnsApi,
} from '@mag/generated-api-client';
import type { CustomerReturnsCreateReturnRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReturnsApi(config);

  const body = {
    // string | Order identifier
    orderId: orderId_example,
    // CreateReturnRequestDto
    createReturnRequestDto: ...,
  } satisfies CustomerReturnsCreateReturnRequest;

  try {
    const data = await api.customerReturnsCreateReturn(body);
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
| **createReturnRequestDto** | [CreateReturnRequestDto](CreateReturnRequestDto.md) |  | |

### Return type

[**ReturnRequestResponseDto**](ReturnRequestResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Return request created |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |
| **404** | Order not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## customerReturnsGetMyReturn

> ReturnRequestResponseDto customerReturnsGetMyReturn(returnRequestId)

Get a return request by ID

### Example

```ts
import {
  Configuration,
  ReturnsApi,
} from '@mag/generated-api-client';
import type { CustomerReturnsGetMyReturnRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReturnsApi(config);

  const body = {
    // string | Return request identifier
    returnRequestId: returnRequestId_example,
  } satisfies CustomerReturnsGetMyReturnRequest;

  try {
    const data = await api.customerReturnsGetMyReturn(body);
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
| **returnRequestId** | `string` | Return request identifier | [Defaults to `undefined`] |

### Return type

[**ReturnRequestResponseDto**](ReturnRequestResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Return request details |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |
| **404** | Return request not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## customerReturnsListMyReturns

> Array&lt;ReturnRequestResponseDto&gt; customerReturnsListMyReturns()

List my return requests

### Example

```ts
import {
  Configuration,
  ReturnsApi,
} from '@mag/generated-api-client';
import type { CustomerReturnsListMyReturnsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReturnsApi(config);

  try {
    const data = await api.customerReturnsListMyReturns();
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

[**Array&lt;ReturnRequestResponseDto&gt;**](ReturnRequestResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | List of customer return requests |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

