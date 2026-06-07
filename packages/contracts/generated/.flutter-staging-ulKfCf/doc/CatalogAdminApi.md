# mag_api_client.api.CatalogAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**catalogAdminArchiveBrand**](CatalogAdminApi.md#catalogadminarchivebrand) | **POST** /api/v1/catalog/admin/brands/{brandId}/archive | Archive a brand
[**catalogAdminArchiveCategory**](CatalogAdminApi.md#catalogadminarchivecategory) | **POST** /api/v1/catalog/admin/categories/{categoryId}/archive | Archive a category
[**catalogAdminArchiveCollection**](CatalogAdminApi.md#catalogadminarchivecollection) | **POST** /api/v1/catalog/admin/collections/{collectionId}/archive | Archive a collection
[**catalogAdminArchiveProduct**](CatalogAdminApi.md#catalogadminarchiveproduct) | **POST** /api/v1/catalog/admin/products/{productId}/archive | Archive a product
[**catalogAdminArchiveProductType**](CatalogAdminApi.md#catalogadminarchiveproducttype) | **POST** /api/v1/catalog/admin/product-types/{productTypeId}/archive | Archive a product type
[**catalogAdminArchiveProductVariant**](CatalogAdminApi.md#catalogadminarchiveproductvariant) | **POST** /api/v1/catalog/admin/variants/{variantId}/archive | Archive a product variant
[**catalogAdminArchiveTag**](CatalogAdminApi.md#catalogadminarchivetag) | **POST** /api/v1/catalog/admin/tags/{tagId}/archive | Archive a tag
[**catalogAdminAttachMedia**](CatalogAdminApi.md#catalogadminattachmedia) | **POST** /api/v1/catalog/admin/products/{productId}/media/attach | Attach uploaded media to a product
[**catalogAdminCreateAttribute**](CatalogAdminApi.md#catalogadmincreateattribute) | **POST** /api/v1/catalog/admin/attributes | Create a new attribute
[**catalogAdminCreateBrand**](CatalogAdminApi.md#catalogadmincreatebrand) | **POST** /api/v1/catalog/admin/brands | Create a new brand
[**catalogAdminCreateCategory**](CatalogAdminApi.md#catalogadmincreatecategory) | **POST** /api/v1/catalog/admin/categories | Create a new category
[**catalogAdminCreateCollection**](CatalogAdminApi.md#catalogadmincreatecollection) | **POST** /api/v1/catalog/admin/collections | Create a new collection
[**catalogAdminCreateProduct**](CatalogAdminApi.md#catalogadmincreateproduct) | **POST** /api/v1/catalog/admin/products | Create a new product
[**catalogAdminCreateProductType**](CatalogAdminApi.md#catalogadmincreateproducttype) | **POST** /api/v1/catalog/admin/product-types | Create a new product type
[**catalogAdminCreateProductVariant**](CatalogAdminApi.md#catalogadmincreateproductvariant) | **POST** /api/v1/catalog/admin/products/{productId}/variants | Create a new product variant
[**catalogAdminCreateTag**](CatalogAdminApi.md#catalogadmincreatetag) | **POST** /api/v1/catalog/admin/tags | Create a new tag
[**catalogAdminGetProduct**](CatalogAdminApi.md#catalogadmingetproduct) | **GET** /api/v1/catalog/admin/products/{productId} | Get a single product by ID
[**catalogAdminIssueMediaUploadIntent**](CatalogAdminApi.md#catalogadminissuemediauploadintent) | **POST** /api/v1/catalog/admin/products/{productId}/media/upload-intents | Issue a media upload intent for a product
[**catalogAdminListAttributes**](CatalogAdminApi.md#catalogadminlistattributes) | **GET** /api/v1/catalog/admin/attributes | List all attributes
[**catalogAdminListBrands**](CatalogAdminApi.md#catalogadminlistbrands) | **GET** /api/v1/catalog/admin/brands | List all brands
[**catalogAdminListCategories**](CatalogAdminApi.md#catalogadminlistcategories) | **GET** /api/v1/catalog/admin/categories | List all categories
[**catalogAdminListCollections**](CatalogAdminApi.md#catalogadminlistcollections) | **GET** /api/v1/catalog/admin/collections | List all collections
[**catalogAdminListProductTypes**](CatalogAdminApi.md#catalogadminlistproducttypes) | **GET** /api/v1/catalog/admin/product-types | List all product types
[**catalogAdminListProducts**](CatalogAdminApi.md#catalogadminlistproducts) | **GET** /api/v1/catalog/admin/products | List all products with pagination and filters
[**catalogAdminListTags**](CatalogAdminApi.md#catalogadminlisttags) | **GET** /api/v1/catalog/admin/tags | List all tags
[**catalogAdminPublishBrand**](CatalogAdminApi.md#catalogadminpublishbrand) | **POST** /api/v1/catalog/admin/brands/{brandId}/publish | Publish a brand
[**catalogAdminPublishCategory**](CatalogAdminApi.md#catalogadminpublishcategory) | **POST** /api/v1/catalog/admin/categories/{categoryId}/publish | Publish a category
[**catalogAdminPublishCollection**](CatalogAdminApi.md#catalogadminpublishcollection) | **POST** /api/v1/catalog/admin/collections/{collectionId}/publish | Publish a collection
[**catalogAdminPublishProduct**](CatalogAdminApi.md#catalogadminpublishproduct) | **POST** /api/v1/catalog/admin/products/{productId}/publish | Publish a product
[**catalogAdminPublishProductType**](CatalogAdminApi.md#catalogadminpublishproducttype) | **POST** /api/v1/catalog/admin/product-types/{productTypeId}/publish | Publish a product type
[**catalogAdminPublishProductVariant**](CatalogAdminApi.md#catalogadminpublishproductvariant) | **POST** /api/v1/catalog/admin/variants/{variantId}/publish | Publish a product variant
[**catalogAdminPublishTag**](CatalogAdminApi.md#catalogadminpublishtag) | **POST** /api/v1/catalog/admin/tags/{tagId}/publish | Publish a tag
[**catalogAdminUpdateProduct**](CatalogAdminApi.md#catalogadminupdateproduct) | **PATCH** /api/v1/catalog/admin/products/{productId} | Update a product
[**catalogAdminUpdateProductVariant**](CatalogAdminApi.md#catalogadminupdateproductvariant) | **PATCH** /api/v1/catalog/admin/variants/{variantId} | Update a product variant


# **catalogAdminArchiveBrand**
> CatalogStatusResponseDto catalogAdminArchiveBrand(brandId)

Archive a brand

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String brandId = brandId_example; // String | Brand ID

try {
    final response = api.catalogAdminArchiveBrand(brandId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminArchiveBrand: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **brandId** | **String**| Brand ID | 

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminArchiveCategory**
> CatalogStatusResponseDto catalogAdminArchiveCategory(categoryId)

Archive a category

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String categoryId = categoryId_example; // String | Category ID

try {
    final response = api.catalogAdminArchiveCategory(categoryId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminArchiveCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryId** | **String**| Category ID | 

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminArchiveCollection**
> CatalogStatusResponseDto catalogAdminArchiveCollection(collectionId)

Archive a collection

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String collectionId = collectionId_example; // String | Collection ID

try {
    final response = api.catalogAdminArchiveCollection(collectionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminArchiveCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collectionId** | **String**| Collection ID | 

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminArchiveProduct**
> CatalogStatusResponseDto catalogAdminArchiveProduct(productId)

Archive a product

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String productId = productId_example; // String | Product ID

try {
    final response = api.catalogAdminArchiveProduct(productId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminArchiveProduct: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productId** | **String**| Product ID | 

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminArchiveProductType**
> CatalogStatusResponseDto catalogAdminArchiveProductType(productTypeId)

Archive a product type

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String productTypeId = productTypeId_example; // String | Product type ID

try {
    final response = api.catalogAdminArchiveProductType(productTypeId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminArchiveProductType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productTypeId** | **String**| Product type ID | 

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminArchiveProductVariant**
> CatalogStatusResponseDto catalogAdminArchiveProductVariant(variantId)

Archive a product variant

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String variantId = variantId_example; // String | Variant ID

try {
    final response = api.catalogAdminArchiveProductVariant(variantId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminArchiveProductVariant: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **variantId** | **String**| Variant ID | 

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminArchiveTag**
> CatalogStatusResponseDto catalogAdminArchiveTag(tagId)

Archive a tag

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String tagId = tagId_example; // String | Tag ID

try {
    final response = api.catalogAdminArchiveTag(tagId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminArchiveTag: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagId** | **String**| Tag ID | 

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminAttachMedia**
> AttachedMediaResponseDto catalogAdminAttachMedia(attachMediaDto, productId)

Attach uploaded media to a product

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final AttachMediaDto attachMediaDto = ; // AttachMediaDto | 
final String productId = productId_example; // String | Product ID

try {
    final response = api.catalogAdminAttachMedia(attachMediaDto, productId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminAttachMedia: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **attachMediaDto** | [**AttachMediaDto**](AttachMediaDto.md)|  | 
 **productId** | **String**| Product ID | 

### Return type

[**AttachedMediaResponseDto**](AttachedMediaResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminCreateAttribute**
> AdminCatalogAttributeDto catalogAdminCreateAttribute(createAttributeDto)

Create a new attribute

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final CreateAttributeDto createAttributeDto = ; // CreateAttributeDto | 

try {
    final response = api.catalogAdminCreateAttribute(createAttributeDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminCreateAttribute: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createAttributeDto** | [**CreateAttributeDto**](CreateAttributeDto.md)|  | 

### Return type

[**AdminCatalogAttributeDto**](AdminCatalogAttributeDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminCreateBrand**
> AdminCatalogBrandDto catalogAdminCreateBrand(createBrandDto)

Create a new brand

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final CreateBrandDto createBrandDto = ; // CreateBrandDto | 

try {
    final response = api.catalogAdminCreateBrand(createBrandDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminCreateBrand: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createBrandDto** | [**CreateBrandDto**](CreateBrandDto.md)|  | 

### Return type

[**AdminCatalogBrandDto**](AdminCatalogBrandDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminCreateCategory**
> AdminCatalogCategoryDto catalogAdminCreateCategory(createCategoryDto)

Create a new category

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final CreateCategoryDto createCategoryDto = ; // CreateCategoryDto | 

try {
    final response = api.catalogAdminCreateCategory(createCategoryDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminCreateCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createCategoryDto** | [**CreateCategoryDto**](CreateCategoryDto.md)|  | 

### Return type

[**AdminCatalogCategoryDto**](AdminCatalogCategoryDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminCreateCollection**
> AdminCatalogCollectionDto catalogAdminCreateCollection(createCollectionDto)

Create a new collection

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final CreateCollectionDto createCollectionDto = ; // CreateCollectionDto | 

try {
    final response = api.catalogAdminCreateCollection(createCollectionDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminCreateCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createCollectionDto** | [**CreateCollectionDto**](CreateCollectionDto.md)|  | 

### Return type

[**AdminCatalogCollectionDto**](AdminCatalogCollectionDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminCreateProduct**
> AdminCatalogProductDto catalogAdminCreateProduct(createProductDto)

Create a new product

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final CreateProductDto createProductDto = ; // CreateProductDto | 

try {
    final response = api.catalogAdminCreateProduct(createProductDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminCreateProduct: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createProductDto** | [**CreateProductDto**](CreateProductDto.md)|  | 

### Return type

[**AdminCatalogProductDto**](AdminCatalogProductDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminCreateProductType**
> AdminCatalogProductTypeDto catalogAdminCreateProductType(createProductTypeDto)

Create a new product type

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final CreateProductTypeDto createProductTypeDto = ; // CreateProductTypeDto | 

try {
    final response = api.catalogAdminCreateProductType(createProductTypeDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminCreateProductType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createProductTypeDto** | [**CreateProductTypeDto**](CreateProductTypeDto.md)|  | 

### Return type

[**AdminCatalogProductTypeDto**](AdminCatalogProductTypeDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminCreateProductVariant**
> AdminCatalogVariantDto catalogAdminCreateProductVariant(createProductVariantDto, productId)

Create a new product variant

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final CreateProductVariantDto createProductVariantDto = ; // CreateProductVariantDto | 
final String productId = productId_example; // String | Product ID

try {
    final response = api.catalogAdminCreateProductVariant(createProductVariantDto, productId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminCreateProductVariant: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createProductVariantDto** | [**CreateProductVariantDto**](CreateProductVariantDto.md)|  | 
 **productId** | **String**| Product ID | 

### Return type

[**AdminCatalogVariantDto**](AdminCatalogVariantDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminCreateTag**
> AdminCatalogTagDto catalogAdminCreateTag(createTagDto)

Create a new tag

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final CreateTagDto createTagDto = ; // CreateTagDto | 

try {
    final response = api.catalogAdminCreateTag(createTagDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminCreateTag: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createTagDto** | [**CreateTagDto**](CreateTagDto.md)|  | 

### Return type

[**AdminCatalogTagDto**](AdminCatalogTagDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminGetProduct**
> AdminCatalogProductDto catalogAdminGetProduct(productId)

Get a single product by ID

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String productId = productId_example; // String | Product ID

try {
    final response = api.catalogAdminGetProduct(productId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminGetProduct: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productId** | **String**| Product ID | 

### Return type

[**AdminCatalogProductDto**](AdminCatalogProductDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminIssueMediaUploadIntent**
> MediaUploadIntentResponseDto catalogAdminIssueMediaUploadIntent(createMediaUploadIntentDto, productId)

Issue a media upload intent for a product

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final CreateMediaUploadIntentDto createMediaUploadIntentDto = ; // CreateMediaUploadIntentDto | 
final String productId = productId_example; // String | Product ID

try {
    final response = api.catalogAdminIssueMediaUploadIntent(createMediaUploadIntentDto, productId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminIssueMediaUploadIntent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createMediaUploadIntentDto** | [**CreateMediaUploadIntentDto**](CreateMediaUploadIntentDto.md)|  | 
 **productId** | **String**| Product ID | 

### Return type

[**MediaUploadIntentResponseDto**](MediaUploadIntentResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminListAttributes**
> BuiltList<AdminCatalogAttributeDto> catalogAdminListAttributes()

List all attributes

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();

try {
    final response = api.catalogAdminListAttributes();
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminListAttributes: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AdminCatalogAttributeDto&gt;**](AdminCatalogAttributeDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminListBrands**
> BuiltList<AdminCatalogBrandDto> catalogAdminListBrands()

List all brands

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();

try {
    final response = api.catalogAdminListBrands();
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminListBrands: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AdminCatalogBrandDto&gt;**](AdminCatalogBrandDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminListCategories**
> BuiltList<AdminCatalogCategoryDto> catalogAdminListCategories()

List all categories

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();

try {
    final response = api.catalogAdminListCategories();
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminListCategories: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AdminCatalogCategoryDto&gt;**](AdminCatalogCategoryDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminListCollections**
> BuiltList<AdminCatalogCollectionDto> catalogAdminListCollections()

List all collections

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();

try {
    final response = api.catalogAdminListCollections();
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminListCollections: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AdminCatalogCollectionDto&gt;**](AdminCatalogCollectionDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminListProductTypes**
> BuiltList<AdminCatalogProductTypeDto> catalogAdminListProductTypes()

List all product types

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();

try {
    final response = api.catalogAdminListProductTypes();
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminListProductTypes: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AdminCatalogProductTypeDto&gt;**](AdminCatalogProductTypeDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminListProducts**
> AdminPaginatedCatalogProductsDto catalogAdminListProducts(cursor, limit, status, search)

List all products with pagination and filters

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String cursor = cursor_example; // String | 
final num limit = 8.14; // num | 
final String status = status_example; // String | 
final String search = search_example; // String | 

try {
    final response = api.catalogAdminListProducts(cursor, limit, status, search);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminListProducts: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cursor** | **String**|  | [optional] 
 **limit** | **num**|  | [optional] [default to 20]
 **status** | **String**|  | [optional] 
 **search** | **String**|  | [optional] 

### Return type

[**AdminPaginatedCatalogProductsDto**](AdminPaginatedCatalogProductsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminListTags**
> BuiltList<AdminCatalogTagDto> catalogAdminListTags()

List all tags

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();

try {
    final response = api.catalogAdminListTags();
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminListTags: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;AdminCatalogTagDto&gt;**](AdminCatalogTagDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminPublishBrand**
> CatalogStatusResponseDto catalogAdminPublishBrand(brandId)

Publish a brand

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String brandId = brandId_example; // String | Brand ID

try {
    final response = api.catalogAdminPublishBrand(brandId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminPublishBrand: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **brandId** | **String**| Brand ID | 

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminPublishCategory**
> CatalogStatusResponseDto catalogAdminPublishCategory(categoryId)

Publish a category

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String categoryId = categoryId_example; // String | Category ID

try {
    final response = api.catalogAdminPublishCategory(categoryId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminPublishCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryId** | **String**| Category ID | 

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminPublishCollection**
> CatalogStatusResponseDto catalogAdminPublishCollection(collectionId)

Publish a collection

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String collectionId = collectionId_example; // String | Collection ID

try {
    final response = api.catalogAdminPublishCollection(collectionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminPublishCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collectionId** | **String**| Collection ID | 

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminPublishProduct**
> CatalogStatusResponseDto catalogAdminPublishProduct(productId)

Publish a product

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String productId = productId_example; // String | Product ID

try {
    final response = api.catalogAdminPublishProduct(productId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminPublishProduct: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productId** | **String**| Product ID | 

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminPublishProductType**
> CatalogStatusResponseDto catalogAdminPublishProductType(productTypeId)

Publish a product type

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String productTypeId = productTypeId_example; // String | Product type ID

try {
    final response = api.catalogAdminPublishProductType(productTypeId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminPublishProductType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productTypeId** | **String**| Product type ID | 

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminPublishProductVariant**
> CatalogStatusResponseDto catalogAdminPublishProductVariant(variantId)

Publish a product variant

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String variantId = variantId_example; // String | Variant ID

try {
    final response = api.catalogAdminPublishProductVariant(variantId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminPublishProductVariant: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **variantId** | **String**| Variant ID | 

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminPublishTag**
> CatalogStatusResponseDto catalogAdminPublishTag(tagId)

Publish a tag

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final String tagId = tagId_example; // String | Tag ID

try {
    final response = api.catalogAdminPublishTag(tagId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminPublishTag: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagId** | **String**| Tag ID | 

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminUpdateProduct**
> AdminCatalogProductDto catalogAdminUpdateProduct(updateProductDto, productId)

Update a product

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final UpdateProductDto updateProductDto = ; // UpdateProductDto | 
final String productId = productId_example; // String | Product ID

try {
    final response = api.catalogAdminUpdateProduct(updateProductDto, productId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminUpdateProduct: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateProductDto** | [**UpdateProductDto**](UpdateProductDto.md)|  | 
 **productId** | **String**| Product ID | 

### Return type

[**AdminCatalogProductDto**](AdminCatalogProductDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogAdminUpdateProductVariant**
> AdminCatalogVariantDto catalogAdminUpdateProductVariant(updateProductVariantDto, variantId)

Update a product variant

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getCatalogAdminApi();
final UpdateProductVariantDto updateProductVariantDto = ; // UpdateProductVariantDto | 
final String variantId = variantId_example; // String | Variant ID

try {
    final response = api.catalogAdminUpdateProductVariant(updateProductVariantDto, variantId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CatalogAdminApi->catalogAdminUpdateProductVariant: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateProductVariantDto** | [**UpdateProductVariantDto**](UpdateProductVariantDto.md)|  | 
 **variantId** | **String**| Variant ID | 

### Return type

[**AdminCatalogVariantDto**](AdminCatalogVariantDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

