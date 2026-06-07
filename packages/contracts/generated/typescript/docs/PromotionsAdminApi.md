# PromotionsAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**promotionsAdminGetPromotion**](PromotionsAdminApi.md#promotionsadmingetpromotion) | **GET** /api/v1/promotions/admin/{promotionId} | Get a single promotion by ID |
| [**promotionsAdminListPromotions**](PromotionsAdminApi.md#promotionsadminlistpromotions) | **GET** /api/v1/promotions/admin | List all promotions |
| [**promotionsAdminUpsertCoupon**](PromotionsAdminApi.md#promotionsadminupsertcoupon) | **PUT** /api/v1/promotions/admin/{promotionId}/coupons/{code} | Create or update a coupon for a promotion |
| [**promotionsAdminUpsertPromotion**](PromotionsAdminApi.md#promotionsadminupsertpromotion) | **PUT** /api/v1/promotions/admin/by-key/{promotionKey} | Create or update a promotion by key |



## promotionsAdminGetPromotion

> PromotionResponseDto promotionsAdminGetPromotion(promotionId)

Get a single promotion by ID

### Example

```ts
import {
  Configuration,
  PromotionsAdminApi,
} from '@mag/generated-api-client';
import type { PromotionsAdminGetPromotionRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PromotionsAdminApi(config);

  const body = {
    // string | Promotion ID
    promotionId: promotionId_example,
  } satisfies PromotionsAdminGetPromotionRequest;

  try {
    const data = await api.promotionsAdminGetPromotion(body);
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
| **promotionId** | `string` | Promotion ID | [Defaults to `undefined`] |

### Return type

[**PromotionResponseDto**](PromotionResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Promotion details |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Promotion not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## promotionsAdminListPromotions

> Array&lt;PromotionResponseDto&gt; promotionsAdminListPromotions()

List all promotions

### Example

```ts
import {
  Configuration,
  PromotionsAdminApi,
} from '@mag/generated-api-client';
import type { PromotionsAdminListPromotionsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PromotionsAdminApi(config);

  try {
    const data = await api.promotionsAdminListPromotions();
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

[**Array&lt;PromotionResponseDto&gt;**](PromotionResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | All promotions |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## promotionsAdminUpsertCoupon

> CouponResponseDto promotionsAdminUpsertCoupon(promotionId, code, upsertCouponDto)

Create or update a coupon for a promotion

### Example

```ts
import {
  Configuration,
  PromotionsAdminApi,
} from '@mag/generated-api-client';
import type { PromotionsAdminUpsertCouponRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PromotionsAdminApi(config);

  const body = {
    // string | Promotion ID
    promotionId: promotionId_example,
    // string | Coupon code
    code: code_example,
    // UpsertCouponDto
    upsertCouponDto: ...,
  } satisfies PromotionsAdminUpsertCouponRequest;

  try {
    const data = await api.promotionsAdminUpsertCoupon(body);
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
| **promotionId** | `string` | Promotion ID | [Defaults to `undefined`] |
| **code** | `string` | Coupon code | [Defaults to `undefined`] |
| **upsertCouponDto** | [UpsertCouponDto](UpsertCouponDto.md) |  | |

### Return type

[**CouponResponseDto**](CouponResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Coupon created or updated |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Promotion not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## promotionsAdminUpsertPromotion

> PromotionResponseDto promotionsAdminUpsertPromotion(promotionKey, upsertPromotionDto)

Create or update a promotion by key

### Example

```ts
import {
  Configuration,
  PromotionsAdminApi,
} from '@mag/generated-api-client';
import type { PromotionsAdminUpsertPromotionRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PromotionsAdminApi(config);

  const body = {
    // string | Unique promotion key
    promotionKey: promotionKey_example,
    // UpsertPromotionDto
    upsertPromotionDto: ...,
  } satisfies PromotionsAdminUpsertPromotionRequest;

  try {
    const data = await api.promotionsAdminUpsertPromotion(body);
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
| **promotionKey** | `string` | Unique promotion key | [Defaults to `undefined`] |
| **upsertPromotionDto** | [UpsertPromotionDto](UpsertPromotionDto.md) |  | |

### Return type

[**PromotionResponseDto**](PromotionResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Promotion created or updated |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

