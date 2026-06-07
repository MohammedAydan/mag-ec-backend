# CatalogAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**catalogAdminArchiveBrand**](CatalogAdminApi.md#catalogadminarchivebrand) | **POST** /api/v1/catalog/admin/brands/{brandId}/archive | Archive a brand |
| [**catalogAdminArchiveCategory**](CatalogAdminApi.md#catalogadminarchivecategory) | **POST** /api/v1/catalog/admin/categories/{categoryId}/archive | Archive a category |
| [**catalogAdminArchiveCollection**](CatalogAdminApi.md#catalogadminarchivecollection) | **POST** /api/v1/catalog/admin/collections/{collectionId}/archive | Archive a collection |
| [**catalogAdminArchiveProduct**](CatalogAdminApi.md#catalogadminarchiveproduct) | **POST** /api/v1/catalog/admin/products/{productId}/archive | Archive a product |
| [**catalogAdminArchiveProductType**](CatalogAdminApi.md#catalogadminarchiveproducttype) | **POST** /api/v1/catalog/admin/product-types/{productTypeId}/archive | Archive a product type |
| [**catalogAdminArchiveProductVariant**](CatalogAdminApi.md#catalogadminarchiveproductvariant) | **POST** /api/v1/catalog/admin/variants/{variantId}/archive | Archive a product variant |
| [**catalogAdminArchiveTag**](CatalogAdminApi.md#catalogadminarchivetag) | **POST** /api/v1/catalog/admin/tags/{tagId}/archive | Archive a tag |
| [**catalogAdminAttachMedia**](CatalogAdminApi.md#catalogadminattachmedia) | **POST** /api/v1/catalog/admin/products/{productId}/media/attach | Attach uploaded media to a product |
| [**catalogAdminCreateAttribute**](CatalogAdminApi.md#catalogadmincreateattribute) | **POST** /api/v1/catalog/admin/attributes | Create a new attribute |
| [**catalogAdminCreateBrand**](CatalogAdminApi.md#catalogadmincreatebrand) | **POST** /api/v1/catalog/admin/brands | Create a new brand |
| [**catalogAdminCreateCategory**](CatalogAdminApi.md#catalogadmincreatecategory) | **POST** /api/v1/catalog/admin/categories | Create a new category |
| [**catalogAdminCreateCollection**](CatalogAdminApi.md#catalogadmincreatecollection) | **POST** /api/v1/catalog/admin/collections | Create a new collection |
| [**catalogAdminCreateProduct**](CatalogAdminApi.md#catalogadmincreateproduct) | **POST** /api/v1/catalog/admin/products | Create a new product |
| [**catalogAdminCreateProductType**](CatalogAdminApi.md#catalogadmincreateproducttype) | **POST** /api/v1/catalog/admin/product-types | Create a new product type |
| [**catalogAdminCreateProductVariant**](CatalogAdminApi.md#catalogadmincreateproductvariant) | **POST** /api/v1/catalog/admin/products/{productId}/variants | Create a new product variant |
| [**catalogAdminCreateTag**](CatalogAdminApi.md#catalogadmincreatetag) | **POST** /api/v1/catalog/admin/tags | Create a new tag |
| [**catalogAdminGetProduct**](CatalogAdminApi.md#catalogadmingetproduct) | **GET** /api/v1/catalog/admin/products/{productId} | Get a single product by ID |
| [**catalogAdminIssueMediaUploadIntent**](CatalogAdminApi.md#catalogadminissuemediauploadintent) | **POST** /api/v1/catalog/admin/products/{productId}/media/upload-intents | Issue a media upload intent for a product |
| [**catalogAdminListAttributes**](CatalogAdminApi.md#catalogadminlistattributes) | **GET** /api/v1/catalog/admin/attributes | List all attributes |
| [**catalogAdminListBrands**](CatalogAdminApi.md#catalogadminlistbrands) | **GET** /api/v1/catalog/admin/brands | List all brands |
| [**catalogAdminListCategories**](CatalogAdminApi.md#catalogadminlistcategories) | **GET** /api/v1/catalog/admin/categories | List all categories |
| [**catalogAdminListCollections**](CatalogAdminApi.md#catalogadminlistcollections) | **GET** /api/v1/catalog/admin/collections | List all collections |
| [**catalogAdminListProductTypes**](CatalogAdminApi.md#catalogadminlistproducttypes) | **GET** /api/v1/catalog/admin/product-types | List all product types |
| [**catalogAdminListProducts**](CatalogAdminApi.md#catalogadminlistproducts) | **GET** /api/v1/catalog/admin/products | List all products with pagination and filters |
| [**catalogAdminListTags**](CatalogAdminApi.md#catalogadminlisttags) | **GET** /api/v1/catalog/admin/tags | List all tags |
| [**catalogAdminPublishBrand**](CatalogAdminApi.md#catalogadminpublishbrand) | **POST** /api/v1/catalog/admin/brands/{brandId}/publish | Publish a brand |
| [**catalogAdminPublishCategory**](CatalogAdminApi.md#catalogadminpublishcategory) | **POST** /api/v1/catalog/admin/categories/{categoryId}/publish | Publish a category |
| [**catalogAdminPublishCollection**](CatalogAdminApi.md#catalogadminpublishcollection) | **POST** /api/v1/catalog/admin/collections/{collectionId}/publish | Publish a collection |
| [**catalogAdminPublishProduct**](CatalogAdminApi.md#catalogadminpublishproduct) | **POST** /api/v1/catalog/admin/products/{productId}/publish | Publish a product |
| [**catalogAdminPublishProductType**](CatalogAdminApi.md#catalogadminpublishproducttype) | **POST** /api/v1/catalog/admin/product-types/{productTypeId}/publish | Publish a product type |
| [**catalogAdminPublishProductVariant**](CatalogAdminApi.md#catalogadminpublishproductvariant) | **POST** /api/v1/catalog/admin/variants/{variantId}/publish | Publish a product variant |
| [**catalogAdminPublishTag**](CatalogAdminApi.md#catalogadminpublishtag) | **POST** /api/v1/catalog/admin/tags/{tagId}/publish | Publish a tag |
| [**catalogAdminUpdateProduct**](CatalogAdminApi.md#catalogadminupdateproduct) | **PATCH** /api/v1/catalog/admin/products/{productId} | Update a product |
| [**catalogAdminUpdateProductVariant**](CatalogAdminApi.md#catalogadminupdateproductvariant) | **PATCH** /api/v1/catalog/admin/variants/{variantId} | Update a product variant |



## catalogAdminArchiveBrand

> CatalogStatusResponseDto catalogAdminArchiveBrand(brandId)

Archive a brand

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminArchiveBrandRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Brand ID
    brandId: brandId_example,
  } satisfies CatalogAdminArchiveBrandRequest;

  try {
    const data = await api.catalogAdminArchiveBrand(body);
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
| **brandId** | `string` | Brand ID | [Defaults to `undefined`] |

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Brand archived |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Brand not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminArchiveCategory

> CatalogStatusResponseDto catalogAdminArchiveCategory(categoryId)

Archive a category

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminArchiveCategoryRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Category ID
    categoryId: categoryId_example,
  } satisfies CatalogAdminArchiveCategoryRequest;

  try {
    const data = await api.catalogAdminArchiveCategory(body);
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
| **categoryId** | `string` | Category ID | [Defaults to `undefined`] |

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Category archived |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Category not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminArchiveCollection

> CatalogStatusResponseDto catalogAdminArchiveCollection(collectionId)

Archive a collection

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminArchiveCollectionRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Collection ID
    collectionId: collectionId_example,
  } satisfies CatalogAdminArchiveCollectionRequest;

  try {
    const data = await api.catalogAdminArchiveCollection(body);
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
| **collectionId** | `string` | Collection ID | [Defaults to `undefined`] |

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Collection archived |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Collection not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminArchiveProduct

> CatalogStatusResponseDto catalogAdminArchiveProduct(productId)

Archive a product

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminArchiveProductRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Product ID
    productId: productId_example,
  } satisfies CatalogAdminArchiveProductRequest;

  try {
    const data = await api.catalogAdminArchiveProduct(body);
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
| **productId** | `string` | Product ID | [Defaults to `undefined`] |

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Product archived |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Product not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminArchiveProductType

> CatalogStatusResponseDto catalogAdminArchiveProductType(productTypeId)

Archive a product type

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminArchiveProductTypeRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Product type ID
    productTypeId: productTypeId_example,
  } satisfies CatalogAdminArchiveProductTypeRequest;

  try {
    const data = await api.catalogAdminArchiveProductType(body);
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
| **productTypeId** | `string` | Product type ID | [Defaults to `undefined`] |

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Product type archived |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Product type not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminArchiveProductVariant

> CatalogStatusResponseDto catalogAdminArchiveProductVariant(variantId)

Archive a product variant

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminArchiveProductVariantRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Variant ID
    variantId: variantId_example,
  } satisfies CatalogAdminArchiveProductVariantRequest;

  try {
    const data = await api.catalogAdminArchiveProductVariant(body);
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
| **variantId** | `string` | Variant ID | [Defaults to `undefined`] |

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Variant archived |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Variant not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminArchiveTag

> CatalogStatusResponseDto catalogAdminArchiveTag(tagId)

Archive a tag

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminArchiveTagRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Tag ID
    tagId: tagId_example,
  } satisfies CatalogAdminArchiveTagRequest;

  try {
    const data = await api.catalogAdminArchiveTag(body);
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
| **tagId** | `string` | Tag ID | [Defaults to `undefined`] |

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Tag archived |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Tag not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminAttachMedia

> AttachedMediaResponseDto catalogAdminAttachMedia(productId, attachMediaDto)

Attach uploaded media to a product

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminAttachMediaRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Product ID
    productId: productId_example,
    // AttachMediaDto
    attachMediaDto: ...,
  } satisfies CatalogAdminAttachMediaRequest;

  try {
    const data = await api.catalogAdminAttachMedia(body);
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
| **productId** | `string` | Product ID | [Defaults to `undefined`] |
| **attachMediaDto** | [AttachMediaDto](AttachMediaDto.md) |  | |

### Return type

[**AttachedMediaResponseDto**](AttachedMediaResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Media attached successfully |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Product not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminCreateAttribute

> AdminCatalogAttributeDto catalogAdminCreateAttribute(createAttributeDto)

Create a new attribute

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminCreateAttributeRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // CreateAttributeDto
    createAttributeDto: ...,
  } satisfies CatalogAdminCreateAttributeRequest;

  try {
    const data = await api.catalogAdminCreateAttribute(body);
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
| **createAttributeDto** | [CreateAttributeDto](CreateAttributeDto.md) |  | |

### Return type

[**AdminCatalogAttributeDto**](AdminCatalogAttributeDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Attribute created |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminCreateBrand

> AdminCatalogBrandDto catalogAdminCreateBrand(createBrandDto)

Create a new brand

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminCreateBrandRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // CreateBrandDto
    createBrandDto: ...,
  } satisfies CatalogAdminCreateBrandRequest;

  try {
    const data = await api.catalogAdminCreateBrand(body);
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
| **createBrandDto** | [CreateBrandDto](CreateBrandDto.md) |  | |

### Return type

[**AdminCatalogBrandDto**](AdminCatalogBrandDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Brand created |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminCreateCategory

> AdminCatalogCategoryDto catalogAdminCreateCategory(createCategoryDto)

Create a new category

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminCreateCategoryRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // CreateCategoryDto
    createCategoryDto: ...,
  } satisfies CatalogAdminCreateCategoryRequest;

  try {
    const data = await api.catalogAdminCreateCategory(body);
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
| **createCategoryDto** | [CreateCategoryDto](CreateCategoryDto.md) |  | |

### Return type

[**AdminCatalogCategoryDto**](AdminCatalogCategoryDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Category created |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminCreateCollection

> AdminCatalogCollectionDto catalogAdminCreateCollection(createCollectionDto)

Create a new collection

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminCreateCollectionRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // CreateCollectionDto
    createCollectionDto: ...,
  } satisfies CatalogAdminCreateCollectionRequest;

  try {
    const data = await api.catalogAdminCreateCollection(body);
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
| **createCollectionDto** | [CreateCollectionDto](CreateCollectionDto.md) |  | |

### Return type

[**AdminCatalogCollectionDto**](AdminCatalogCollectionDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Collection created |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminCreateProduct

> AdminCatalogProductDto catalogAdminCreateProduct(createProductDto)

Create a new product

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminCreateProductRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // CreateProductDto
    createProductDto: ...,
  } satisfies CatalogAdminCreateProductRequest;

  try {
    const data = await api.catalogAdminCreateProduct(body);
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
| **createProductDto** | [CreateProductDto](CreateProductDto.md) |  | |

### Return type

[**AdminCatalogProductDto**](AdminCatalogProductDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Product created |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminCreateProductType

> AdminCatalogProductTypeDto catalogAdminCreateProductType(createProductTypeDto)

Create a new product type

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminCreateProductTypeRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // CreateProductTypeDto
    createProductTypeDto: ...,
  } satisfies CatalogAdminCreateProductTypeRequest;

  try {
    const data = await api.catalogAdminCreateProductType(body);
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
| **createProductTypeDto** | [CreateProductTypeDto](CreateProductTypeDto.md) |  | |

### Return type

[**AdminCatalogProductTypeDto**](AdminCatalogProductTypeDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Product type created |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminCreateProductVariant

> AdminCatalogVariantDto catalogAdminCreateProductVariant(productId, createProductVariantDto)

Create a new product variant

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminCreateProductVariantRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Product ID
    productId: productId_example,
    // CreateProductVariantDto
    createProductVariantDto: ...,
  } satisfies CatalogAdminCreateProductVariantRequest;

  try {
    const data = await api.catalogAdminCreateProductVariant(body);
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
| **productId** | `string` | Product ID | [Defaults to `undefined`] |
| **createProductVariantDto** | [CreateProductVariantDto](CreateProductVariantDto.md) |  | |

### Return type

[**AdminCatalogVariantDto**](AdminCatalogVariantDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Product variant created |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Product not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminCreateTag

> AdminCatalogTagDto catalogAdminCreateTag(createTagDto)

Create a new tag

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminCreateTagRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // CreateTagDto
    createTagDto: ...,
  } satisfies CatalogAdminCreateTagRequest;

  try {
    const data = await api.catalogAdminCreateTag(body);
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
| **createTagDto** | [CreateTagDto](CreateTagDto.md) |  | |

### Return type

[**AdminCatalogTagDto**](AdminCatalogTagDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Tag created |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminGetProduct

> AdminCatalogProductDto catalogAdminGetProduct(productId)

Get a single product by ID

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminGetProductRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Product ID
    productId: productId_example,
  } satisfies CatalogAdminGetProductRequest;

  try {
    const data = await api.catalogAdminGetProduct(body);
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
| **productId** | `string` | Product ID | [Defaults to `undefined`] |

### Return type

[**AdminCatalogProductDto**](AdminCatalogProductDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Product details |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Product not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminIssueMediaUploadIntent

> MediaUploadIntentResponseDto catalogAdminIssueMediaUploadIntent(productId, createMediaUploadIntentDto)

Issue a media upload intent for a product

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminIssueMediaUploadIntentRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Product ID
    productId: productId_example,
    // CreateMediaUploadIntentDto
    createMediaUploadIntentDto: ...,
  } satisfies CatalogAdminIssueMediaUploadIntentRequest;

  try {
    const data = await api.catalogAdminIssueMediaUploadIntent(body);
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
| **productId** | `string` | Product ID | [Defaults to `undefined`] |
| **createMediaUploadIntentDto** | [CreateMediaUploadIntentDto](CreateMediaUploadIntentDto.md) |  | |

### Return type

[**MediaUploadIntentResponseDto**](MediaUploadIntentResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Media upload intent created |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Product not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminListAttributes

> Array&lt;AdminCatalogAttributeDto&gt; catalogAdminListAttributes()

List all attributes

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminListAttributesRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  try {
    const data = await api.catalogAdminListAttributes();
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

[**Array&lt;AdminCatalogAttributeDto&gt;**](AdminCatalogAttributeDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | All attributes |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminListBrands

> Array&lt;AdminCatalogBrandDto&gt; catalogAdminListBrands()

List all brands

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminListBrandsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  try {
    const data = await api.catalogAdminListBrands();
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

[**Array&lt;AdminCatalogBrandDto&gt;**](AdminCatalogBrandDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | All brands |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminListCategories

> Array&lt;AdminCatalogCategoryDto&gt; catalogAdminListCategories()

List all categories

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminListCategoriesRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  try {
    const data = await api.catalogAdminListCategories();
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

[**Array&lt;AdminCatalogCategoryDto&gt;**](AdminCatalogCategoryDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | All categories |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminListCollections

> Array&lt;AdminCatalogCollectionDto&gt; catalogAdminListCollections()

List all collections

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminListCollectionsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  try {
    const data = await api.catalogAdminListCollections();
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

[**Array&lt;AdminCatalogCollectionDto&gt;**](AdminCatalogCollectionDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | All collections |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminListProductTypes

> Array&lt;AdminCatalogProductTypeDto&gt; catalogAdminListProductTypes()

List all product types

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminListProductTypesRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  try {
    const data = await api.catalogAdminListProductTypes();
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

[**Array&lt;AdminCatalogProductTypeDto&gt;**](AdminCatalogProductTypeDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | All product types |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminListProducts

> AdminPaginatedCatalogProductsDto catalogAdminListProducts(cursor, limit, status, search)

List all products with pagination and filters

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminListProductsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string (optional)
    cursor: cursor_example,
    // number (optional)
    limit: 56,
    // 'DRAFT' | 'PUBLISHED' | 'ARCHIVED' (optional)
    status: status_example,
    // string (optional)
    search: search_example,
  } satisfies CatalogAdminListProductsRequest;

  try {
    const data = await api.catalogAdminListProducts(body);
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
| **cursor** | `string` |  | [Optional] [Defaults to `undefined`] |
| **limit** | `number` |  | [Optional] [Defaults to `20`] |
| **status** | `DRAFT`, `PUBLISHED`, `ARCHIVED` |  | [Optional] [Defaults to `undefined`] [Enum: DRAFT, PUBLISHED, ARCHIVED] |
| **search** | `string` |  | [Optional] [Defaults to `undefined`] |

### Return type

[**AdminPaginatedCatalogProductsDto**](AdminPaginatedCatalogProductsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Paginated product list |  -  |
| **400** | Invalid query parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminListTags

> Array&lt;AdminCatalogTagDto&gt; catalogAdminListTags()

List all tags

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminListTagsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  try {
    const data = await api.catalogAdminListTags();
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

[**Array&lt;AdminCatalogTagDto&gt;**](AdminCatalogTagDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | All tags |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminPublishBrand

> CatalogStatusResponseDto catalogAdminPublishBrand(brandId)

Publish a brand

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminPublishBrandRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Brand ID
    brandId: brandId_example,
  } satisfies CatalogAdminPublishBrandRequest;

  try {
    const data = await api.catalogAdminPublishBrand(body);
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
| **brandId** | `string` | Brand ID | [Defaults to `undefined`] |

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Brand published |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Brand not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminPublishCategory

> CatalogStatusResponseDto catalogAdminPublishCategory(categoryId)

Publish a category

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminPublishCategoryRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Category ID
    categoryId: categoryId_example,
  } satisfies CatalogAdminPublishCategoryRequest;

  try {
    const data = await api.catalogAdminPublishCategory(body);
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
| **categoryId** | `string` | Category ID | [Defaults to `undefined`] |

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Category published |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Category not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminPublishCollection

> CatalogStatusResponseDto catalogAdminPublishCollection(collectionId)

Publish a collection

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminPublishCollectionRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Collection ID
    collectionId: collectionId_example,
  } satisfies CatalogAdminPublishCollectionRequest;

  try {
    const data = await api.catalogAdminPublishCollection(body);
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
| **collectionId** | `string` | Collection ID | [Defaults to `undefined`] |

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Collection published |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Collection not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminPublishProduct

> CatalogStatusResponseDto catalogAdminPublishProduct(productId)

Publish a product

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminPublishProductRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Product ID
    productId: productId_example,
  } satisfies CatalogAdminPublishProductRequest;

  try {
    const data = await api.catalogAdminPublishProduct(body);
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
| **productId** | `string` | Product ID | [Defaults to `undefined`] |

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Product published |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Product not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminPublishProductType

> CatalogStatusResponseDto catalogAdminPublishProductType(productTypeId)

Publish a product type

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminPublishProductTypeRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Product type ID
    productTypeId: productTypeId_example,
  } satisfies CatalogAdminPublishProductTypeRequest;

  try {
    const data = await api.catalogAdminPublishProductType(body);
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
| **productTypeId** | `string` | Product type ID | [Defaults to `undefined`] |

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Product type published |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Product type not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminPublishProductVariant

> CatalogStatusResponseDto catalogAdminPublishProductVariant(variantId)

Publish a product variant

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminPublishProductVariantRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Variant ID
    variantId: variantId_example,
  } satisfies CatalogAdminPublishProductVariantRequest;

  try {
    const data = await api.catalogAdminPublishProductVariant(body);
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
| **variantId** | `string` | Variant ID | [Defaults to `undefined`] |

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Variant published |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Variant not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminPublishTag

> CatalogStatusResponseDto catalogAdminPublishTag(tagId)

Publish a tag

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminPublishTagRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Tag ID
    tagId: tagId_example,
  } satisfies CatalogAdminPublishTagRequest;

  try {
    const data = await api.catalogAdminPublishTag(body);
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
| **tagId** | `string` | Tag ID | [Defaults to `undefined`] |

### Return type

[**CatalogStatusResponseDto**](CatalogStatusResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Tag published |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Tag not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminUpdateProduct

> AdminCatalogProductDto catalogAdminUpdateProduct(productId, updateProductDto)

Update a product

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminUpdateProductRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Product ID
    productId: productId_example,
    // UpdateProductDto
    updateProductDto: ...,
  } satisfies CatalogAdminUpdateProductRequest;

  try {
    const data = await api.catalogAdminUpdateProduct(body);
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
| **productId** | `string` | Product ID | [Defaults to `undefined`] |
| **updateProductDto** | [UpdateProductDto](UpdateProductDto.md) |  | |

### Return type

[**AdminCatalogProductDto**](AdminCatalogProductDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Product updated |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Product not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogAdminUpdateProductVariant

> AdminCatalogVariantDto catalogAdminUpdateProductVariant(variantId, updateProductVariantDto)

Update a product variant

### Example

```ts
import {
  Configuration,
  CatalogAdminApi,
} from '@mag/generated-api-client';
import type { CatalogAdminUpdateProductVariantRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CatalogAdminApi(config);

  const body = {
    // string | Variant ID
    variantId: variantId_example,
    // UpdateProductVariantDto
    updateProductVariantDto: ...,
  } satisfies CatalogAdminUpdateProductVariantRequest;

  try {
    const data = await api.catalogAdminUpdateProductVariant(body);
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
| **variantId** | `string` | Variant ID | [Defaults to `undefined`] |
| **updateProductVariantDto** | [UpdateProductVariantDto](UpdateProductVariantDto.md) |  | |

### Return type

[**AdminCatalogVariantDto**](AdminCatalogVariantDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Product variant updated |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |
| **404** | Variant not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

