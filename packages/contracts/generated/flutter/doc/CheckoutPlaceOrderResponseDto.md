# mag_api_client.model.CheckoutPlaceOrderResponseDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**orderNumber** | **String** |  | 
**cartId** | **String** |  | 
**status** | **String** |  | 
**paymentMethod** | **String** |  | 
**paymentStatus** | **String** |  | 
**fulfillmentStatus** | **String** |  | 
**customerEmail** | **String** |  | 
**customerName** | **String** |  | 
**customerPhone** | **String** |  | 
**currencyCode** | **String** |  | 
**countryCode** | **String** |  | 
**shippingMethod** | [**OrderShippingMethodDetailsDto**](OrderShippingMethodDetailsDto.md) |  | 
**subtotalAmount** | **num** |  | 
**subtotalDiscountAmount** | **num** |  | 
**discountedSubtotalAmount** | **num** |  | 
**shippingAmount** | **num** |  | 
**taxAmount** | **num** |  | 
**grandTotalAmount** | **num** |  | 
**placedAt** | **String** |  | 
**createdAt** | **String** |  | 
**updatedAt** | **String** |  | 
**addresses** | [**BuiltList&lt;OrderAddressDto&gt;**](OrderAddressDto.md) |  | 
**items** | [**BuiltList&lt;OrderLineItemDto&gt;**](OrderLineItemDto.md) |  | 
**appliedPromotions** | [**BuiltList&lt;OrderAppliedPromotionDto&gt;**](OrderAppliedPromotionDto.md) |  | 
**shipments** | [**BuiltList&lt;OrderShipmentDto&gt;**](OrderShipmentDto.md) |  | 
**returnRequests** | [**BuiltList&lt;OrderReturnRequestDto&gt;**](OrderReturnRequestDto.md) |  | 
**refunds** | [**BuiltList&lt;OrderRefundDto&gt;**](OrderRefundDto.md) |  | 
**userId** | **String** |  | [optional] 
**couponCode** | **String** |  | [optional] 
**paidAt** | **String** |  | [optional] 
**payment** | [**CheckoutPaymentAttemptDto**](CheckoutPaymentAttemptDto.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


