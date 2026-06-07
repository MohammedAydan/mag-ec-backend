# mag_api_client.api.CommerceSupportAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**commerceSupportAdminListActiveCarts**](CommerceSupportAdminApi.md#commercesupportadminlistactivecarts) | **GET** /api/v1/support/admin/carts | List active carts for support review
[**commerceSupportAdminListWishlists**](CommerceSupportAdminApi.md#commercesupportadminlistwishlists) | **GET** /api/v1/support/admin/wishlists | List active wishlists for support review


# **commerceSupportAdminListActiveCarts**
> BuiltList<CartResponseDto> commerceSupportAdminListActiveCarts()

List active carts for support review

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCommerceSupportAdminApi();

try {
    final response = api.commerceSupportAdminListActiveCarts();
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommerceSupportAdminApi->commerceSupportAdminListActiveCarts: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;CartResponseDto&gt;**](CartResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **commerceSupportAdminListWishlists**
> BuiltList<WishlistResponseDto> commerceSupportAdminListWishlists()

List active wishlists for support review

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCommerceSupportAdminApi();

try {
    final response = api.commerceSupportAdminListWishlists();
    print(response);
} on DioException catch (e) {
    print('Exception when calling CommerceSupportAdminApi->commerceSupportAdminListWishlists: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;WishlistResponseDto&gt;**](WishlistResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

