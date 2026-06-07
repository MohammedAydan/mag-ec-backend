# mag_api_client.api.AuthenticationApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authGetCurrentUser**](AuthenticationApi.md#authgetcurrentuser) | **GET** /api/v1/auth/me | Return the authenticated user profile and access summary
[**authLogin**](AuthenticationApi.md#authlogin) | **POST** /api/v1/auth/login | Authenticate user credentials and issue session tokens
[**authLogout**](AuthenticationApi.md#authlogout) | **POST** /api/v1/auth/logout | Revoke active refresh token session family
[**authRefresh**](AuthenticationApi.md#authrefresh) | **POST** /api/v1/auth/refresh | Exchange an active refresh token for a new token set (rotation)
[**authRegister**](AuthenticationApi.md#authregister) | **POST** /api/v1/auth/register | Register a new customer account
[**authRequestEmailVerification**](AuthenticationApi.md#authrequestemailverification) | **POST** /api/v1/auth/verification/request | Issue a new email-verification request for the authenticated user
[**authRequestPasswordReset**](AuthenticationApi.md#authrequestpasswordreset) | **POST** /api/v1/auth/password-reset/request | Create a password-reset request without disclosing account existence
[**authResetPassword**](AuthenticationApi.md#authresetpassword) | **POST** /api/v1/auth/password-reset/confirm | Consume a password-reset token and change the user password
[**authVerifyEmail**](AuthenticationApi.md#authverifyemail) | **POST** /api/v1/auth/verification/confirm | Consume an email-verification token and mark the account verified


# **authGetCurrentUser**
> UserProfileDto authGetCurrentUser()

Return the authenticated user profile and access summary

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getAuthenticationApi();

try {
    final response = api.authGetCurrentUser();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthenticationApi->authGetCurrentUser: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserProfileDto**](UserProfileDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authLogin**
> AuthResponseDto authLogin(loginDto)

Authenticate user credentials and issue session tokens

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getAuthenticationApi();
final LoginDto loginDto = ; // LoginDto | 

try {
    final response = api.authLogin(loginDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthenticationApi->authLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginDto** | [**LoginDto**](LoginDto.md)|  | 

### Return type

[**AuthResponseDto**](AuthResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authLogout**
> authLogout(logoutDto)

Revoke active refresh token session family

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getAuthenticationApi();
final LogoutDto logoutDto = ; // LogoutDto | 

try {
    api.authLogout(logoutDto);
} on DioException catch (e) {
    print('Exception when calling AuthenticationApi->authLogout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **logoutDto** | [**LogoutDto**](LogoutDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authRefresh**
> AuthResponseDto authRefresh(refreshTokenDto)

Exchange an active refresh token for a new token set (rotation)

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getAuthenticationApi();
final RefreshTokenDto refreshTokenDto = ; // RefreshTokenDto | 

try {
    final response = api.authRefresh(refreshTokenDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthenticationApi->authRefresh: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshTokenDto** | [**RefreshTokenDto**](RefreshTokenDto.md)|  | 

### Return type

[**AuthResponseDto**](AuthResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authRegister**
> RegisterResponseDto authRegister(registerDto)

Register a new customer account

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getAuthenticationApi();
final RegisterDto registerDto = ; // RegisterDto | 

try {
    final response = api.authRegister(registerDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthenticationApi->authRegister: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerDto** | [**RegisterDto**](RegisterDto.md)|  | 

### Return type

[**RegisterResponseDto**](RegisterResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authRequestEmailVerification**
> VerificationRequestResponseDto authRequestEmailVerification()

Issue a new email-verification request for the authenticated user

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getAuthenticationApi();

try {
    final response = api.authRequestEmailVerification();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthenticationApi->authRequestEmailVerification: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**VerificationRequestResponseDto**](VerificationRequestResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authRequestPasswordReset**
> PasswordResetRequestResponseDto authRequestPasswordReset(requestPasswordResetDto)

Create a password-reset request without disclosing account existence

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getAuthenticationApi();
final RequestPasswordResetDto requestPasswordResetDto = ; // RequestPasswordResetDto | 

try {
    final response = api.authRequestPasswordReset(requestPasswordResetDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthenticationApi->authRequestPasswordReset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **requestPasswordResetDto** | [**RequestPasswordResetDto**](RequestPasswordResetDto.md)|  | 

### Return type

[**PasswordResetRequestResponseDto**](PasswordResetRequestResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authResetPassword**
> PasswordResetConfirmResponseDto authResetPassword(resetPasswordDto)

Consume a password-reset token and change the user password

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getAuthenticationApi();
final ResetPasswordDto resetPasswordDto = ; // ResetPasswordDto | 

try {
    final response = api.authResetPassword(resetPasswordDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthenticationApi->authResetPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resetPasswordDto** | [**ResetPasswordDto**](ResetPasswordDto.md)|  | 

### Return type

[**PasswordResetConfirmResponseDto**](PasswordResetConfirmResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authVerifyEmail**
> VerifyEmailResponseDto authVerifyEmail(verifyEmailDto)

Consume an email-verification token and mark the account verified

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getAuthenticationApi();
final VerifyEmailDto verifyEmailDto = ; // VerifyEmailDto | 

try {
    final response = api.authVerifyEmail(verifyEmailDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthenticationApi->authVerifyEmail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyEmailDto** | [**VerifyEmailDto**](VerifyEmailDto.md)|  | 

### Return type

[**VerifyEmailResponseDto**](VerifyEmailResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

