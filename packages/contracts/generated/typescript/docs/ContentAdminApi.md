# ContentAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**adminContentGetLegalReferences**](ContentAdminApi.md#admincontentgetlegalreferences) | **GET** /api/v1/content/admin/legal-references | Get legal reference page key mappings |
| [**adminContentListPages**](ContentAdminApi.md#admincontentlistpages) | **GET** /api/v1/content/admin/pages | List all content pages |
| [**adminContentUpsertLegalReferences**](ContentAdminApi.md#admincontentupsertlegalreferences) | **PUT** /api/v1/content/admin/legal-references | Update legal reference page key mappings |
| [**adminContentUpsertPage**](ContentAdminApi.md#admincontentupsertpage) | **PUT** /api/v1/content/admin/pages/{key} | Create or update a content page |



## adminContentGetLegalReferences

> AdminLegalReferencesResponseDto adminContentGetLegalReferences()

Get legal reference page key mappings

### Example

```ts
import {
  Configuration,
  ContentAdminApi,
} from '@mag/generated-api-client';
import type { AdminContentGetLegalReferencesRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ContentAdminApi(config);

  try {
    const data = await api.adminContentGetLegalReferences();
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

[**AdminLegalReferencesResponseDto**](AdminLegalReferencesResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Legal references mapping |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminContentListPages

> Array&lt;ContentPageResponseDto&gt; adminContentListPages()

List all content pages

### Example

```ts
import {
  Configuration,
  ContentAdminApi,
} from '@mag/generated-api-client';
import type { AdminContentListPagesRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ContentAdminApi(config);

  try {
    const data = await api.adminContentListPages();
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

[**Array&lt;ContentPageResponseDto&gt;**](ContentPageResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | All content pages |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminContentUpsertLegalReferences

> AdminLegalReferencesResponseDto adminContentUpsertLegalReferences(updateLegalReferencesDto)

Update legal reference page key mappings

### Example

```ts
import {
  Configuration,
  ContentAdminApi,
} from '@mag/generated-api-client';
import type { AdminContentUpsertLegalReferencesRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ContentAdminApi(config);

  const body = {
    // UpdateLegalReferencesDto
    updateLegalReferencesDto: ...,
  } satisfies AdminContentUpsertLegalReferencesRequest;

  try {
    const data = await api.adminContentUpsertLegalReferences(body);
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
| **updateLegalReferencesDto** | [UpdateLegalReferencesDto](UpdateLegalReferencesDto.md) |  | |

### Return type

[**AdminLegalReferencesResponseDto**](AdminLegalReferencesResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Legal references updated |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## adminContentUpsertPage

> ContentPageResponseDto adminContentUpsertPage(key, upsertContentPageDto)

Create or update a content page

### Example

```ts
import {
  Configuration,
  ContentAdminApi,
} from '@mag/generated-api-client';
import type { AdminContentUpsertPageRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ContentAdminApi(config);

  const body = {
    // string | Content page key
    key: key_example,
    // UpsertContentPageDto
    upsertContentPageDto: ...,
  } satisfies AdminContentUpsertPageRequest;

  try {
    const data = await api.adminContentUpsertPage(body);
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
| **key** | `string` | Content page key | [Defaults to `undefined`] |
| **upsertContentPageDto** | [UpsertContentPageDto](UpsertContentPageDto.md) |  | |

### Return type

[**ContentPageResponseDto**](ContentPageResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Page upserted |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

