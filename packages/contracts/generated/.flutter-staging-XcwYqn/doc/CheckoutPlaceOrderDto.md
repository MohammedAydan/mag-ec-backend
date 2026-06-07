# mag_api_client.model.CheckoutPlaceOrderDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**cartId** | **String** | Cart ID to place the order from | 
**currencyCode** | **String** | ISO 4217 currency code | 
**countryCode** | **String** | ISO 3166-1 alpha-2 country code | 
**customerEmail** | **String** | Customer email address | 
**shippingMethodKey** | **String** | Selected shipping-method key | 
**paymentMethod** | **String** | Payment method | 
**shippingAddress** | [**CheckoutAddressDto**](CheckoutAddressDto.md) | Shipping destination address | 
**customerLocale** | **String** | Customer locale | [optional] 
**reservationKey** | **String** | Reservation key from a prior /checkout/reserve call | [optional] 
**billingAddress** | [**CheckoutAddressDto**](CheckoutAddressDto.md) | Billing address (if different from shipping) | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


