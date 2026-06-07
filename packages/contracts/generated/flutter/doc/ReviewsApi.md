# mag_api_client.api.ReviewsApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**customerReviewsCreateReview**](ReviewsApi.md#customerreviewscreatereview) | **POST** /api/v1/reviews/order-lines/{orderLineId} | Create a verified purchase review for an order line
[**customerReviewsGetMyReview**](ReviewsApi.md#customerreviewsgetmyreview) | **GET** /api/v1/reviews/me/{reviewId} | Get a single review written by the authenticated customer
[**customerReviewsListMyReviews**](ReviewsApi.md#customerreviewslistmyreviews) | **GET** /api/v1/reviews/me | List reviews written by the authenticated customer


# **customerReviewsCreateReview**
> ReviewResponseDto customerReviewsCreateReview(createReviewDto, orderLineId)

Create a verified purchase review for an order line

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReviewsApi();
final CreateReviewDto createReviewDto = ; // CreateReviewDto | 
final String orderLineId = orderLineId_example; // String | Order line ID

try {
    final response = api.customerReviewsCreateReview(createReviewDto, orderLineId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReviewsApi->customerReviewsCreateReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createReviewDto** | [**CreateReviewDto**](CreateReviewDto.md)|  | 
 **orderLineId** | **String**| Order line ID | 

### Return type

[**ReviewResponseDto**](ReviewResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **customerReviewsGetMyReview**
> ReviewResponseDto customerReviewsGetMyReview(reviewId)

Get a single review written by the authenticated customer

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReviewsApi();
final String reviewId = reviewId_example; // String | Review ID

try {
    final response = api.customerReviewsGetMyReview(reviewId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReviewsApi->customerReviewsGetMyReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reviewId** | **String**| Review ID | 

### Return type

[**ReviewResponseDto**](ReviewResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **customerReviewsListMyReviews**
> PaginatedReviewsDto customerReviewsListMyReviews(cursor, limit, status, productId, userId)

List reviews written by the authenticated customer

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReviewsApi();
final String cursor = cursor_example; // String | Pagination cursor
final int limit = 56; // int | Page size (max 100)
final String status = status_example; // String | Filter by review status
final String productId = productId_example; // String | Filter by product ID
final String userId = userId_example; // String | Filter by user ID (ignored for /me endpoint)

try {
    final response = api.customerReviewsListMyReviews(cursor, limit, status, productId, userId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReviewsApi->customerReviewsListMyReviews: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cursor** | **String**| Pagination cursor | [optional] 
 **limit** | **int**| Page size (max 100) | [optional] [default to 20]
 **status** | **String**| Filter by review status | [optional] 
 **productId** | **String**| Filter by product ID | [optional] 
 **userId** | **String**| Filter by user ID (ignored for /me endpoint) | [optional] 

### Return type

[**PaginatedReviewsDto**](PaginatedReviewsDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

