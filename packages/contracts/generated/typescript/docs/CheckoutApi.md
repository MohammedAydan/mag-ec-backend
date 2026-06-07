# CheckoutApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**checkoutPlaceOrder**](CheckoutApi.md#checkoutplaceorder) | **POST** /api/v1/checkout/place | Place an order from cart |
| [**checkoutPreviewCheckout**](CheckoutApi.md#checkoutpreviewcheckout) | **POST** /api/v1/checkout/preview | Preview checkout costs before placing an order |
| [**checkoutReserveCheckoutPreview**](CheckoutApi.md#checkoutreservecheckoutpreview) | **POST** /api/v1/checkout/reserve | Reserve stock and preview checkout (authenticated customer only) |



## checkoutPlaceOrder

> CheckoutPlaceOrderResponseDto checkoutPlaceOrder(idempotencyKey, checkoutPlaceOrderDto, xGuestCartToken, authorization)

Place an order from cart

### Example

```ts
import {
  Configuration,
  CheckoutApi,
} from '@mag/generated-api-client';
import type { CheckoutPlaceOrderRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new CheckoutApi();

  const body = {
    // string | Client-generated idempotency key for duplicate-submit protection (max 128 chars, alphanumeric, dashes, and underscores).
    idempotencyKey: idempotencyKey_example,
    // CheckoutPlaceOrderDto
    checkoutPlaceOrderDto: ...,
    // string | Guest cart bearer token for guest-owned cart access. (optional)
    xGuestCartToken: xGuestCartToken_example,
    // string | Optional Bearer JWT for authenticated placement or guest checkout attribution. (optional)
    authorization: authorization_example,
  } satisfies CheckoutPlaceOrderRequest;

  try {
    const data = await api.checkoutPlaceOrder(body);
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
| **idempotencyKey** | `string` | Client-generated idempotency key for duplicate-submit protection (max 128 chars, alphanumeric, dashes, and underscores). | [Defaults to `undefined`] |
| **checkoutPlaceOrderDto** | [CheckoutPlaceOrderDto](CheckoutPlaceOrderDto.md) |  | |
| **xGuestCartToken** | `string` | Guest cart bearer token for guest-owned cart access. | [Optional] [Defaults to `undefined`] |
| **authorization** | `string` | Optional Bearer JWT for authenticated placement or guest checkout attribution. | [Optional] [Defaults to `undefined`] |

### Return type

[**CheckoutPlaceOrderResponseDto**](CheckoutPlaceOrderResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Order placed successfully |  -  |
| **400** | Invalid request body or parameters |  -  |
| **404** | Cart not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## checkoutPreviewCheckout

> CheckoutPreviewResponseDto checkoutPreviewCheckout(checkoutCartPreviewDto, xGuestCartToken, authorization)

Preview checkout costs before placing an order

### Example

```ts
import {
  Configuration,
  CheckoutApi,
} from '@mag/generated-api-client';
import type { CheckoutPreviewCheckoutRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new CheckoutApi();

  const body = {
    // CheckoutCartPreviewDto
    checkoutCartPreviewDto: ...,
    // string | Guest cart bearer token for guest-owned cart access. (optional)
    xGuestCartToken: xGuestCartToken_example,
    // string | Optional Bearer JWT for authenticated checkout preview. (optional)
    authorization: authorization_example,
  } satisfies CheckoutPreviewCheckoutRequest;

  try {
    const data = await api.checkoutPreviewCheckout(body);
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
| **checkoutCartPreviewDto** | [CheckoutCartPreviewDto](CheckoutCartPreviewDto.md) |  | |
| **xGuestCartToken** | `string` | Guest cart bearer token for guest-owned cart access. | [Optional] [Defaults to `undefined`] |
| **authorization** | `string` | Optional Bearer JWT for authenticated checkout preview. | [Optional] [Defaults to `undefined`] |

### Return type

[**CheckoutPreviewResponseDto**](CheckoutPreviewResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Checkout preview with pricing, tax, and shipping breakdown |  -  |
| **400** | Invalid request body or parameters |  -  |
| **404** | Cart not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## checkoutReserveCheckoutPreview

> CheckoutPreviewResponseDto checkoutReserveCheckoutPreview(checkoutCartPreviewDto)

Reserve stock and preview checkout (authenticated customer only)

### Example

```ts
import {
  Configuration,
  CheckoutApi,
} from '@mag/generated-api-client';
import type { CheckoutReserveCheckoutPreviewRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CheckoutApi(config);

  const body = {
    // CheckoutCartPreviewDto
    checkoutCartPreviewDto: ...,
  } satisfies CheckoutReserveCheckoutPreviewRequest;

  try {
    const data = await api.checkoutReserveCheckoutPreview(body);
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
| **checkoutCartPreviewDto** | [CheckoutCartPreviewDto](CheckoutCartPreviewDto.md) |  | |

### Return type

[**CheckoutPreviewResponseDto**](CheckoutPreviewResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Checkout preview with stock reservations confirmed |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |
| **404** | Cart not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

