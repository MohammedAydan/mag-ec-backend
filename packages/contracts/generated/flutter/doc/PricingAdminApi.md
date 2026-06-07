# mag_api_client.api.PricingAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**pricingAdminUpdatePricingBehavior**](PricingAdminApi.md#pricingadminupdatepricingbehavior) | **PUT** /api/v1/pricing/admin/settings/behavior | Update pricing behavior (tax inclusion, defaults)
[**pricingAdminUpdateStoreCurrency**](PricingAdminApi.md#pricingadminupdatestorecurrency) | **PUT** /api/v1/pricing/admin/settings/currency | Update the default store currency
[**pricingAdminUpsertManualTaxRate**](PricingAdminApi.md#pricingadminupsertmanualtaxrate) | **PUT** /api/v1/pricing/admin/tax-classes/{taxClassId}/rates/{countryCode} | Upsert a manual tax rate for a tax class and country
[**pricingAdminUpsertShippingMethod**](PricingAdminApi.md#pricingadminupsertshippingmethod) | **PUT** /api/v1/pricing/admin/shipping-zones/{zoneId}/methods/{key} | Upsert a shipping method within a shipping zone
[**pricingAdminUpsertShippingZone**](PricingAdminApi.md#pricingadminupsertshippingzone) | **PUT** /api/v1/pricing/admin/shipping-zones/{key} | Upsert a shipping zone by key
[**pricingAdminUpsertTaxClass**](PricingAdminApi.md#pricingadminupserttaxclass) | **PUT** /api/v1/pricing/admin/tax-classes/{key} | Upsert a tax class by key
[**pricingAdminUpsertVariantPrice**](PricingAdminApi.md#pricingadminupsertvariantprice) | **PUT** /api/v1/pricing/admin/variants/{variantId}/price | Upsert variant price for a given currency


# **pricingAdminUpdatePricingBehavior**
> StoreSettingResponseDto pricingAdminUpdatePricingBehavior(updatePricingBehaviorDto)

Update pricing behavior (tax inclusion, defaults)

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPricingAdminApi();
final UpdatePricingBehaviorDto updatePricingBehaviorDto = ; // UpdatePricingBehaviorDto | 

try {
    final response = api.pricingAdminUpdatePricingBehavior(updatePricingBehaviorDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PricingAdminApi->pricingAdminUpdatePricingBehavior: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updatePricingBehaviorDto** | [**UpdatePricingBehaviorDto**](UpdatePricingBehaviorDto.md)|  | 

### Return type

[**StoreSettingResponseDto**](StoreSettingResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pricingAdminUpdateStoreCurrency**
> StoreSettingResponseDto pricingAdminUpdateStoreCurrency(updateStoreCurrencyDto)

Update the default store currency

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPricingAdminApi();
final UpdateStoreCurrencyDto updateStoreCurrencyDto = ; // UpdateStoreCurrencyDto | 

try {
    final response = api.pricingAdminUpdateStoreCurrency(updateStoreCurrencyDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PricingAdminApi->pricingAdminUpdateStoreCurrency: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateStoreCurrencyDto** | [**UpdateStoreCurrencyDto**](UpdateStoreCurrencyDto.md)|  | 

### Return type

[**StoreSettingResponseDto**](StoreSettingResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pricingAdminUpsertManualTaxRate**
> ManualTaxRateResponseDto pricingAdminUpsertManualTaxRate(upsertManualTaxRateDto, taxClassId, countryCode)

Upsert a manual tax rate for a tax class and country

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPricingAdminApi();
final UpsertManualTaxRateDto upsertManualTaxRateDto = ; // UpsertManualTaxRateDto | 
final String taxClassId = taxClassId_example; // String | Unique identifier of the tax class
final String countryCode = countryCode_example; // String | ISO 3166-1 alpha-2 country code

try {
    final response = api.pricingAdminUpsertManualTaxRate(upsertManualTaxRateDto, taxClassId, countryCode);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PricingAdminApi->pricingAdminUpsertManualTaxRate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **upsertManualTaxRateDto** | [**UpsertManualTaxRateDto**](UpsertManualTaxRateDto.md)|  | 
 **taxClassId** | **String**| Unique identifier of the tax class | 
 **countryCode** | **String**| ISO 3166-1 alpha-2 country code | 

### Return type

[**ManualTaxRateResponseDto**](ManualTaxRateResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pricingAdminUpsertShippingMethod**
> ShippingMethodResponseDto pricingAdminUpsertShippingMethod(upsertShippingMethodDto, zoneId, key)

Upsert a shipping method within a shipping zone

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPricingAdminApi();
final UpsertShippingMethodDto upsertShippingMethodDto = ; // UpsertShippingMethodDto | 
final String zoneId = zoneId_example; // String | Unique identifier of the shipping zone
final String key = key_example; // String | Unique key of the shipping method

try {
    final response = api.pricingAdminUpsertShippingMethod(upsertShippingMethodDto, zoneId, key);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PricingAdminApi->pricingAdminUpsertShippingMethod: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **upsertShippingMethodDto** | [**UpsertShippingMethodDto**](UpsertShippingMethodDto.md)|  | 
 **zoneId** | **String**| Unique identifier of the shipping zone | 
 **key** | **String**| Unique key of the shipping method | 

### Return type

[**ShippingMethodResponseDto**](ShippingMethodResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pricingAdminUpsertShippingZone**
> ShippingZoneResponseDto pricingAdminUpsertShippingZone(upsertShippingZoneDto, key)

Upsert a shipping zone by key

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPricingAdminApi();
final UpsertShippingZoneDto upsertShippingZoneDto = ; // UpsertShippingZoneDto | 
final String key = key_example; // String | Unique key of the shipping zone

try {
    final response = api.pricingAdminUpsertShippingZone(upsertShippingZoneDto, key);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PricingAdminApi->pricingAdminUpsertShippingZone: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **upsertShippingZoneDto** | [**UpsertShippingZoneDto**](UpsertShippingZoneDto.md)|  | 
 **key** | **String**| Unique key of the shipping zone | 

### Return type

[**ShippingZoneResponseDto**](ShippingZoneResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pricingAdminUpsertTaxClass**
> TaxClassResponseDto pricingAdminUpsertTaxClass(upsertTaxClassDto, key)

Upsert a tax class by key

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPricingAdminApi();
final UpsertTaxClassDto upsertTaxClassDto = ; // UpsertTaxClassDto | 
final String key = key_example; // String | Unique key of the tax class

try {
    final response = api.pricingAdminUpsertTaxClass(upsertTaxClassDto, key);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PricingAdminApi->pricingAdminUpsertTaxClass: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **upsertTaxClassDto** | [**UpsertTaxClassDto**](UpsertTaxClassDto.md)|  | 
 **key** | **String**| Unique key of the tax class | 

### Return type

[**TaxClassResponseDto**](TaxClassResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pricingAdminUpsertVariantPrice**
> VariantPriceResponseDto pricingAdminUpsertVariantPrice(upsertVariantPriceDto, variantId)

Upsert variant price for a given currency

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPricingAdminApi();
final UpsertVariantPriceDto upsertVariantPriceDto = ; // UpsertVariantPriceDto | 
final String variantId = variantId_example; // String | Unique identifier of the catalog variant

try {
    final response = api.pricingAdminUpsertVariantPrice(upsertVariantPriceDto, variantId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PricingAdminApi->pricingAdminUpsertVariantPrice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **upsertVariantPriceDto** | [**UpsertVariantPriceDto**](UpsertVariantPriceDto.md)|  | 
 **variantId** | **String**| Unique identifier of the catalog variant | 

### Return type

[**VariantPriceResponseDto**](VariantPriceResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

