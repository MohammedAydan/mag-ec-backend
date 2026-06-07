# mag_api_client.model.AdjustStockDto

## Load the model package
```dart
import 'package:mag_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**warehouseId** | **String** | Warehouse identifier | 
**variantId** | **String** | Catalog variant identifier | 
**quantityChanged** | **num** | Quantity change (positive or negative, must not be zero) | 
**type** | **String** | Movement type | 
**referenceType** | **String** | Reference type for traceability (e.g. order, return) | [optional] 
**referenceId** | **String** | Reference identifier for traceability | [optional] 
**reason** | **String** | Human-readable reason for the adjustment | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


