# mag_api_client.api.ContentAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminContentGetLegalReferences**](ContentAdminApi.md#admincontentgetlegalreferences) | **GET** /api/v1/content/admin/legal-references | Get legal reference page key mappings
[**adminContentListPages**](ContentAdminApi.md#admincontentlistpages) | **GET** /api/v1/content/admin/pages | List all content pages
[**adminContentUpsertLegalReferences**](ContentAdminApi.md#admincontentupsertlegalreferences) | **PUT** /api/v1/content/admin/legal-references | Update legal reference page key mappings
[**adminContentUpsertPage**](ContentAdminApi.md#admincontentupsertpage) | **PUT** /api/v1/content/admin/pages/{key} | Create or update a content page


# **adminContentGetLegalReferences**
> AdminLegalReferencesResponseDto adminContentGetLegalReferences()

Get legal reference page key mappings

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getContentAdminApi();

try {
    final response = api.adminContentGetLegalReferences();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ContentAdminApi->adminContentGetLegalReferences: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AdminLegalReferencesResponseDto**](AdminLegalReferencesResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminContentListPages**
> BuiltList<ContentPageResponseDto> adminContentListPages()

List all content pages

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getContentAdminApi();

try {
    final response = api.adminContentListPages();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ContentAdminApi->adminContentListPages: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ContentPageResponseDto&gt;**](ContentPageResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminContentUpsertLegalReferences**
> AdminLegalReferencesResponseDto adminContentUpsertLegalReferences(updateLegalReferencesDto)

Update legal reference page key mappings

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getContentAdminApi();
final UpdateLegalReferencesDto updateLegalReferencesDto = ; // UpdateLegalReferencesDto | 

try {
    final response = api.adminContentUpsertLegalReferences(updateLegalReferencesDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ContentAdminApi->adminContentUpsertLegalReferences: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateLegalReferencesDto** | [**UpdateLegalReferencesDto**](UpdateLegalReferencesDto.md)|  | 

### Return type

[**AdminLegalReferencesResponseDto**](AdminLegalReferencesResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminContentUpsertPage**
> ContentPageResponseDto adminContentUpsertPage(upsertContentPageDto, key)

Create or update a content page

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getContentAdminApi();
final UpsertContentPageDto upsertContentPageDto = ; // UpsertContentPageDto | 
final String key = key_example; // String | Content page key

try {
    final response = api.adminContentUpsertPage(upsertContentPageDto, key);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ContentAdminApi->adminContentUpsertPage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **upsertContentPageDto** | [**UpsertContentPageDto**](UpsertContentPageDto.md)|  | 
 **key** | **String**| Content page key | 

### Return type

[**ContentPageResponseDto**](ContentPageResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

