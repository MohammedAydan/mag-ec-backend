# mag_api_client.api.CartsApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cartAddItem**](CartsApi.md#cartadditem) | **POST** /api/v1/carts/{id}/items | Add an item to the cart
[**cartApplyCoupon**](CartsApi.md#cartapplycoupon) | **POST** /api/v1/carts/{id}/coupon | Apply a coupon to the cart
[**cartCreateOrGetCart**](CartsApi.md#cartcreateorgetcart) | **POST** /api/v1/carts | Create or retrieve a shopping cart
[**cartGetCart**](CartsApi.md#cartgetcart) | **GET** /api/v1/carts/{id} | Get cart by ID
[**cartMergeGuestCart**](CartsApi.md#cartmergeguestcart) | **POST** /api/v1/carts/merge | Merge guest cart into authenticated user cart
[**cartRemoveCoupon**](CartsApi.md#cartremovecoupon) | **DELETE** /api/v1/carts/{id}/coupon | Remove coupon from the cart
[**cartRemoveItem**](CartsApi.md#cartremoveitem) | **DELETE** /api/v1/carts/{id}/items/{variantId} | Remove an item from the cart
[**cartUpdateItemQuantity**](CartsApi.md#cartupdateitemquantity) | **PATCH** /api/v1/carts/{id}/items/{variantId} | Update cart item quantity


# **cartAddItem**
> CartResponseDto cartAddItem(addCartItemDto, id, xGuestCartToken, authorization)

Add an item to the cart

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCartsApi();
final AddCartItemDto addCartItemDto = ; // AddCartItemDto | 
final String id = id_example; // String | Cart ID
final String xGuestCartToken = xGuestCartToken_example; // String | Guest cart bearer token for guest-owned cart access.
final String authorization = authorization_example; // String | Optional Bearer JWT for authenticated cart access.

try {
    final response = api.cartAddItem(addCartItemDto, id, xGuestCartToken, authorization);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CartsApi->cartAddItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addCartItemDto** | [**AddCartItemDto**](AddCartItemDto.md)|  | 
 **id** | **String**| Cart ID | 
 **xGuestCartToken** | **String**| Guest cart bearer token for guest-owned cart access. | [optional] 
 **authorization** | **String**| Optional Bearer JWT for authenticated cart access. | [optional] 

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cartApplyCoupon**
> CartResponseDto cartApplyCoupon(applyCouponDto, id, xGuestCartToken, authorization)

Apply a coupon to the cart

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCartsApi();
final ApplyCouponDto applyCouponDto = ; // ApplyCouponDto | 
final String id = id_example; // String | Cart ID
final String xGuestCartToken = xGuestCartToken_example; // String | Guest cart bearer token for guest-owned cart access.
final String authorization = authorization_example; // String | Optional Bearer JWT for authenticated cart access.

try {
    final response = api.cartApplyCoupon(applyCouponDto, id, xGuestCartToken, authorization);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CartsApi->cartApplyCoupon: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **applyCouponDto** | [**ApplyCouponDto**](ApplyCouponDto.md)|  | 
 **id** | **String**| Cart ID | 
 **xGuestCartToken** | **String**| Guest cart bearer token for guest-owned cart access. | [optional] 
 **authorization** | **String**| Optional Bearer JWT for authenticated cart access. | [optional] 

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cartCreateOrGetCart**
> CartResponseDto cartCreateOrGetCart(createCartDto, xGuestCartToken, authorization)

Create or retrieve a shopping cart

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCartsApi();
final CreateCartDto createCartDto = ; // CreateCartDto | 
final String xGuestCartToken = xGuestCartToken_example; // String | Guest cart bearer token for guest-owned cart access.
final String authorization = authorization_example; // String | Optional Bearer JWT for authenticated cart access.

try {
    final response = api.cartCreateOrGetCart(createCartDto, xGuestCartToken, authorization);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CartsApi->cartCreateOrGetCart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createCartDto** | [**CreateCartDto**](CreateCartDto.md)|  | 
 **xGuestCartToken** | **String**| Guest cart bearer token for guest-owned cart access. | [optional] 
 **authorization** | **String**| Optional Bearer JWT for authenticated cart access. | [optional] 

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cartGetCart**
> CartResponseDto cartGetCart(id, xGuestCartToken, authorization)

Get cart by ID

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCartsApi();
final String id = id_example; // String | Cart ID
final String xGuestCartToken = xGuestCartToken_example; // String | Guest cart bearer token for guest-owned cart access.
final String authorization = authorization_example; // String | Optional Bearer JWT for authenticated cart access.

try {
    final response = api.cartGetCart(id, xGuestCartToken, authorization);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CartsApi->cartGetCart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Cart ID | 
 **xGuestCartToken** | **String**| Guest cart bearer token for guest-owned cart access. | [optional] 
 **authorization** | **String**| Optional Bearer JWT for authenticated cart access. | [optional] 

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cartMergeGuestCart**
> CartResponseDto cartMergeGuestCart(mergeCartDto)

Merge guest cart into authenticated user cart

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCartsApi();
final MergeCartDto mergeCartDto = ; // MergeCartDto | 

try {
    final response = api.cartMergeGuestCart(mergeCartDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CartsApi->cartMergeGuestCart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mergeCartDto** | [**MergeCartDto**](MergeCartDto.md)|  | 

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cartRemoveCoupon**
> CartResponseDto cartRemoveCoupon(id, xGuestCartToken, authorization)

Remove coupon from the cart

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCartsApi();
final String id = id_example; // String | Cart ID
final String xGuestCartToken = xGuestCartToken_example; // String | Guest cart bearer token for guest-owned cart access.
final String authorization = authorization_example; // String | Optional Bearer JWT for authenticated cart access.

try {
    final response = api.cartRemoveCoupon(id, xGuestCartToken, authorization);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CartsApi->cartRemoveCoupon: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Cart ID | 
 **xGuestCartToken** | **String**| Guest cart bearer token for guest-owned cart access. | [optional] 
 **authorization** | **String**| Optional Bearer JWT for authenticated cart access. | [optional] 

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cartRemoveItem**
> CartResponseDto cartRemoveItem(id, variantId, xGuestCartToken, authorization)

Remove an item from the cart

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCartsApi();
final String id = id_example; // String | Cart ID
final String variantId = variantId_example; // String | Product variant ID
final String xGuestCartToken = xGuestCartToken_example; // String | Guest cart bearer token for guest-owned cart access.
final String authorization = authorization_example; // String | Optional Bearer JWT for authenticated cart access.

try {
    final response = api.cartRemoveItem(id, variantId, xGuestCartToken, authorization);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CartsApi->cartRemoveItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Cart ID | 
 **variantId** | **String**| Product variant ID | 
 **xGuestCartToken** | **String**| Guest cart bearer token for guest-owned cart access. | [optional] 
 **authorization** | **String**| Optional Bearer JWT for authenticated cart access. | [optional] 

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cartUpdateItemQuantity**
> CartResponseDto cartUpdateItemQuantity(updateCartItemDto, id, variantId, xGuestCartToken, authorization)

Update cart item quantity

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCartsApi();
final UpdateCartItemDto updateCartItemDto = ; // UpdateCartItemDto | 
final String id = id_example; // String | Cart ID
final String variantId = variantId_example; // String | Product variant ID
final String xGuestCartToken = xGuestCartToken_example; // String | Guest cart bearer token for guest-owned cart access.
final String authorization = authorization_example; // String | Optional Bearer JWT for authenticated cart access.

try {
    final response = api.cartUpdateItemQuantity(updateCartItemDto, id, variantId, xGuestCartToken, authorization);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CartsApi->cartUpdateItemQuantity: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateCartItemDto** | [**UpdateCartItemDto**](UpdateCartItemDto.md)|  | 
 **id** | **String**| Cart ID | 
 **variantId** | **String**| Product variant ID | 
 **xGuestCartToken** | **String**| Guest cart bearer token for guest-owned cart access. | [optional] 
 **authorization** | **String**| Optional Bearer JWT for authenticated cart access. | [optional] 

### Return type

[**CartResponseDto**](CartResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

