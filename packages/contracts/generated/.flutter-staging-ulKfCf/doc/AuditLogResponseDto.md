# mag_api_client.model.AuditLogResponseDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**category** | **String** |  | 
**action** | **String** |  | 
**entityType** | **String** |  | 
**createdAt** | **String** |  | 
**actorUserId** | **String** |  | [optional] 
**entityId** | **String** |  | [optional] 
**ipAddress** | **String** |  | [optional] 
**userAgent** | **String** |  | [optional] 
**metadata** | [**JsonObject**](.md) |  | [optional] 
**diff** | [**JsonObject**](.md) |  | [optional] 
**actorUser** | [**AuditLogActorDto**](AuditLogActorDto.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


