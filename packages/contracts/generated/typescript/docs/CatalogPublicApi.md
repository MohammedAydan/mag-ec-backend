# CatalogPublicApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**catalogPublicBrowseProducts**](CatalogPublicApi.md#catalogpublicbrowseproducts) | **GET** /api/v1/catalog/products | Browse published products with optional filters |
| [**catalogPublicGetProductBySlug**](CatalogPublicApi.md#catalogpublicgetproductbyslug) | **GET** /api/v1/catalog/products/{slug} | Get a published product by its translated slug |



## catalogPublicBrowseProducts

> PaginatedCatalogProductsDto catalogPublicBrowseProducts(page, pageSize, locale, brandSlug, categorySlug, collectionSlug, tagSlug, productTypeKey, optionKeys)

Browse published products with optional filters

### Example

```ts
import {
  Configuration,
  CatalogPublicApi,
} from '@mag/generated-api-client';
import type { CatalogPublicBrowseProductsRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new CatalogPublicApi();

  const body = {
    // number (optional)
    page: 56,
    // number (optional)
    pageSize: 56,
    // string (optional)
    locale: locale_example,
    // string (optional)
    brandSlug: brandSlug_example,
    // string (optional)
    categorySlug: categorySlug_example,
    // string (optional)
    collectionSlug: collectionSlug_example,
    // string (optional)
    tagSlug: tagSlug_example,
    // string (optional)
    productTypeKey: productTypeKey_example,
    // string | Comma-separated attribute option keys (optional)
    optionKeys: optionKeys_example,
  } satisfies CatalogPublicBrowseProductsRequest;

  try {
    const data = await api.catalogPublicBrowseProducts(body);
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
| **page** | `number` |  | [Optional] [Defaults to `1`] |
| **pageSize** | `number` |  | [Optional] [Defaults to `12`] |
| **locale** | `string` |  | [Optional] [Defaults to `&#39;en&#39;`] |
| **brandSlug** | `string` |  | [Optional] [Defaults to `undefined`] |
| **categorySlug** | `string` |  | [Optional] [Defaults to `undefined`] |
| **collectionSlug** | `string` |  | [Optional] [Defaults to `undefined`] |
| **tagSlug** | `string` |  | [Optional] [Defaults to `undefined`] |
| **productTypeKey** | `string` |  | [Optional] [Defaults to `undefined`] |
| **optionKeys** | `string` | Comma-separated attribute option keys | [Optional] [Defaults to `undefined`] |

### Return type

[**PaginatedCatalogProductsDto**](PaginatedCatalogProductsDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Product browse results |  -  |
| **400** | Invalid query parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## catalogPublicGetProductBySlug

> CatalogProductSummaryDto catalogPublicGetProductBySlug(slug, locale)

Get a published product by its translated slug

### Example

```ts
import {
  Configuration,
  CatalogPublicApi,
} from '@mag/generated-api-client';
import type { CatalogPublicGetProductBySlugRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new CatalogPublicApi();

  const body = {
    // string | Translated product slug
    slug: slug_example,
    // string | Locale code for translations (default: en) (optional)
    locale: locale_example,
  } satisfies CatalogPublicGetProductBySlugRequest;

  try {
    const data = await api.catalogPublicGetProductBySlug(body);
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
| **slug** | `string` | Translated product slug | [Defaults to `undefined`] |
| **locale** | `string` | Locale code for translations (default: en) | [Optional] [Defaults to `undefined`] |

### Return type

[**CatalogProductSummaryDto**](CatalogProductSummaryDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Published product detail |  -  |
| **400** | Invalid locale parameter |  -  |
| **404** | Product not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

