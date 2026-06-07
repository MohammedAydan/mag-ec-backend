# mag_api_client.api.PricingPublicApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**pricingPublicPreviewCheckout**](PricingPublicApi.md#pricingpublicpreviewcheckout) | **POST** /api/v1/pricing/checkout/preview | Preview checkout pricing, taxes, shipping, and promotions


# **pricingPublicPreviewCheckout**
> PricingPreviewResponseDto pricingPublicPreviewCheckout(checkoutPreviewDto)

Preview checkout pricing, taxes, shipping, and promotions

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPricingPublicApi();
final CheckoutPreviewDto checkoutPreviewDto = ; // CheckoutPreviewDto | 

try {
    final response = api.pricingPublicPreviewCheckout(checkoutPreviewDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PricingPublicApi->pricingPublicPreviewCheckout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **checkoutPreviewDto** | [**CheckoutPreviewDto**](CheckoutPreviewDto.md)|  | 

### Return type

[**PricingPreviewResponseDto**](PricingPreviewResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

