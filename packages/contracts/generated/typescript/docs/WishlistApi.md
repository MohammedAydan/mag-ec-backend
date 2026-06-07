# WishlistApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**wishlistAddItem**](WishlistApi.md#wishlistadditem) | **POST** /api/v1/wishlist/items | Add an item to the wishlist |
| [**wishlistGetWishlist**](WishlistApi.md#wishlistgetwishlist) | **GET** /api/v1/wishlist | Get the authenticated user wishlist |
| [**wishlistRemoveItem**](WishlistApi.md#wishlistremoveitem) | **DELETE** /api/v1/wishlist/items/{variantId} | Remove an item from the wishlist |



## wishlistAddItem

> WishlistResponseDto wishlistAddItem(addWishlistItemDto)

Add an item to the wishlist

### Example

```ts
import {
  Configuration,
  WishlistApi,
} from '@mag/generated-api-client';
import type { WishlistAddItemRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new WishlistApi(config);

  const body = {
    // AddWishlistItemDto
    addWishlistItemDto: ...,
  } satisfies WishlistAddItemRequest;

  try {
    const data = await api.wishlistAddItem(body);
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
| **addWishlistItemDto** | [AddWishlistItemDto](AddWishlistItemDto.md) |  | |

### Return type

[**WishlistResponseDto**](WishlistResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Item added to wishlist |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## wishlistGetWishlist

> WishlistResponseDto wishlistGetWishlist()

Get the authenticated user wishlist

### Example

```ts
import {
  Configuration,
  WishlistApi,
} from '@mag/generated-api-client';
import type { WishlistGetWishlistRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new WishlistApi(config);

  try {
    const data = await api.wishlistGetWishlist();
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

[**WishlistResponseDto**](WishlistResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | User wishlist |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## wishlistRemoveItem

> WishlistResponseDto wishlistRemoveItem(variantId)

Remove an item from the wishlist

### Example

```ts
import {
  Configuration,
  WishlistApi,
} from '@mag/generated-api-client';
import type { WishlistRemoveItemRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new WishlistApi(config);

  const body = {
    // string | Product variant ID
    variantId: variantId_example,
  } satisfies WishlistRemoveItemRequest;

  try {
    const data = await api.wishlistRemoveItem(body);
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
| **variantId** | `string` | Product variant ID | [Defaults to `undefined`] |

### Return type

[**WishlistResponseDto**](WishlistResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Item removed from wishlist |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Customer-only resource; admin/staff tokens are rejected |  -  |
| **404** | Wishlist item not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

