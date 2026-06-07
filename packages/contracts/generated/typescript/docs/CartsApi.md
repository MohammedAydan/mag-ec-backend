# CartsApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**cartAddItem**](CartsApi.md#cartadditem) | **POST** /api/v1/carts/{id}/items | Add an item to the cart |
| [**cartApplyCoupon**](CartsApi.md#cartapplycoupon) | **POST** /api/v1/carts/{id}/coupon | Apply a coupon to the cart |
| [**cartCreateOrGetCart**](CartsApi.md#cartcreateorgetcart) | **POST** /api/v1/carts | Create or retrieve a shopping cart |
| [**cartGetCart**](CartsApi.md#cartgetcart) | **GET** /api/v1/carts/{id} | Get cart by ID |
| [**cartMergeGuestCart**](CartsApi.md#cartmergeguestcart) | **POST** /api/v1/carts/merge | Merge guest cart into authenticated user cart |
| [**cartRemoveCoupon**](CartsApi.md#cartremovecoupon) | **DELETE** /api/v1/carts/{id}/coupon | Remove coupon from the cart |
| [**cartRemoveItem**](CartsApi.md#cartremoveitem) | **DELETE** /api/v1/carts/{id}/items/{variantId} | Remove an item from the cart |
| [**cartUpdateItemQuantity**](CartsApi.md#cartupdateitemquantity) | **PATCH** /api/v1/carts/{id}/items/{variantId} | Update cart item quantity |



## cartAddItem

> CartResponseDto cartAddItem(id, addCartItemDto, xGuestCartToken, authorization)

Add an item to the cart

### Example

```ts
import {
  Configuration,
  CartsApi,
} from '@mag/generated-api-client';
import type { CartAddItemRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new CartsApi();

  const body = {
    // string | Cart ID
    id: id_example,
    // AddCartItemDto
    addCartItemDto: ...,
    // string | Guest cart bearer token for guest-owned cart access. (optional)
    xGuestCartToken: xGuestCartToken_example,
    // string | Optional Bearer JWT for authenticated cart access. (optional)
    authorization: authorization_example,
  } satisfies CartAddItemRequest;

  try {
    const data = await api.cartAddItem(body);
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
| **id** | `string` | Cart ID | [Defaults to `undefined`] |
| **addCartItemDto** | [AddCartItemDto](AddCartItemDto.md) |  | |
| **xGuestCartToken** | `string` | Guest cart bearer token for guest-owned cart access. | [Optional] [Defaults to `undefined`] |
| **authorization** | `string` | Optional Bearer JWT for authenticated cart access. | [Optional] [Defaults to `undefined`] |

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Item added to cart |  -  |
| **400** | Invalid request body or parameters |  -  |
| **404** | Cart not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## cartApplyCoupon

> CartResponseDto cartApplyCoupon(id, applyCouponDto, xGuestCartToken, authorization)

Apply a coupon to the cart

### Example

```ts
import {
  Configuration,
  CartsApi,
} from '@mag/generated-api-client';
import type { CartApplyCouponRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new CartsApi();

  const body = {
    // string | Cart ID
    id: id_example,
    // ApplyCouponDto
    applyCouponDto: ...,
    // string | Guest cart bearer token for guest-owned cart access. (optional)
    xGuestCartToken: xGuestCartToken_example,
    // string | Optional Bearer JWT for authenticated cart access. (optional)
    authorization: authorization_example,
  } satisfies CartApplyCouponRequest;

  try {
    const data = await api.cartApplyCoupon(body);
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
| **id** | `string` | Cart ID | [Defaults to `undefined`] |
| **applyCouponDto** | [ApplyCouponDto](ApplyCouponDto.md) |  | |
| **xGuestCartToken** | `string` | Guest cart bearer token for guest-owned cart access. | [Optional] [Defaults to `undefined`] |
| **authorization** | `string` | Optional Bearer JWT for authenticated cart access. | [Optional] [Defaults to `undefined`] |

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Coupon applied |  -  |
| **400** | Invalid request body or parameters |  -  |
| **404** | Cart not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## cartCreateOrGetCart

> CartResponseDto cartCreateOrGetCart(createCartDto, xGuestCartToken, authorization)

Create or retrieve a shopping cart

### Example

```ts
import {
  Configuration,
  CartsApi,
} from '@mag/generated-api-client';
import type { CartCreateOrGetCartRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new CartsApi();

  const body = {
    // CreateCartDto
    createCartDto: ...,
    // string | Guest cart bearer token for guest-owned cart access. (optional)
    xGuestCartToken: xGuestCartToken_example,
    // string | Optional Bearer JWT for authenticated cart access. (optional)
    authorization: authorization_example,
  } satisfies CartCreateOrGetCartRequest;

  try {
    const data = await api.cartCreateOrGetCart(body);
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
| **createCartDto** | [CreateCartDto](CreateCartDto.md) |  | |
| **xGuestCartToken** | `string` | Guest cart bearer token for guest-owned cart access. | [Optional] [Defaults to `undefined`] |
| **authorization** | `string` | Optional Bearer JWT for authenticated cart access. | [Optional] [Defaults to `undefined`] |

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Cart created or retrieved |  -  |
| **400** | Invalid request body or parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## cartGetCart

> CartResponseDto cartGetCart(id, xGuestCartToken, authorization)

Get cart by ID

### Example

```ts
import {
  Configuration,
  CartsApi,
} from '@mag/generated-api-client';
import type { CartGetCartRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new CartsApi();

  const body = {
    // string | Cart ID
    id: id_example,
    // string | Guest cart bearer token for guest-owned cart access. (optional)
    xGuestCartToken: xGuestCartToken_example,
    // string | Optional Bearer JWT for authenticated cart access. (optional)
    authorization: authorization_example,
  } satisfies CartGetCartRequest;

  try {
    const data = await api.cartGetCart(body);
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
| **id** | `string` | Cart ID | [Defaults to `undefined`] |
| **xGuestCartToken** | `string` | Guest cart bearer token for guest-owned cart access. | [Optional] [Defaults to `undefined`] |
| **authorization** | `string` | Optional Bearer JWT for authenticated cart access. | [Optional] [Defaults to `undefined`] |

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Cart details |  -  |
| **404** | Cart not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## cartMergeGuestCart

> CartResponseDto cartMergeGuestCart(mergeCartDto)

Merge guest cart into authenticated user cart

### Example

```ts
import {
  Configuration,
  CartsApi,
} from '@mag/generated-api-client';
import type { CartMergeGuestCartRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CartsApi(config);

  const body = {
    // MergeCartDto
    mergeCartDto: ...,
  } satisfies CartMergeGuestCartRequest;

  try {
    const data = await api.cartMergeGuestCart(body);
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
| **mergeCartDto** | [MergeCartDto](MergeCartDto.md) |  | |

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Guest cart merged into user cart |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## cartRemoveCoupon

> CartResponseDto cartRemoveCoupon(id, xGuestCartToken, authorization)

Remove coupon from the cart

### Example

```ts
import {
  Configuration,
  CartsApi,
} from '@mag/generated-api-client';
import type { CartRemoveCouponRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new CartsApi();

  const body = {
    // string | Cart ID
    id: id_example,
    // string | Guest cart bearer token for guest-owned cart access. (optional)
    xGuestCartToken: xGuestCartToken_example,
    // string | Optional Bearer JWT for authenticated cart access. (optional)
    authorization: authorization_example,
  } satisfies CartRemoveCouponRequest;

  try {
    const data = await api.cartRemoveCoupon(body);
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
| **id** | `string` | Cart ID | [Defaults to `undefined`] |
| **xGuestCartToken** | `string` | Guest cart bearer token for guest-owned cart access. | [Optional] [Defaults to `undefined`] |
| **authorization** | `string` | Optional Bearer JWT for authenticated cart access. | [Optional] [Defaults to `undefined`] |

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Coupon removed |  -  |
| **404** | Cart not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## cartRemoveItem

> CartResponseDto cartRemoveItem(id, variantId, xGuestCartToken, authorization)

Remove an item from the cart

### Example

```ts
import {
  Configuration,
  CartsApi,
} from '@mag/generated-api-client';
import type { CartRemoveItemRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new CartsApi();

  const body = {
    // string | Cart ID
    id: id_example,
    // string | Product variant ID
    variantId: variantId_example,
    // string | Guest cart bearer token for guest-owned cart access. (optional)
    xGuestCartToken: xGuestCartToken_example,
    // string | Optional Bearer JWT for authenticated cart access. (optional)
    authorization: authorization_example,
  } satisfies CartRemoveItemRequest;

  try {
    const data = await api.cartRemoveItem(body);
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
| **id** | `string` | Cart ID | [Defaults to `undefined`] |
| **variantId** | `string` | Product variant ID | [Defaults to `undefined`] |
| **xGuestCartToken** | `string` | Guest cart bearer token for guest-owned cart access. | [Optional] [Defaults to `undefined`] |
| **authorization** | `string` | Optional Bearer JWT for authenticated cart access. | [Optional] [Defaults to `undefined`] |

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Item removed from cart |  -  |
| **404** | Cart or variant not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## cartUpdateItemQuantity

> CartResponseDto cartUpdateItemQuantity(id, variantId, updateCartItemDto, xGuestCartToken, authorization)

Update cart item quantity

### Example

```ts
import {
  Configuration,
  CartsApi,
} from '@mag/generated-api-client';
import type { CartUpdateItemQuantityRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new CartsApi();

  const body = {
    // string | Cart ID
    id: id_example,
    // string | Product variant ID
    variantId: variantId_example,
    // UpdateCartItemDto
    updateCartItemDto: ...,
    // string | Guest cart bearer token for guest-owned cart access. (optional)
    xGuestCartToken: xGuestCartToken_example,
    // string | Optional Bearer JWT for authenticated cart access. (optional)
    authorization: authorization_example,
  } satisfies CartUpdateItemQuantityRequest;

  try {
    const data = await api.cartUpdateItemQuantity(body);
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
| **id** | `string` | Cart ID | [Defaults to `undefined`] |
| **variantId** | `string` | Product variant ID | [Defaults to `undefined`] |
| **updateCartItemDto** | [UpdateCartItemDto](UpdateCartItemDto.md) |  | |
| **xGuestCartToken** | `string` | Guest cart bearer token for guest-owned cart access. | [Optional] [Defaults to `undefined`] |
| **authorization** | `string` | Optional Bearer JWT for authenticated cart access. | [Optional] [Defaults to `undefined`] |

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Item quantity updated |  -  |
| **400** | Invalid request body or parameters |  -  |
| **404** | Cart or variant not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

