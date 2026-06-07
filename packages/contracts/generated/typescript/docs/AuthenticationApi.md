# AuthenticationApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**authGetCurrentUser**](AuthenticationApi.md#authgetcurrentuser) | **GET** /api/v1/auth/me | Return the authenticated user profile and access summary |
| [**authLogin**](AuthenticationApi.md#authlogin) | **POST** /api/v1/auth/login | Authenticate user credentials and issue session tokens |
| [**authLogout**](AuthenticationApi.md#authlogout) | **POST** /api/v1/auth/logout | Revoke active refresh token session family |
| [**authRefresh**](AuthenticationApi.md#authrefresh) | **POST** /api/v1/auth/refresh | Exchange an active refresh token for a new token set (rotation) |
| [**authRegister**](AuthenticationApi.md#authregister) | **POST** /api/v1/auth/register | Register a new customer account |
| [**authRequestEmailVerification**](AuthenticationApi.md#authrequestemailverification) | **POST** /api/v1/auth/verification/request | Issue a new email-verification request for the authenticated user |
| [**authRequestPasswordReset**](AuthenticationApi.md#authrequestpasswordreset) | **POST** /api/v1/auth/password-reset/request | Create a password-reset request without disclosing account existence |
| [**authResetPassword**](AuthenticationApi.md#authresetpassword) | **POST** /api/v1/auth/password-reset/confirm | Consume a password-reset token and change the user password |
| [**authVerifyEmail**](AuthenticationApi.md#authverifyemail) | **POST** /api/v1/auth/verification/confirm | Consume an email-verification token and mark the account verified |



## authGetCurrentUser

> UserProfileDto authGetCurrentUser()

Return the authenticated user profile and access summary

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@mag/generated-api-client';
import type { AuthGetCurrentUserRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AuthenticationApi(config);

  try {
    const data = await api.authGetCurrentUser();
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

[**UserProfileDto**](UserProfileDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Authenticated user profile returned |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## authLogin

> AuthResponseDto authLogin(loginDto)

Authenticate user credentials and issue session tokens

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@mag/generated-api-client';
import type { AuthLoginRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new AuthenticationApi();

  const body = {
    // LoginDto
    loginDto: ...,
  } satisfies AuthLoginRequest;

  try {
    const data = await api.authLogin(body);
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
| **loginDto** | [LoginDto](LoginDto.md) |  | |

### Return type

[**AuthResponseDto**](AuthResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Login successful |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Invalid credentials |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## authLogout

> authLogout(logoutDto)

Revoke active refresh token session family

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@mag/generated-api-client';
import type { AuthLogoutRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new AuthenticationApi();

  const body = {
    // LogoutDto
    logoutDto: ...,
  } satisfies AuthLogoutRequest;

  try {
    const data = await api.authLogout(body);
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
| **logoutDto** | [LogoutDto](LogoutDto.md) |  | |

### Return type

`void` (Empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: Not defined


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | Logout successful |  -  |
| **400** | Invalid request body or parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## authRefresh

> AuthResponseDto authRefresh(refreshTokenDto)

Exchange an active refresh token for a new token set (rotation)

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@mag/generated-api-client';
import type { AuthRefreshRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new AuthenticationApi();

  const body = {
    // RefreshTokenDto
    refreshTokenDto: ...,
  } satisfies AuthRefreshRequest;

  try {
    const data = await api.authRefresh(body);
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
| **refreshTokenDto** | [RefreshTokenDto](RefreshTokenDto.md) |  | |

### Return type

[**AuthResponseDto**](AuthResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Tokens successfully rotated |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Invalid or rotated refresh token |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## authRegister

> RegisterResponseDto authRegister(registerDto)

Register a new customer account

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@mag/generated-api-client';
import type { AuthRegisterRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new AuthenticationApi();

  const body = {
    // RegisterDto
    registerDto: ...,
  } satisfies AuthRegisterRequest;

  try {
    const data = await api.authRegister(body);
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
| **registerDto** | [RegisterDto](RegisterDto.md) |  | |

### Return type

[**RegisterResponseDto**](RegisterResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | User successfully registered |  -  |
| **400** | Invalid request body or parameters |  -  |
| **409** | Email already exists |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## authRequestEmailVerification

> VerificationRequestResponseDto authRequestEmailVerification()

Issue a new email-verification request for the authenticated user

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@mag/generated-api-client';
import type { AuthRequestEmailVerificationRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AuthenticationApi(config);

  try {
    const data = await api.authRequestEmailVerification();
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

[**VerificationRequestResponseDto**](VerificationRequestResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Email-verification request accepted |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## authRequestPasswordReset

> PasswordResetRequestResponseDto authRequestPasswordReset(requestPasswordResetDto)

Create a password-reset request without disclosing account existence

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@mag/generated-api-client';
import type { AuthRequestPasswordResetRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new AuthenticationApi();

  const body = {
    // RequestPasswordResetDto
    requestPasswordResetDto: ...,
  } satisfies AuthRequestPasswordResetRequest;

  try {
    const data = await api.authRequestPasswordReset(body);
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
| **requestPasswordResetDto** | [RequestPasswordResetDto](RequestPasswordResetDto.md) |  | |

### Return type

[**PasswordResetRequestResponseDto**](PasswordResetRequestResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Password-reset request accepted |  -  |
| **400** | Invalid request body or parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## authResetPassword

> PasswordResetConfirmResponseDto authResetPassword(resetPasswordDto)

Consume a password-reset token and change the user password

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@mag/generated-api-client';
import type { AuthResetPasswordRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new AuthenticationApi();

  const body = {
    // ResetPasswordDto
    resetPasswordDto: ...,
  } satisfies AuthResetPasswordRequest;

  try {
    const data = await api.authResetPassword(body);
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
| **resetPasswordDto** | [ResetPasswordDto](ResetPasswordDto.md) |  | |

### Return type

[**PasswordResetConfirmResponseDto**](PasswordResetConfirmResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Password reset completed |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Invalid or expired password-reset token |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## authVerifyEmail

> VerifyEmailResponseDto authVerifyEmail(verifyEmailDto)

Consume an email-verification token and mark the account verified

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@mag/generated-api-client';
import type { AuthVerifyEmailRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new AuthenticationApi();

  const body = {
    // VerifyEmailDto
    verifyEmailDto: ...,
  } satisfies AuthVerifyEmailRequest;

  try {
    const data = await api.authVerifyEmail(body);
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
| **verifyEmailDto** | [VerifyEmailDto](VerifyEmailDto.md) |  | |

### Return type

[**VerifyEmailResponseDto**](VerifyEmailResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Email verified |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Invalid or expired verification token |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

