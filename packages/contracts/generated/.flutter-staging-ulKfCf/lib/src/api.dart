//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:mag_api_client/src/serializers.dart';
import 'package:mag_api_client/src/auth/api_key_auth.dart';
import 'package:mag_api_client/src/auth/basic_auth.dart';
import 'package:mag_api_client/src/auth/bearer_auth.dart';
import 'package:mag_api_client/src/auth/oauth.dart';
import 'package:mag_api_client/src/api/audit_admin_api.dart';
import 'package:mag_api_client/src/api/authentication_api.dart';
import 'package:mag_api_client/src/api/carts_api.dart';
import 'package:mag_api_client/src/api/catalog_admin_api.dart';
import 'package:mag_api_client/src/api/catalog_public_api.dart';
import 'package:mag_api_client/src/api/checkout_api.dart';
import 'package:mag_api_client/src/api/commerce_support_admin_api.dart';
import 'package:mag_api_client/src/api/content_api.dart';
import 'package:mag_api_client/src/api/content_admin_api.dart';
import 'package:mag_api_client/src/api/fulfillment_api.dart';
import 'package:mag_api_client/src/api/fulfillment_admin_api.dart';
import 'package:mag_api_client/src/api/health_api.dart';
import 'package:mag_api_client/src/api/identity_api.dart';
import 'package:mag_api_client/src/api/identity_admin_api.dart';
import 'package:mag_api_client/src/api/inventory_admin_api.dart';
import 'package:mag_api_client/src/api/notifications_api.dart';
import 'package:mag_api_client/src/api/notifications_admin_api.dart';
import 'package:mag_api_client/src/api/orders_api.dart';
import 'package:mag_api_client/src/api/orders_admin_api.dart';
import 'package:mag_api_client/src/api/payments_admin_api.dart';
import 'package:mag_api_client/src/api/pricing_admin_api.dart';
import 'package:mag_api_client/src/api/pricing_public_api.dart';
import 'package:mag_api_client/src/api/promotions_admin_api.dart';
import 'package:mag_api_client/src/api/reporting_admin_api.dart';
import 'package:mag_api_client/src/api/returns_api.dart';
import 'package:mag_api_client/src/api/returns_admin_api.dart';
import 'package:mag_api_client/src/api/reviews_api.dart';
import 'package:mag_api_client/src/api/reviews_admin_api.dart';
import 'package:mag_api_client/src/api/wishlist_api.dart';

class MagApiClient {
  static const String basePath = r'http://localhost';

  final Dio dio;
  final Serializers serializers;

  MagApiClient({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  /// Removes the OAuth token associated with the given [name].
  ///
  /// If no [OAuthInterceptor] is registered or no token exists for the given
  /// [name], this method has no effect.
  void removeOAuthToken(String name) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens.remove(name);
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  /// Removes the bearer authentication token associated with the given [name].
  ///
  /// If no [BearerAuthInterceptor] is registered or no token exists for the
  /// given [name], this method has no effect.
  void removeBearerAuth(String name) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens.remove(name);
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  /// Removes the basic authentication credentials associated with the given [name].
  ///
  /// If no [BasicAuthInterceptor] is registered or no credentials exist for the
  /// given [name], this method has no effect.
  void removeBasicAuth(String name) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo.remove(name);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Removes the API key associated with the given [name].
  ///
  /// If no [ApiKeyAuthInterceptor] is registered or no API key exists for the
  /// given [name], this method has no effect.
  void removeApiKey(String name) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys.remove(name);
    }
  }

  /// Get AuditAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuditAdminApi getAuditAdminApi() {
    return AuditAdminApi(dio, serializers);
  }

  /// Get AuthenticationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthenticationApi getAuthenticationApi() {
    return AuthenticationApi(dio, serializers);
  }

  /// Get CartsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CartsApi getCartsApi() {
    return CartsApi(dio, serializers);
  }

  /// Get CatalogAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CatalogAdminApi getCatalogAdminApi() {
    return CatalogAdminApi(dio, serializers);
  }

  /// Get CatalogPublicApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CatalogPublicApi getCatalogPublicApi() {
    return CatalogPublicApi(dio, serializers);
  }

  /// Get CheckoutApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CheckoutApi getCheckoutApi() {
    return CheckoutApi(dio, serializers);
  }

  /// Get CommerceSupportAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CommerceSupportAdminApi getCommerceSupportAdminApi() {
    return CommerceSupportAdminApi(dio, serializers);
  }

  /// Get ContentApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ContentApi getContentApi() {
    return ContentApi(dio, serializers);
  }

  /// Get ContentAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ContentAdminApi getContentAdminApi() {
    return ContentAdminApi(dio, serializers);
  }

  /// Get FulfillmentApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  FulfillmentApi getFulfillmentApi() {
    return FulfillmentApi(dio, serializers);
  }

  /// Get FulfillmentAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  FulfillmentAdminApi getFulfillmentAdminApi() {
    return FulfillmentAdminApi(dio, serializers);
  }

  /// Get HealthApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  HealthApi getHealthApi() {
    return HealthApi(dio, serializers);
  }

  /// Get IdentityApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  IdentityApi getIdentityApi() {
    return IdentityApi(dio, serializers);
  }

  /// Get IdentityAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  IdentityAdminApi getIdentityAdminApi() {
    return IdentityAdminApi(dio, serializers);
  }

  /// Get InventoryAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  InventoryAdminApi getInventoryAdminApi() {
    return InventoryAdminApi(dio, serializers);
  }

  /// Get NotificationsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  NotificationsApi getNotificationsApi() {
    return NotificationsApi(dio, serializers);
  }

  /// Get NotificationsAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  NotificationsAdminApi getNotificationsAdminApi() {
    return NotificationsAdminApi(dio, serializers);
  }

  /// Get OrdersApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  OrdersApi getOrdersApi() {
    return OrdersApi(dio, serializers);
  }

  /// Get OrdersAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  OrdersAdminApi getOrdersAdminApi() {
    return OrdersAdminApi(dio, serializers);
  }

  /// Get PaymentsAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PaymentsAdminApi getPaymentsAdminApi() {
    return PaymentsAdminApi(dio, serializers);
  }

  /// Get PricingAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PricingAdminApi getPricingAdminApi() {
    return PricingAdminApi(dio, serializers);
  }

  /// Get PricingPublicApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PricingPublicApi getPricingPublicApi() {
    return PricingPublicApi(dio, serializers);
  }

  /// Get PromotionsAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PromotionsAdminApi getPromotionsAdminApi() {
    return PromotionsAdminApi(dio, serializers);
  }

  /// Get ReportingAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ReportingAdminApi getReportingAdminApi() {
    return ReportingAdminApi(dio, serializers);
  }

  /// Get ReturnsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ReturnsApi getReturnsApi() {
    return ReturnsApi(dio, serializers);
  }

  /// Get ReturnsAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ReturnsAdminApi getReturnsAdminApi() {
    return ReturnsAdminApi(dio, serializers);
  }

  /// Get ReviewsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ReviewsApi getReviewsApi() {
    return ReviewsApi(dio, serializers);
  }

  /// Get ReviewsAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ReviewsAdminApi getReviewsAdminApi() {
    return ReviewsAdminApi(dio, serializers);
  }

  /// Get WishlistApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  WishlistApi getWishlistApi() {
    return WishlistApi(dio, serializers);
  }
}
