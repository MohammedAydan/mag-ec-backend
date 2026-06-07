# HealthApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**healthGetLiveness**](HealthApi.md#healthgetliveness) | **GET** /api/v1/health/liveness | Check API process liveness |
| [**healthGetReadiness**](HealthApi.md#healthgetreadiness) | **GET** /api/v1/health/readiness | Check API readiness including downstream dependencies |



## healthGetLiveness

> HealthLivenessResponseDto healthGetLiveness()

Check API process liveness

### Example

```ts
import {
  Configuration,
  HealthApi,
} from '@mag/generated-api-client';
import type { HealthGetLivenessRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new HealthApi();

  try {
    const data = await api.healthGetLiveness();
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

[**HealthLivenessResponseDto**](HealthLivenessResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | API process is alive |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## healthGetReadiness

> HealthReadinessResponseDto healthGetReadiness()

Check API readiness including downstream dependencies

### Example

```ts
import {
  Configuration,
  HealthApi,
} from '@mag/generated-api-client';
import type { HealthGetReadinessRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new HealthApi();

  try {
    const data = await api.healthGetReadiness();
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

[**HealthReadinessResponseDto**](HealthReadinessResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The Health Check is successful |  -  |
| **503** | The Health Check is not successful |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

