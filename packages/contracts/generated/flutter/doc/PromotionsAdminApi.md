# mag_api_client.api.PromotionsAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**promotionsAdminGetPromotion**](PromotionsAdminApi.md#promotionsadmingetpromotion) | **GET** /api/v1/promotions/admin/{promotionId} | Get a single promotion by ID
[**promotionsAdminListPromotions**](PromotionsAdminApi.md#promotionsadminlistpromotions) | **GET** /api/v1/promotions/admin | List all promotions
[**promotionsAdminUpsertCoupon**](PromotionsAdminApi.md#promotionsadminupsertcoupon) | **PUT** /api/v1/promotions/admin/{promotionId}/coupons/{code} | Create or update a coupon for a promotion
[**promotionsAdminUpsertPromotion**](PromotionsAdminApi.md#promotionsadminupsertpromotion) | **PUT** /api/v1/promotions/admin/by-key/{promotionKey} | Create or update a promotion by key


# **promotionsAdminGetPromotion**
> PromotionResponseDto promotionsAdminGetPromotion(promotionId)

Get a single promotion by ID

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPromotionsAdminApi();
final String promotionId = promotionId_example; // String | Promotion ID

try {
    final response = api.promotionsAdminGetPromotion(promotionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PromotionsAdminApi->promotionsAdminGetPromotion: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **promotionId** | **String**| Promotion ID | 

### Return type

[**PromotionResponseDto**](PromotionResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **promotionsAdminListPromotions**
> BuiltList<PromotionResponseDto> promotionsAdminListPromotions()

List all promotions

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPromotionsAdminApi();

try {
    final response = api.promotionsAdminListPromotions();
    print(response);
} on DioException catch (e) {
    print('Exception when calling PromotionsAdminApi->promotionsAdminListPromotions: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;PromotionResponseDto&gt;**](PromotionResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **promotionsAdminUpsertCoupon**
> CouponResponseDto promotionsAdminUpsertCoupon(upsertCouponDto, promotionId, code)

Create or update a coupon for a promotion

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPromotionsAdminApi();
final UpsertCouponDto upsertCouponDto = ; // UpsertCouponDto | 
final String promotionId = promotionId_example; // String | Promotion ID
final String code = code_example; // String | Coupon code

try {
    final response = api.promotionsAdminUpsertCoupon(upsertCouponDto, promotionId, code);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PromotionsAdminApi->promotionsAdminUpsertCoupon: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **upsertCouponDto** | [**UpsertCouponDto**](UpsertCouponDto.md)|  | 
 **promotionId** | **String**| Promotion ID | 
 **code** | **String**| Coupon code | 

### Return type

[**CouponResponseDto**](CouponResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **promotionsAdminUpsertPromotion**
> PromotionResponseDto promotionsAdminUpsertPromotion(upsertPromotionDto, promotionKey)

Create or update a promotion by key

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getPromotionsAdminApi();
final UpsertPromotionDto upsertPromotionDto = ; // UpsertPromotionDto | 
final String promotionKey = promotionKey_example; // String | Unique promotion key

try {
    final response = api.promotionsAdminUpsertPromotion(upsertPromotionDto, promotionKey);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PromotionsAdminApi->promotionsAdminUpsertPromotion: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **upsertPromotionDto** | [**UpsertPromotionDto**](UpsertPromotionDto.md)|  | 
 **promotionKey** | **String**| Unique promotion key | 

### Return type

[**PromotionResponseDto**](PromotionResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

