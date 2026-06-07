# PricingPublicApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**pricingPublicPreviewCheckout**](PricingPublicApi.md#pricingpublicpreviewcheckout) | **POST** /api/v1/pricing/checkout/preview | Preview checkout pricing, taxes, shipping, and promotions |



## pricingPublicPreviewCheckout

> PricingPreviewResponseDto pricingPublicPreviewCheckout(checkoutPreviewDto)

Preview checkout pricing, taxes, shipping, and promotions

### Example

```ts
import {
  Configuration,
  PricingPublicApi,
} from '@mag/generated-api-client';
import type { PricingPublicPreviewCheckoutRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const api = new PricingPublicApi();

  const body = {
    // CheckoutPreviewDto
    checkoutPreviewDto: ...,
  } satisfies PricingPublicPreviewCheckoutRequest;

  try {
    const data = await api.pricingPublicPreviewCheckout(body);
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
| **checkoutPreviewDto** | [CheckoutPreviewDto](CheckoutPreviewDto.md) |  | |

### Return type

[**PricingPreviewResponseDto**](PricingPreviewResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Checkout price preview computed |  -  |
| **400** | Invalid request body or parameters |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

