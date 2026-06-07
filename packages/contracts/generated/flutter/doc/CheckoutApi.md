# mag_api_client.api.CheckoutApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkoutPlaceOrder**](CheckoutApi.md#checkoutplaceorder) | **POST** /api/v1/checkout/place | Place an order from cart
[**checkoutPreviewCheckout**](CheckoutApi.md#checkoutpreviewcheckout) | **POST** /api/v1/checkout/preview | Preview checkout costs before placing an order
[**checkoutReserveCheckoutPreview**](CheckoutApi.md#checkoutreservecheckoutpreview) | **POST** /api/v1/checkout/reserve | Reserve stock and preview checkout (authenticated customer only)


# **checkoutPlaceOrder**
> CheckoutPlaceOrderResponseDto checkoutPlaceOrder(checkoutPlaceOrderDto, idempotencyKey, xGuestCartToken, authorization)

Place an order from cart

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCheckoutApi();
final CheckoutPlaceOrderDto checkoutPlaceOrderDto = ; // CheckoutPlaceOrderDto | 
final String idempotencyKey = idempotencyKey_example; // String | Client-generated idempotency key for duplicate-submit protection (max 128 chars, alphanumeric, dashes, and underscores).
final String xGuestCartToken = xGuestCartToken_example; // String | Guest cart bearer token for guest-owned cart access.
final String authorization = authorization_example; // String | Optional Bearer JWT for authenticated placement or guest checkout attribution.

try {
    final response = api.checkoutPlaceOrder(checkoutPlaceOrderDto, idempotencyKey, xGuestCartToken, authorization);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CheckoutApi->checkoutPlaceOrder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **checkoutPlaceOrderDto** | [**CheckoutPlaceOrderDto**](CheckoutPlaceOrderDto.md)|  | 
 **idempotencyKey** | **String**| Client-generated idempotency key for duplicate-submit protection (max 128 chars, alphanumeric, dashes, and underscores). | 
 **xGuestCartToken** | **String**| Guest cart bearer token for guest-owned cart access. | [optional] 
 **authorization** | **String**| Optional Bearer JWT for authenticated placement or guest checkout attribution. | [optional] 

### Return type

[**CheckoutPlaceOrderResponseDto**](CheckoutPlaceOrderResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkoutPreviewCheckout**
> CheckoutPreviewResponseDto checkoutPreviewCheckout(checkoutCartPreviewDto, xGuestCartToken, authorization)

Preview checkout costs before placing an order

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCheckoutApi();
final CheckoutCartPreviewDto checkoutCartPreviewDto = ; // CheckoutCartPreviewDto | 
final String xGuestCartToken = xGuestCartToken_example; // String | Guest cart bearer token for guest-owned cart access.
final String authorization = authorization_example; // String | Optional Bearer JWT for authenticated checkout preview.

try {
    final response = api.checkoutPreviewCheckout(checkoutCartPreviewDto, xGuestCartToken, authorization);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CheckoutApi->checkoutPreviewCheckout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **checkoutCartPreviewDto** | [**CheckoutCartPreviewDto**](CheckoutCartPreviewDto.md)|  | 
 **xGuestCartToken** | **String**| Guest cart bearer token for guest-owned cart access. | [optional] 
 **authorization** | **String**| Optional Bearer JWT for authenticated checkout preview. | [optional] 

### Return type

[**CheckoutPreviewResponseDto**](CheckoutPreviewResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkoutReserveCheckoutPreview**
> CheckoutPreviewResponseDto checkoutReserveCheckoutPreview(checkoutCartPreviewDto)

Reserve stock and preview checkout (authenticated customer only)

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCheckoutApi();
final CheckoutCartPreviewDto checkoutCartPreviewDto = ; // CheckoutCartPreviewDto | 

try {
    final response = api.checkoutReserveCheckoutPreview(checkoutCartPreviewDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CheckoutApi->checkoutReserveCheckoutPreview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **checkoutCartPreviewDto** | [**CheckoutCartPreviewDto**](CheckoutCartPreviewDto.md)|  | 

### Return type

[**CheckoutPreviewResponseDto**](CheckoutPreviewResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

