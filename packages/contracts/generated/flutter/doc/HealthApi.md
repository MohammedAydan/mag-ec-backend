# mag_api_client.api.HealthApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**healthGetLiveness**](HealthApi.md#healthgetliveness) | **GET** /api/v1/health/liveness | Check API process liveness
[**healthGetReadiness**](HealthApi.md#healthgetreadiness) | **GET** /api/v1/health/readiness | Check API readiness including downstream dependencies


# **healthGetLiveness**
> HealthLivenessResponseDto healthGetLiveness()

Check API process liveness

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getHealthApi();

try {
    final response = api.healthGetLiveness();
    print(response);
} on DioException catch (e) {
    print('Exception when calling HealthApi->healthGetLiveness: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**HealthLivenessResponseDto**](HealthLivenessResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **healthGetReadiness**
> HealthReadinessResponseDto healthGetReadiness()

Check API readiness including downstream dependencies

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getHealthApi();

try {
    final response = api.healthGetReadiness();
    print(response);
} on DioException catch (e) {
    print('Exception when calling HealthApi->healthGetReadiness: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**HealthReadinessResponseDto**](HealthReadinessResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

