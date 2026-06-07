# mag_api_client.model.UpsertShippingMethodDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Display name of the shipping method | 
**rateType** | **String** | Rate calculation type: FLAT or PERCENTAGE_OF_SUBTOTAL | 
**currencyCode** | **String** | ISO 4217 currency code for shipping charges | 
**isActive** | **bool** | Whether this method is available at checkout | [optional] 
**flatAmount** | **num** | Flat shipping amount in minor currency units | [optional] 
**percentageBps** | **num** | Percentage rate in basis points (e.g. 500 = 5.00%) | [optional] 
**minSubtotalAmount** | **num** | Minimum subtotal required for this method | [optional] 
**maxSubtotalAmount** | **num** | Maximum subtotal allowed for this method | [optional] 
**minItemQuantity** | **num** | Minimum item quantity required | [optional] 
**maxItemQuantity** | **num** | Maximum item quantity allowed | [optional] 
**estimatedMinDays** | **num** | Estimated minimum delivery days | [optional] 
**estimatedMaxDays** | **num** | Estimated maximum delivery days | [optional] 
**sortOrder** | **num** | Sort order for display purposes | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


