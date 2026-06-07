# IdentityApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**identityGetAdminAccessCheck**](IdentityApi.md#identitygetadminaccesscheck) | **GET** /api/v1/identity/admin/access-check | Verify privileged identity access for administrative actors |
| [**identityGetUserProfile**](IdentityApi.md#identitygetuserprofile) | **GET** /api/v1/identity/users/{userId}/profile | Read a user profile when the actor owns it or has identity.read access |



## identityGetAdminAccessCheck

> AdminAccessCheckResponseDto identityGetAdminAccessCheck()

Verify privileged identity access for administrative actors

### Example

```ts
import {
  Configuration,
  IdentityApi,
} from '@mag/generated-api-client';
import type { IdentityGetAdminAccessCheckRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IdentityApi(config);

  try {
    const data = await api.identityGetAdminAccessCheck();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AdminAccessCheckResponseDto**](AdminAccessCheckResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Administrative identity access is allowed |  -  |
| **400** | Invalid request parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Missing required role or permission |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## identityGetUserProfile

> UserProfileDto identityGetUserProfile(userId)

Read a user profile when the actor owns it or has identity.read access

### Example

```ts
import {
  Configuration,
  IdentityApi,
} from '@mag/generated-api-client';
import type { IdentityGetUserProfileRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IdentityApi(config);

  const body = {
    // string | UUID of the user whose profile is requested
    userId: userId_example,
  } satisfies IdentityGetUserProfileRequest;

  try {
    const data = await api.identityGetUserProfile(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **userId** | `string` | UUID of the user whose profile is requested | [Defaults to `undefined`] |

### Return type

[**UserProfileDto**](UserProfileDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | User profile returned |  -  |
| **400** | Invalid request parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Object-level access denied |  -  |
| **404** | Requested user not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

