# mag_api_client.model.UpsertPromotionDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Human-readable promotion name | 
**status** | **String** | Promotion status | 
**trigger** | **String** | How the promotion is triggered | 
**rewardType** | **String** | Type of discount reward | 
**description** | **String** | Promotion description | [optional] 
**currencyCode** | **String** | ISO 4217 currency code | [optional] 
**fixedAmount** | **num** | Fixed discount amount in minor units | [optional] 
**percentageBps** | **num** | Percentage discount in basis points (e.g. 1000 = 10%) | [optional] 
**maxDiscountAmount** | **num** | Maximum discount amount in minor units | [optional] 
**minSubtotalAmount** | **num** | Minimum subtotal required in minor units | [optional] 
**isCombinable** | **bool** | Whether this promotion can combine with others | [optional] 
**priority** | **num** | Evaluation priority (higher = evaluated first) | [optional] 
**startsAt** | [**DateTime**](DateTime.md) | Start date (ISO 8601) | [optional] 
**endsAt** | [**DateTime**](DateTime.md) | End date (ISO 8601) | [optional] 
**totalUsageLimit** | **num** | Maximum number of total redemptions | [optional] 
**perCustomerUsageLimit** | **num** | Maximum redemptions per customer | [optional] 
**maxApplicationsPerOrder** | **num** | Maximum applications per order | [optional] 
**excludedPromotionIds** | **BuiltSet&lt;String&gt;** | Promotion IDs excluded from stacking | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


