# mag_api_client.api.WishlistApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**wishlistAddItem**](WishlistApi.md#wishlistadditem) | **POST** /api/v1/wishlist/items | Add an item to the wishlist
[**wishlistGetWishlist**](WishlistApi.md#wishlistgetwishlist) | **GET** /api/v1/wishlist | Get the authenticated user wishlist
[**wishlistRemoveItem**](WishlistApi.md#wishlistremoveitem) | **DELETE** /api/v1/wishlist/items/{variantId} | Remove an item from the wishlist


# **wishlistAddItem**
> WishlistResponseDto wishlistAddItem(addWishlistItemDto)

Add an item to the wishlist

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getWishlistApi();
final AddWishlistItemDto addWishlistItemDto = ; // AddWishlistItemDto | 

try {
    final response = api.wishlistAddItem(addWishlistItemDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling WishlistApi->wishlistAddItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addWishlistItemDto** | [**AddWishlistItemDto**](AddWishlistItemDto.md)|  | 

### Return type

[**WishlistResponseDto**](WishlistResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **wishlistGetWishlist**
> WishlistResponseDto wishlistGetWishlist()

Get the authenticated user wishlist

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getWishlistApi();

try {
    final response = api.wishlistGetWishlist();
    print(response);
} on DioException catch (e) {
    print('Exception when calling WishlistApi->wishlistGetWishlist: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**WishlistResponseDto**](WishlistResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **wishlistRemoveItem**
> WishlistResponseDto wishlistRemoveItem(variantId)

Remove an item from the wishlist

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getWishlistApi();
final String variantId = variantId_example; // String | Product variant ID

try {
    final response = api.wishlistRemoveItem(variantId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling WishlistApi->wishlistRemoveItem: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **variantId** | **String**| Product variant ID | 

### Return type

[**WishlistResponseDto**](WishlistResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

