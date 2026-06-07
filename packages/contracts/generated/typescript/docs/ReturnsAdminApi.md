# ReturnsAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**adminReturnsGetReturn**](ReturnsAdminApi.md#adminreturnsgetreturn) | **GET** /api/v1/returns/admin/{returnRequestId} | Get a return request by ID |
| [**adminReturnsListReturns**](ReturnsAdminApi.md#adminreturnslistreturns) | **GET** /api/v1/returns/admin | List all return requests |
| [**adminReturnsReceiveReturn**](ReturnsAdminApi.md#adminreturnsreceivereturn) | **POST** /api/v1/returns/admin/{returnRequestId}/receive | Receive a return request |
| [**adminReturnsRefundReturn**](ReturnsAdminApi.md#adminreturnsrefundreturn) | **POST** /api/v1/returns/admin/{returnRequestId}/refund | Execute a refund for a return request |
| [**adminReturnsReviewReturn**](ReturnsAdminApi.md#adminreturnsreviewreturn) | **POST** /api/v1/returns/admin/{returnRequestId}/review | Review a return request |



## adminReturnsGetReturn

> ReturnRequestResponseDto adminReturnsGetReturn(returnRequestId)

Get a return request by ID

### Example

```ts
import {
  Configuration,
  ReturnsAdminApi,
} from '@mag/generated-api-client';
import type { AdminReturnsGetReturnRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReturnsAdminApi(config);

  const body = {
    // string | Return request identifier
    returnRequestId: returnRequestId_example,
  } satisfies AdminReturnsGetReturnRequest;

  try {
    const data = await api.adminReturnsGetReturn(body);
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
| **403** | Insufficient permissions |  -  |
| **404** | Return request not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminReturnsListReturns

> Array&lt;ReturnRequestResponseDto&gt; adminReturnsListReturns()

List all return requests

### Example

```ts
import {
  Configuration,
  ReturnsAdminApi,
} from '@mag/generated-api-client';
import type { AdminReturnsListReturnsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReturnsAdminApi(config);

  try {
    const data = await api.adminReturnsListReturns();
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
| **200** | List of all return requests |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminReturnsReceiveReturn

> ReturnRequestResponseDto adminReturnsReceiveReturn(returnRequestId, receiveReturnRequestDto)

Receive a return request

### Example

```ts
import {
  Configuration,
  ReturnsAdminApi,
} from '@mag/generated-api-client';
import type { AdminReturnsReceiveReturnRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReturnsAdminApi(config);

  const body = {
    // string | Return request identifier
    returnRequestId: returnRequestId_example,
    // ReceiveReturnRequestDto
    receiveReturnRequestDto: ...,
  } satisfies AdminReturnsReceiveReturnRequest;

  try {
    const data = await api.adminReturnsReceiveReturn(body);
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
| **receiveReturnRequestDto** | [ReceiveReturnRequestDto](ReceiveReturnRequestDto.md) |  | |

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
| **200** | Return request received |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Return request not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminReturnsRefundReturn

> ReturnRequestResponseDto adminReturnsRefundReturn(returnRequestId, executeReturnRefundDto)

Execute a refund for a return request

### Example

```ts
import {
  Configuration,
  ReturnsAdminApi,
} from '@mag/generated-api-client';
import type { AdminReturnsRefundReturnRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReturnsAdminApi(config);

  const body = {
    // string | Return request identifier
    returnRequestId: returnRequestId_example,
    // ExecuteReturnRefundDto
    executeReturnRefundDto: ...,
  } satisfies AdminReturnsRefundReturnRequest;

  try {
    const data = await api.adminReturnsRefundReturn(body);
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
| **executeReturnRefundDto** | [ExecuteReturnRefundDto](ExecuteReturnRefundDto.md) |  | |

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
| **200** | Return refund executed |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Return request not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminReturnsReviewReturn

> ReturnRequestResponseDto adminReturnsReviewReturn(returnRequestId, reviewReturnRequestDto)

Review a return request

### Example

```ts
import {
  Configuration,
  ReturnsAdminApi,
} from '@mag/generated-api-client';
import type { AdminReturnsReviewReturnRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReturnsAdminApi(config);

  const body = {
    // string | Return request identifier
    returnRequestId: returnRequestId_example,
    // ReviewReturnRequestDto
    reviewReturnRequestDto: ...,
  } satisfies AdminReturnsReviewReturnRequest;

  try {
    const data = await api.adminReturnsReviewReturn(body);
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
| **reviewReturnRequestDto** | [ReviewReturnRequestDto](ReviewReturnRequestDto.md) |  | |

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
| **200** | Return request reviewed |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Return request not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

