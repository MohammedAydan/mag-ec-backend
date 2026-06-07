# ContentApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**publicContentGetLegalReferences**](ContentApi.md#publiccontentgetlegalreferences) | **GET** /api/v1/content/legal-references | Get public legal reference page keys |
| [**publicContentGetPage**](ContentApi.md#publiccontentgetpage) | **GET** /api/v1/content/pages/{slug} | Get a published content page by its slug |



## publicContentGetLegalReferences

> LegalReferencesResponseDto publicContentGetLegalReferences()

Get public legal reference page keys

### Example

```ts
import {
  Configuration,
  ContentApi,
} from '@mag/generated-api-client';
import type { PublicContentGetLegalReferencesRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new ContentApi();

  try {
    const data = await api.publicContentGetLegalReferences();
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

[**LegalReferencesResponseDto**](LegalReferencesResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Public legal references |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## publicContentGetPage

> ContentPageResponseDto publicContentGetPage(slug)

Get a published content page by its slug

### Example

```ts
import {
  Configuration,
  ContentApi,
} from '@mag/generated-api-client';
import type { PublicContentGetPageRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new ContentApi();

  const body = {
    // string | Content page slug
    slug: slug_example,
  } satisfies PublicContentGetPageRequest;

  try {
    const data = await api.publicContentGetPage(body);
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
| **slug** | `string` | Content page slug | [Defaults to `undefined`] |

### Return type

[**ContentPageResponseDto**](ContentPageResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Published content page |  -  |
| **404** | Content page not found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

