# mag_api_client.api.ReviewsAdminApi

## Load the API package
```dart
import 'package:mag_api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminReviewsGetReview**](ReviewsAdminApi.md#adminreviewsgetreview) | **GET** /api/v1/reviews/admin/{reviewId} | Get a single review by ID
[**adminReviewsListReviews**](ReviewsAdminApi.md#adminreviewslistreviews) | **GET** /api/v1/reviews/admin | List all reviews with pagination and filters
[**adminReviewsModerateReview**](ReviewsAdminApi.md#adminreviewsmoderatereview) | **PATCH** /api/v1/reviews/admin/{reviewId}/moderate | Moderate a review (approve, reject, flag, or hide)


# **adminReviewsGetReview**
> ReviewResponseDto adminReviewsGetReview(reviewId)

Get a single review by ID

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReviewsAdminApi();
final String reviewId = reviewId_example; // String | Review ID

try {
    final response = api.adminReviewsGetReview(reviewId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReviewsAdminApi->adminReviewsGetReview: $e\n');
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

# **adminReviewsListReviews**
> PaginatedReviewsDto adminReviewsListReviews(cursor, limit, status, productId, userId)

List all reviews with pagination and filters

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReviewsAdminApi();
final String cursor = cursor_example; // String | Pagination cursor
final int limit = 56; // int | Page size (max 100)
final String status = status_example; // String | Filter by review status
final String productId = productId_example; // String | Filter by product ID
final String userId = userId_example; // String | Filter by user ID (ignored for /me endpoint)

try {
    final response = api.adminReviewsListReviews(cursor, limit, status, productId, userId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReviewsAdminApi->adminReviewsListReviews: $e\n');
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

# **adminReviewsModerateReview**
> ReviewResponseDto adminReviewsModerateReview(reviewModerationDto, reviewId)

Moderate a review (approve, reject, flag, or hide)

### Example
```dart
import 'package:mag_api_client/api.dart';

final api = MagApiClient().getReviewsAdminApi();
final ReviewModerationDto reviewModerationDto = ; // ReviewModerationDto | 
final String reviewId = reviewId_example; // String | Review ID

try {
    final response = api.adminReviewsModerateReview(reviewModerationDto, reviewId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ReviewsAdminApi->adminReviewsModerateReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reviewModerationDto** | [**ReviewModerationDto**](ReviewModerationDto.md)|  | 
 **reviewId** | **String**| Review ID | 

### Return type

[**ReviewResponseDto**](ReviewResponseDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

