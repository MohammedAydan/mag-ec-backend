# mag_api_client.model.OrderReturnRequestDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**returnNumber** | **String** |  | 
**requestedByUserId** | **String** |  | 
**status** | **String** |  | 
**reason** | **String** |  | 
**createdAt** | **String** |  | 
**updatedAt** | **String** |  | 
**items** | [**BuiltList&lt;OrderReturnRequestItemDto&gt;**](OrderReturnRequestItemDto.md) |  | 
**refunds** | [**BuiltList&lt;OrderRefundDto&gt;**](OrderRefundDto.md) |  | 
**reviewedByUserId** | **String** |  | [optional] 
**receivedByUserId** | **String** |  | [optional] 
**notes** | **String** |  | [optional] 
**reviewNotes** | **String** |  | [optional] 
**rejectionReason** | **String** |  | [optional] 
**approvedAt** | **String** |  | [optional] 
**rejectedAt** | **String** |  | [optional] 
**receivedAt** | **String** |  | [optional] 
**closedAt** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


