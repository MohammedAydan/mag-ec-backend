# mag_api_client.model.PaymentAttemptResponseDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**orderId** | **String** |  | 
**provider** | **String** |  | 
**method** | **String** |  | 
**status** | **String** |  | 
**currencyCode** | **String** |  | 
**amount** | **num** |  | 
**createdAt** | **String** |  | 
**updatedAt** | **String** |  | 
**order** | [**OrderBriefDto**](OrderBriefDto.md) |  | 
**providerPaymentId** | **String** |  | [optional] 
**providerIntentStatus** | **String** |  | [optional] 
**providerReference** | **String** |  | [optional] 
**lastErrorCode** | **String** |  | [optional] 
**lastErrorMessage** | **String** |  | [optional] 
**succeededAt** | **String** |  | [optional] 
**failedAt** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


