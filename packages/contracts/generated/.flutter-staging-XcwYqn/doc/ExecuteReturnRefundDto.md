# mag_api_client.model.ExecuteReturnRefundDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **num** | Refund amount in the smallest currency unit (e.g., cents) | 
**reason** | **String** | Reason for the refund | [optional] 
**isOverride** | **bool** | Set to true to override the automatic refund cap derived from received return items. Requires refunds.override_cap permission. | [optional] 
**overrideReason** | **String** | Required when isOverride is true. Explains why the refund exceeds the received-items cap. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


