# PricingAdminApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**pricingAdminUpdatePricingBehavior**](PricingAdminApi.md#pricingadminupdatepricingbehavior) | **PUT** /api/v1/pricing/admin/settings/behavior | Update pricing behavior (tax inclusion, defaults) |
| [**pricingAdminUpdateStoreCurrency**](PricingAdminApi.md#pricingadminupdatestorecurrency) | **PUT** /api/v1/pricing/admin/settings/currency | Update the default store currency |
| [**pricingAdminUpsertManualTaxRate**](PricingAdminApi.md#pricingadminupsertmanualtaxrate) | **PUT** /api/v1/pricing/admin/tax-classes/{taxClassId}/rates/{countryCode} | Upsert a manual tax rate for a tax class and country |
| [**pricingAdminUpsertShippingMethod**](PricingAdminApi.md#pricingadminupsertshippingmethod) | **PUT** /api/v1/pricing/admin/shipping-zones/{zoneId}/methods/{key} | Upsert a shipping method within a shipping zone |
| [**pricingAdminUpsertShippingZone**](PricingAdminApi.md#pricingadminupsertshippingzone) | **PUT** /api/v1/pricing/admin/shipping-zones/{key} | Upsert a shipping zone by key |
| [**pricingAdminUpsertTaxClass**](PricingAdminApi.md#pricingadminupserttaxclass) | **PUT** /api/v1/pricing/admin/tax-classes/{key} | Upsert a tax class by key |
| [**pricingAdminUpsertVariantPrice**](PricingAdminApi.md#pricingadminupsertvariantprice) | **PUT** /api/v1/pricing/admin/variants/{variantId}/price | Upsert variant price for a given currency |



## pricingAdminUpdatePricingBehavior

> StoreSettingResponseDto pricingAdminUpdatePricingBehavior(updatePricingBehaviorDto)

Update pricing behavior (tax inclusion, defaults)

### Example

```ts
import {
  Configuration,
  PricingAdminApi,
} from '@mag/generated-api-client';
import type { PricingAdminUpdatePricingBehaviorRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PricingAdminApi(config);

  const body = {
    // UpdatePricingBehaviorDto
    updatePricingBehaviorDto: ...,
  } satisfies PricingAdminUpdatePricingBehaviorRequest;

  try {
    const data = await api.pricingAdminUpdatePricingBehavior(body);
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
| **updatePricingBehaviorDto** | [UpdatePricingBehaviorDto](UpdatePricingBehaviorDto.md) |  | |

### Return type

[**StoreSettingResponseDto**](StoreSettingResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Pricing behavior updated |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## pricingAdminUpdateStoreCurrency

> StoreSettingResponseDto pricingAdminUpdateStoreCurrency(updateStoreCurrencyDto)

Update the default store currency

### Example

```ts
import {
  Configuration,
  PricingAdminApi,
} from '@mag/generated-api-client';
import type { PricingAdminUpdateStoreCurrencyRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PricingAdminApi(config);

  const body = {
    // UpdateStoreCurrencyDto
    updateStoreCurrencyDto: ...,
  } satisfies PricingAdminUpdateStoreCurrencyRequest;

  try {
    const data = await api.pricingAdminUpdateStoreCurrency(body);
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
| **updateStoreCurrencyDto** | [UpdateStoreCurrencyDto](UpdateStoreCurrencyDto.md) |  | |

### Return type

[**StoreSettingResponseDto**](StoreSettingResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Store currency updated |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## pricingAdminUpsertManualTaxRate

> ManualTaxRateResponseDto pricingAdminUpsertManualTaxRate(taxClassId, countryCode, upsertManualTaxRateDto)

Upsert a manual tax rate for a tax class and country

### Example

```ts
import {
  Configuration,
  PricingAdminApi,
} from '@mag/generated-api-client';
import type { PricingAdminUpsertManualTaxRateRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PricingAdminApi(config);

  const body = {
    // string | Unique identifier of the tax class
    taxClassId: taxClassId_example,
    // string | ISO 3166-1 alpha-2 country code
    countryCode: countryCode_example,
    // UpsertManualTaxRateDto
    upsertManualTaxRateDto: ...,
  } satisfies PricingAdminUpsertManualTaxRateRequest;

  try {
    const data = await api.pricingAdminUpsertManualTaxRate(body);
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
| **taxClassId** | `string` | Unique identifier of the tax class | [Defaults to `undefined`] |
| **countryCode** | `string` | ISO 3166-1 alpha-2 country code | [Defaults to `undefined`] |
| **upsertManualTaxRateDto** | [UpsertManualTaxRateDto](UpsertManualTaxRateDto.md) |  | |

### Return type

[**ManualTaxRateResponseDto**](ManualTaxRateResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Manual tax rate upserted |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## pricingAdminUpsertShippingMethod

> ShippingMethodResponseDto pricingAdminUpsertShippingMethod(zoneId, key, upsertShippingMethodDto)

Upsert a shipping method within a shipping zone

### Example

```ts
import {
  Configuration,
  PricingAdminApi,
} from '@mag/generated-api-client';
import type { PricingAdminUpsertShippingMethodRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PricingAdminApi(config);

  const body = {
    // string | Unique identifier of the shipping zone
    zoneId: zoneId_example,
    // string | Unique key of the shipping method
    key: key_example,
    // UpsertShippingMethodDto
    upsertShippingMethodDto: ...,
  } satisfies PricingAdminUpsertShippingMethodRequest;

  try {
    const data = await api.pricingAdminUpsertShippingMethod(body);
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
| **zoneId** | `string` | Unique identifier of the shipping zone | [Defaults to `undefined`] |
| **key** | `string` | Unique key of the shipping method | [Defaults to `undefined`] |
| **upsertShippingMethodDto** | [UpsertShippingMethodDto](UpsertShippingMethodDto.md) |  | |

### Return type

[**ShippingMethodResponseDto**](ShippingMethodResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Shipping method upserted |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## pricingAdminUpsertShippingZone

> ShippingZoneResponseDto pricingAdminUpsertShippingZone(key, upsertShippingZoneDto)

Upsert a shipping zone by key

### Example

```ts
import {
  Configuration,
  PricingAdminApi,
} from '@mag/generated-api-client';
import type { PricingAdminUpsertShippingZoneRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PricingAdminApi(config);

  const body = {
    // string | Unique key of the shipping zone
    key: key_example,
    // UpsertShippingZoneDto
    upsertShippingZoneDto: ...,
  } satisfies PricingAdminUpsertShippingZoneRequest;

  try {
    const data = await api.pricingAdminUpsertShippingZone(body);
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
| **key** | `string` | Unique key of the shipping zone | [Defaults to `undefined`] |
| **upsertShippingZoneDto** | [UpsertShippingZoneDto](UpsertShippingZoneDto.md) |  | |

### Return type

[**ShippingZoneResponseDto**](ShippingZoneResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Shipping zone upserted |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## pricingAdminUpsertTaxClass

> TaxClassResponseDto pricingAdminUpsertTaxClass(key, upsertTaxClassDto)

Upsert a tax class by key

### Example

```ts
import {
  Configuration,
  PricingAdminApi,
} from '@mag/generated-api-client';
import type { PricingAdminUpsertTaxClassRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PricingAdminApi(config);

  const body = {
    // string | Unique key of the tax class
    key: key_example,
    // UpsertTaxClassDto
    upsertTaxClassDto: ...,
  } satisfies PricingAdminUpsertTaxClassRequest;

  try {
    const data = await api.pricingAdminUpsertTaxClass(body);
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
| **key** | `string` | Unique key of the tax class | [Defaults to `undefined`] |
| **upsertTaxClassDto** | [UpsertTaxClassDto](UpsertTaxClassDto.md) |  | |

### Return type

[**TaxClassResponseDto**](TaxClassResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Tax class upserted |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## pricingAdminUpsertVariantPrice

> VariantPriceResponseDto pricingAdminUpsertVariantPrice(variantId, upsertVariantPriceDto)

Upsert variant price for a given currency

### Example

```ts
import {
  Configuration,
  PricingAdminApi,
} from '@mag/generated-api-client';
import type { PricingAdminUpsertVariantPriceRequest } from '@mag/generated-api-client';

async function example() {
  console.log("🚀 Testing @mag/generated-api-client SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: bearer
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PricingAdminApi(config);

  const body = {
    // string | Unique identifier of the catalog variant
    variantId: variantId_example,
    // UpsertVariantPriceDto
    upsertVariantPriceDto: ...,
  } satisfies PricingAdminUpsertVariantPriceRequest;

  try {
    const data = await api.pricingAdminUpsertVariantPrice(body);
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
| **variantId** | `string` | Unique identifier of the catalog variant | [Defaults to `undefined`] |
| **upsertVariantPriceDto** | [UpsertVariantPriceDto](UpsertVariantPriceDto.md) |  | |

### Return type

[**VariantPriceResponseDto**](VariantPriceResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Variant price upserted |  -  |
| **400** | Invalid request body or parameters |  -  |
| **401** | Missing or invalid access token |  -  |
| **403** | Insufficient permissions |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

