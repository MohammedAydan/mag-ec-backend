# mag_api_client.api.IdentityApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**identityGetAdminAccessCheck**](IdentityApi.md#identitygetadminaccesscheck) | **GET** /api/v1/identity/admin/access-check | Verify privileged identity access for administrative actors
[**identityGetUserProfile**](IdentityApi.md#identitygetuserprofile) | **GET** /api/v1/identity/users/{userId}/profile | Read a user profile when the actor owns it or has identity.read access


# **identityGetAdminAccessCheck**
> AdminAccessCheckResponseDto identityGetAdminAccessCheck()

Verify privileged identity access for administrative actors

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getIdentityApi();

try {
    final response = api.identityGetAdminAccessCheck();
    print(response);
} on DioException catch (e) {
    print('Exception when calling IdentityApi->identityGetAdminAccessCheck: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AdminAccessCheckResponseDto**](AdminAccessCheckResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **identityGetUserProfile**
> UserProfileDto identityGetUserProfile(userId)

Read a user profile when the actor owns it or has identity.read access

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getIdentityApi();
final String userId = userId_example; // String | UUID of the user whose profile is requested

try {
    final response = api.identityGetUserProfile(userId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling IdentityApi->identityGetUserProfile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**| UUID of the user whose profile is requested | 

### Return type

[**UserProfileDto**](UserProfileDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

