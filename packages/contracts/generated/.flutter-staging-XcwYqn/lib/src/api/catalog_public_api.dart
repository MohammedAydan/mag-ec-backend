//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:mag_api_client/src/api_util.dart';
import 'package:mag_api_client/src/model/catalog_product_summary_dto.dart';
import 'package:mag_api_client/src/model/paginated_catalog_products_dto.dart';

class CatalogPublicApi {

  final Dio _dio;

  final Serializers _serializers;

  const CatalogPublicApi(this._dio, this._serializers);

  /// Browse published products with optional filters
  /// 
  ///
  /// Parameters:
  /// * [page] 
  /// * [pageSize] 
  /// * [locale] 
  /// * [brandSlug] 
  /// * [categorySlug] 
  /// * [collectionSlug] 
  /// * [tagSlug] 
  /// * [productTypeKey] 
  /// * [optionKeys] - Comma-separated attribute option keys
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [PaginatedCatalogProductsDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<PaginatedCatalogProductsDto>> catalogPublicBrowseProducts({ 
    int? page = 1,
    int? pageSize = 12,
    String? locale = 'en',
    String? brandSlug,
    String? categorySlug,
    String? collectionSlug,
    String? tagSlug,
    String? productTypeKey,
    String? optionKeys,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/v1/catalog/products';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (page != null) r'page': encodeQueryParameter(_serializers, page, const FullType(int)),
      if (pageSize != null) r'pageSize': encodeQueryParameter(_serializers, pageSize, const FullType(int)),
      if (locale != null) r'locale': encodeQueryParameter(_serializers, locale, const FullType(String)),
      if (brandSlug != null) r'brandSlug': encodeQueryParameter(_serializers, brandSlug, const FullType(String)),
      if (categorySlug != null) r'categorySlug': encodeQueryParameter(_serializers, categorySlug, const FullType(String)),
      if (collectionSlug != null) r'collectionSlug': encodeQueryParameter(_serializers, collectionSlug, const FullType(String)),
      if (tagSlug != null) r'tagSlug': encodeQueryParameter(_serializers, tagSlug, const FullType(String)),
      if (productTypeKey != null) r'productTypeKey': encodeQueryParameter(_serializers, productTypeKey, const FullType(String)),
      if (optionKeys != null) r'optionKeys': encodeQueryParameter(_serializers, optionKeys, const FullType(String)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    PaginatedCatalogProductsDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(PaginatedCatalogProductsDto),
      ) as PaginatedCatalogProductsDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<PaginatedCatalogProductsDto>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Get a published product by its translated slug
  /// 
  ///
  /// Parameters:
  /// * [slug] - Translated product slug
  /// * [locale] - Locale code for translations (default: en)
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [CatalogProductSummaryDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<CatalogProductSummaryDto>> catalogPublicGetProductBySlug({ 
    required String slug,
    String? locale,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/v1/catalog/products/{slug}'.replaceAll('{' r'slug' '}', encodeQueryParameter(_serializers, slug, const FullType(String)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (locale != null) r'locale': encodeQueryParameter(_serializers, locale, const FullType(String)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    CatalogProductSummaryDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(CatalogProductSummaryDto),
      ) as CatalogProductSummaryDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<CatalogProductSummaryDto>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}
