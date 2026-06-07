# CommerceSupportAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**commerceSupportAdminListActiveCarts**](CommerceSupportAdminApi.md#commercesupportadminlistactivecarts) | **GET** /api/v1/support/admin/carts | List active carts for support review |
| [**commerceSupportAdminListWishlists**](CommerceSupportAdminApi.md#commercesupportadminlistwishlists) | **GET** /api/v1/support/admin/wishlists | List active wishlists for support review |



## commerceSupportAdminListActiveCarts

> Array&lt;CartResponseDto&gt; commerceSupportAdminListActiveCarts()

List active carts for support review

### Example

```ts
import {
  Configuration,
  CommerceSupportAdminApi,
} from '@mag/generated-api-client';
import type { CommerceSupportAdminListActiveCartsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CommerceSupportAdminApi(config);

  try {
    const data = await api.commerceSupportAdminListActiveCarts();
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

[**Array&lt;CartResponseDto&gt;**](CartResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Active carts (support view) |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## commerceSupportAdminListWishlists

> Array&lt;WishlistResponseDto&gt; commerceSupportAdminListWishlists()

List active wishlists for support review

### Example

```ts
import {
  Configuration,
  CommerceSupportAdminApi,
} from '@mag/generated-api-client';
import type { CommerceSupportAdminListWishlistsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CommerceSupportAdminApi(config);

  try {
    const data = await api.commerceSupportAdminListWishlists();
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

[**Array&lt;WishlistResponseDto&gt;**](WishlistResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Active wishlists (support view) |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

