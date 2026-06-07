# mag_api_client.api.ContentApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**publicContentGetLegalReferences**](ContentApi.md#publiccontentgetlegalreferences) | **GET** /api/v1/content/legal-references | Get public legal reference page keys
[**publicContentGetPage**](ContentApi.md#publiccontentgetpage) | **GET** /api/v1/content/pages/{slug} | Get a published content page by its slug


# **publicContentGetLegalReferences**
> LegalReferencesResponseDto publicContentGetLegalReferences()

Get public legal reference page keys

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getContentApi();

try {
    final response = api.publicContentGetLegalReferences();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ContentApi->publicContentGetLegalReferences: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**LegalReferencesResponseDto**](LegalReferencesResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **publicContentGetPage**
> ContentPageResponseDto publicContentGetPage(slug)

Get a published content page by its slug

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getContentApi();
final String slug = slug_example; // String | Content page slug

try {
    final response = api.publicContentGetPage(slug);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ContentApi->publicContentGetPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **slug** | **String**| Content page slug | 

### Return type

[**ContentPageResponseDto**](ContentPageResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

