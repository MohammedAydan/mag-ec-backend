# mag_api_client.model.CreateShipmentDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**items** | [**BuiltList&lt;CreateShipmentItemDto&gt;**](CreateShipmentItemDto.md) | Shipment line items | 
**carrierKey** | **String** | Carrier service key (e.g., ups_ground) | [optional] 
**carrierName** | **String** | Human-readable carrier name | [optional] 
**trackingNumber** | **String** | Shipment tracking number | [optional] 
**trackingUrl** | **String** | Tracking URL for the shipment | [optional] 
**notes** | **String** | Internal notes about the shipment | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


