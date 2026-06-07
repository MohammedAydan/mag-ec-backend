# mag_api_client.model.UpsertCouponDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**code** | **String** | Unique coupon code | 
**status** | **String** | Coupon status | 
**startsAt** | [**DateTime**](DateTime.md) | Start date (ISO 8601) | [optional] 
**endsAt** | [**DateTime**](DateTime.md) | End date (ISO 8601) | [optional] 
**totalUsageLimit** | **num** | Maximum number of total redemptions for this coupon | [optional] 
**perCustomerUsageLimit** | **num** | Maximum redemptions per customer for this coupon | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


