# mag_api_client.model.UpsertVariantPriceDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**currencyCode** | **String** | ISO 4217 currency code for this price | 
**baseAmount** | **num** | Base price in minor currency units | 
**saleAmount** | **num** | Optional sale price in minor currency units | [optional] 
**saleStartsAt** | [**DateTime**](DateTime.md) | Sale start date-time | [optional] 
**saleEndsAt** | [**DateTime**](DateTime.md) | Sale end date-time | [optional] 
**taxClassId** | **String** | Tax class identifier for this price entry | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


