# mag_api_client.model.CheckoutPreviewDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**currencyCode** | **String** | ISO 4217 currency code (e.g. USD) | 
**countryCode** | **String** | ISO 3166-1 alpha-2 country code for tax and shipping | 
**items** | [**BuiltList&lt;CheckoutPreviewItemDto&gt;**](CheckoutPreviewItemDto.md) | Line items to include in the preview | 
**customerLocale** | **String** | Locale for translated output (e.g. en-US) | [optional] 
**customerId** | **String** | Customer identifier for personalised pricing | [optional] 
**couponCodes** | **BuiltList&lt;String&gt;** | Coupon codes to apply during preview | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


