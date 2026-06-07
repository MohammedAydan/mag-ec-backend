# ReviewsApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**customerReviewsCreateReview**](ReviewsApi.md#customerreviewscreatereview) | **POST** /api/v1/reviews/order-lines/{orderLineId} | Create a verified purchase review for an order line |
| [**customerReviewsGetMyReview**](ReviewsApi.md#customerreviewsgetmyreview) | **GET** /api/v1/reviews/me/{reviewId} | Get a single review written by the authenticated customer |
| [**customerReviewsListMyReviews**](ReviewsApi.md#customerreviewslistmyreviews) | **GET** /api/v1/reviews/me | List reviews written by the authenticated customer |



## customerReviewsCreateReview

> ReviewResponseDto customerReviewsCreateReview(orderLineId, createReviewDto)

Create a verified purchase review for an order line

### Example

```ts
import {
  Configuration,
  ReviewsApi,
} from '@mag/generated-api-client';
import type { CustomerReviewsCreateReviewRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReviewsApi(config);

  const body = {
    // string | Order line ID
    orderLineId: orderLineId_example,
    // CreateReviewDto
    createReviewDto: ...,
  } satisfies CustomerReviewsCreateReviewRequest;

  try {
    const data = await api.customerReviewsCreateReview(body);
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
| **orderLineId** | `string` | Order line ID | [Defaults to `undefined`] |
| **createReviewDto** | [CreateReviewDto](CreateReviewDto.md) |  | |

### Return type

[**ReviewResponseDto**](ReviewResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Review created successfully |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |
| **404** | Order line not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## customerReviewsGetMyReview

> ReviewResponseDto customerReviewsGetMyReview(reviewId)

Get a single review written by the authenticated customer

### Example

```ts
import {
  Configuration,
  ReviewsApi,
} from '@mag/generated-api-client';
import type { CustomerReviewsGetMyReviewRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReviewsApi(config);

  const body = {
    // string | Review ID
    reviewId: reviewId_example,
  } satisfies CustomerReviewsGetMyReviewRequest;

  try {
    const data = await api.customerReviewsGetMyReview(body);
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
| **reviewId** | `string` | Review ID | [Defaults to `undefined`] |

### Return type

[**ReviewResponseDto**](ReviewResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Review details |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |
| **404** | Review not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## customerReviewsListMyReviews

> PaginatedReviewsDto customerReviewsListMyReviews(cursor, limit, status, productId, userId)

List reviews written by the authenticated customer

### Example

```ts
import {
  Configuration,
  ReviewsApi,
} from '@mag/generated-api-client';
import type { CustomerReviewsListMyReviewsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReviewsApi(config);

  const body = {
    // string | Pagination cursor (optional)
    cursor: cursor_example,
    // number | Page size (max 100) (optional)
    limit: 56,
    // 'PENDING' | 'APPROVED' | 'REJECTED' | 'FLAGGED' | 'HIDDEN' | Filter by review status (optional)
    status: status_example,
    // string | Filter by product ID (optional)
    productId: productId_example,
    // string | Filter by user ID (ignored for /me endpoint) (optional)
    userId: userId_example,
  } satisfies CustomerReviewsListMyReviewsRequest;

  try {
    const data = await api.customerReviewsListMyReviews(body);
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
| **cursor** | `string` | Pagination cursor | [Optional] [Defaults to `undefined`] |
| **limit** | `number` | Page size (max 100) | [Optional] [Defaults to `20`] |
| **status** | `PENDING`, `APPROVED`, `REJECTED`, `FLAGGED`, `HIDDEN` | Filter by review status | [Optional] [Defaults to `undefined`] [Enum: PENDING, APPROVED, REJECTED, FLAGGED, HIDDEN] |
| **productId** | `string` | Filter by product ID | [Optional] [Defaults to `undefined`] |
| **userId** | `string` | Filter by user ID (ignored for /me endpoint) | [Optional] [Defaults to `undefined`] |

### Return type

[**PaginatedReviewsDto**](PaginatedReviewsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Paginated list of my reviews |  -  |
| **400** | Invalid query parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

