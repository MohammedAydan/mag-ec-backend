# mag_api_client.model.CheckoutPreviewResponseDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**cartId** | **String** |  | 
**paymentReadiness** | [**CheckoutPaymentReadinessDto**](CheckoutPaymentReadinessDto.md) |  | 
**currencyCode** | **String** |  | 
**countryCode** | **String** |  | 
**subtotalAmount** | **num** |  | 
**subtotalDiscountAmount** | **num** |  | 
**discountedSubtotalAmount** | **num** |  | 
**taxAmount** | **num** |  | 
**grandTotalExcludingShippingAmount** | **num** |  | 
**appliedPromotions** | [**BuiltList&lt;CheckoutPreviewAppliedPromotionDto&gt;**](CheckoutPreviewAppliedPromotionDto.md) |  | 
**rejectedPromotions** | **BuiltList&lt;String&gt;** |  | 
**items** | [**BuiltList&lt;CheckoutPreviewItemResponseDto&gt;**](CheckoutPreviewItemResponseDto.md) |  | 
**shippingMethods** | [**BuiltList&lt;CheckoutPreviewShippingMethodDto&gt;**](CheckoutPreviewShippingMethodDto.md) |  | 
**reservationKey** | **String** |  | [optional] 
**reservationExpiresAt** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


