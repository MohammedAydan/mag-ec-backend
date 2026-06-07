# mag_api_client.api.CatalogPublicApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**catalogPublicBrowseProducts**](CatalogPublicApi.md#catalogpublicbrowseproducts) | **GET** /api/v1/catalog/products | Browse published products with optional filters
[**catalogPublicGetProductBySlug**](CatalogPublicApi.md#catalogpublicgetproductbyslug) | **GET** /api/v1/catalog/products/{slug} | Get a published product by its translated slug


# **catalogPublicBrowseProducts**
> PaginatedCatalogProductsDto catalogPublicBrowseProducts(page, pageSize, locale, brandSlug, categorySlug, collectionSlug, tagSlug, productTypeKey, optionKeys)

Browse published products with optional filters

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogPublicApi();
final num page = 8.14; // num | 
final num pageSize = 8.14; // num | 
final String locale = locale_example; // String | 
final String brandSlug = brandSlug_example; // String | 
final String categorySlug = categorySlug_example; // String | 
final String collectionSlug = collectionSlug_example; // String | 
final String tagSlug = tagSlug_example; // String | 
final String productTypeKey = productTypeKey_example; // String | 
final String optionKeys = optionKeys_example; // String | Comma-separated attribute option keys

try {
    final response = api.catalogPublicBrowseProducts(page, pageSize, locale, brandSlug, categorySlug, collectionSlug, tagSlug, productTypeKey, optionKeys);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogPublicApi->catalogPublicBrowseProducts: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **num**|  | [optional] [default to 1]
 **pageSize** | **num**|  | [optional] [default to 12]
 **locale** | **String**|  | [optional] [default to 'en']
 **brandSlug** | **String**|  | [optional] 
 **categorySlug** | **String**|  | [optional] 
 **collectionSlug** | **String**|  | [optional] 
 **tagSlug** | **String**|  | [optional] 
 **productTypeKey** | **String**|  | [optional] 
 **optionKeys** | **String**| Comma-separated attribute option keys | [optional] 

### Return type

[**PaginatedCatalogProductsDto**](PaginatedCatalogProductsDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogPublicGetProductBySlug**
> CatalogProductSummaryDto catalogPublicGetProductBySlug(slug, locale)

Get a published product by its translated slug

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogPublicApi();
final String slug = slug_example; // String | Translated product slug
final String locale = locale_example; // String | Locale code for translations (default: en)

try {
    final response = api.catalogPublicGetProductBySlug(slug, locale);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogPublicApi->catalogPublicGetProductBySlug: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **slug** | **String**| Translated product slug | 
 **locale** | **String**| Locale code for translations (default: en) | [optional] 

### Return type

[**CatalogProductSummaryDto**](CatalogProductSummaryDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

