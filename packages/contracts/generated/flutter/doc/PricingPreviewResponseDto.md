# mag_api_client.model.PricingPreviewResponseDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**currencyCode** | **String** |  | 
**countryCode** | **String** |  | 
**subtotalAmount** | **num** |  | 
**subtotalDiscountAmount** | **num** |  | 
**discountedSubtotalAmount** | **num** |  | 
**taxAmount** | **num** |  | 
**grandTotalExcludingShippingAmount** | **num** |  | 
**items** | [**BuiltList&lt;PricingPreviewLineItemDto&gt;**](PricingPreviewLineItemDto.md) |  | 
**appliedPromotions** | [**BuiltList&lt;PricingPreviewAppliedPromotionDto&gt;**](PricingPreviewAppliedPromotionDto.md) |  | 
**rejectedPromotions** | **BuiltList&lt;String&gt;** |  | 
**shippingMethods** | [**BuiltList&lt;PricingPreviewShippingMethodDto&gt;**](PricingPreviewShippingMethodDto.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


