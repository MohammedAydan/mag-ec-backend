# mag_api_client.model.ReviewResponseDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**productId** | **String** |  | 
**userId** | **String** |  | 
**orderLineId** | **String** |  | 
**rating** | **num** |  | 
**title** | **String** |  | 
**body** | **String** |  | 
**isVerifiedPurchase** | **bool** |  | 
**status** | **String** |  | 
**createdAt** | **String** |  | 
**updatedAt** | **String** |  | 
**product** | [**ReviewProductDto**](ReviewProductDto.md) |  | 
**orderLine** | [**ReviewOrderLineDto**](ReviewOrderLineDto.md) |  | 
**moderationActions** | [**BuiltList&lt;ReviewModerationActionDto&gt;**](ReviewModerationActionDto.md) |  | 
**rejectionReason** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


