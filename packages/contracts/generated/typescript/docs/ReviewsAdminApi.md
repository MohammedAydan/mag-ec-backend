# ReviewsAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**adminReviewsGetReview**](ReviewsAdminApi.md#adminreviewsgetreview) | **GET** /api/v1/reviews/admin/{reviewId} | Get a single review by ID |
| [**adminReviewsListReviews**](ReviewsAdminApi.md#adminreviewslistreviews) | **GET** /api/v1/reviews/admin | List all reviews with pagination and filters |
| [**adminReviewsModerateReview**](ReviewsAdminApi.md#adminreviewsmoderatereview) | **PATCH** /api/v1/reviews/admin/{reviewId}/moderate | Moderate a review (approve, reject, flag, or hide) |



## adminReviewsGetReview

> ReviewResponseDto adminReviewsGetReview(reviewId)

Get a single review by ID

### Example

```ts
import {
  Configuration,
  ReviewsAdminApi,
} from '@mag/generated-api-client';
import type { AdminReviewsGetReviewRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReviewsAdminApi(config);

  const body = {
    // string | Review ID
    reviewId: reviewId_example,
  } satisfies AdminReviewsGetReviewRequest;

  try {
    const data = await api.adminReviewsGetReview(body);
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
| **403** | Insufficient permissions |  -  |
| **404** | Review not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminReviewsListReviews

> PaginatedReviewsDto adminReviewsListReviews(cursor, limit, status, productId, userId)

List all reviews with pagination and filters

### Example

```ts
import {
  Configuration,
  ReviewsAdminApi,
} from '@mag/generated-api-client';
import type { AdminReviewsListReviewsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReviewsAdminApi(config);

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
  } satisfies AdminReviewsListReviewsRequest;

  try {
    const data = await api.adminReviewsListReviews(body);
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
| **200** | Paginated list of reviews |  -  |
| **400** | Invalid query parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminReviewsModerateReview

> ReviewResponseDto adminReviewsModerateReview(reviewId, reviewModerationDto)

Moderate a review (approve, reject, flag, or hide)

### Example

```ts
import {
  Configuration,
  ReviewsAdminApi,
} from '@mag/generated-api-client';
import type { AdminReviewsModerateReviewRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReviewsAdminApi(config);

  const body = {
    // string | Review ID
    reviewId: reviewId_example,
    // ReviewModerationDto
    reviewModerationDto: ...,
  } satisfies AdminReviewsModerateReviewRequest;

  try {
    const data = await api.adminReviewsModerateReview(body);
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
| **reviewModerationDto** | [ReviewModerationDto](ReviewModerationDto.md) |  | |

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
| **200** | Review moderation result |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Review not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

