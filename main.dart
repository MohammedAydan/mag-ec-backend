// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:ecommerce_api_client/ecommerce_api_client.dart';

// final _stopwatch = Stopwatch()..start();
// final _results = <TestResult>[];

// void main() async {
//   print('');
//   print('=' * 70);
//   print('  E-Commerce API SDK — Comprehensive Integration Test');
//   print('=' * 70);
//   print('');

//   final apiClient = EcommerceApiClient(
//     basePathOverride: 'http://localhost:3003',
//   );
//   apiClient.dio.options.connectTimeout = const Duration(seconds: 10);
//   apiClient.dio.options.receiveTimeout = const Duration(seconds: 15);

//   await _runSuite(apiClient);

//   _generateReport();
// }

// Future<void> _runSuite(EcommerceApiClient apiClient) async {
//   final health = apiClient.getHealthApi();
//   final auth = apiClient.getAuthenticationApi();
//   final catalogPublic = apiClient.getCatalogPublicApi();
//   final content = apiClient.getContentApi();
//   final pricingPublic = apiClient.getPricingPublicApi();

//   // ── 1. HEALTH ──────────────────────────────────────────────────
//   print('[1/10] Health endpoints');
//   await _test(
//     'Health — Liveness',
//     () => health.healthGetLiveness(),
//     expect200: true,
//     section: 'Health',
//   );
//   await _test(
//     'Health — Readiness',
//     () => health.healthGetReadiness(),
//     expect200: true,
//     section: 'Health',
//   );

//   // ── 2. AUTHENTICATION ──────────────────────────────────────────
//   print('\n[2/10] Authentication');
//   String? accessToken;
//   String? refreshTokenStr;
//   await _test(
//     'Auth — Login (admin)',
//     () => auth.authLogin(
//       loginDto: LoginDto((b) => b
//         ..email = 'admin@gmail.com'
//         ..password = 'Admin@123'),
//     ),
//     expect200: true,
//     section: 'Auth',
//     onSuccess: (res) {
//       final d = res.data;
//       if (d is AuthResponseDto) {
//         accessToken = d.accessToken;
//         refreshTokenStr = d.refreshToken;
//         if (accessToken != null) {
//           apiClient.setBearerAuth('bearer', accessToken!);
//         }
//       }
//     },
//   );

//   if (accessToken != null) {
//     await _test(
//       'Auth — Get current user (/auth/me)',
//       () => auth.authGetCurrentUser(),
//       expect200: true,
//       section: 'Auth',
//     );

//     // Token refresh
//     if (refreshTokenStr != null) {
//       await _test(
//         'Auth — Refresh token',
//         () => auth.authRefresh(
//           refreshTokenDto: RefreshTokenDto((b) => b
//             ..refreshToken = refreshTokenStr!),
//         ),
//         section: 'Auth',
//       );
//     }

//     await _test(
//       'Auth — Request email verification',
//       () => auth.authRequestEmailVerification(),
//       section: 'Auth',
//     );
//   }

//   // Negative test — bad credentials
//   await _test(
//     'Auth — Login (bad password)',
//     () => auth.authLogin(
//       loginDto: LoginDto((b) => b
//         ..email = 'admin@gmail.com'
//         ..password = 'wrong-password-12345'),
//     ),
//     expect4xx: true,
//     section: 'Auth',
//   );

//   // ── 3. PUBLIC CATALOG ──────────────────────────────────────────
//   print('\n[3/10] Public Catalog');
//   await _test(
//     'Catalog — Browse products',
//     () => catalogPublic.catalogPublicBrowseProducts(locale: 'en', pageSize: 5),
//     expect200: true,
//     section: 'Catalog Public',
//     onSuccess: (res) {
//       final d = res.data;
//       if (d != null) {
//         final products = (d as dynamic).data ?? <dynamic>[];
//         print('         Found ${products.length} product(s)');
//       }
//     },
//   );

//   // ── 4. PUBLIC CONTENT ──────────────────────────────────────────
//   print('\n[4/10] Public Content');
//   await _test(
//     'Content — Legal references',
//     () => content.publicContentGetLegalReferences(),
//     expect200: true,
//     section: 'Content',
//   );

//   // ── 5. PUBLIC PRICING PREVIEW ──────────────────────────────────
//   print('\n[5/10] Pricing Preview');
//   await _test(
//     'Pricing — Checkout preview (empty cart)',
//     () => pricingPublic.pricingPublicPreviewCheckout(
//       checkoutPreviewDto: CheckoutPreviewDto((b) => b
//         ..currencyCode = 'USD'
//         ..countryCode = 'US'),
//     ),
//     section: 'Pricing',
//   );

//   // ── 6. ADMIN ENDPOINTS (requires token) ────────────────────────
//   print('\n[6/10] Admin — Identity');
//   if (accessToken != null) {
//     final identityAdmin = apiClient.getIdentityAdminApi();
//     final identity = apiClient.getIdentityApi();

//     await _test(
//       'Identity — Admin access check',
//       () => identity.identityGetAdminAccessCheck(),
//       expect200: true,
//       section: 'Identity Admin',
//     );
//     await _test(
//       'Identity — List roles',
//       () => identityAdmin.adminAccessListRoles(),
//       expect200: true,
//       section: 'Identity Admin',
//     );
//     await _test(
//       'Identity — List permissions',
//       () => identityAdmin.adminAccessListPermissions(),
//       expect200: true,
//       section: 'Identity Admin',
//     );
//     await _test(
//       'Identity — List customers',
//       () => identityAdmin.adminAccessListCustomers(),
//       expect200: true,
//       section: 'Identity Admin',
//     );
//     await _test(
//       'Identity — List staff',
//       () => identityAdmin.adminAccessListStaff(),
//       expect200: true,
//       section: 'Identity Admin',
//     );

//     // ── 7. ADMIN — CATALOG ───────────────────────────────────
//     print('\n[7/10] Admin — Catalog');
//     final catalogAdmin = apiClient.getCatalogAdminApi();

//     await _test(
//       'Catalog Admin — List products',
//       () => catalogAdmin.catalogAdminListProducts(limit: 5),
//       expect200: true,
//       section: 'Catalog Admin',
//       onSuccess: (res) {
//         final d = res.data;
//         if (d != null) {
//           final products = (d as dynamic).data ?? <dynamic>[];
//           print('         Found ${products.length} product(s)');
//         }
//       },
//     );

//     await _test(
//       'Catalog Admin — List brands',
//       () => catalogAdmin.catalogAdminListBrands(),
//       expect200: true,
//       section: 'Catalog Admin',
//     );

//     // ── 8. ADMIN — PRICING / PROMOTIONS / INVENTORY ──────────
//     print('\n[8/10] Admin — Pricing, Promotions & Inventory');
//     final promotionsAdmin = apiClient.getPromotionsAdminApi();
//     final inventoryAdmin = apiClient.getInventoryAdminApi();

//     await _test(
//       'Promotions — List promotions',
//       () => promotionsAdmin.promotionsAdminListPromotions(),
//       expect200: true,
//       section: 'Promotions Admin',
//     );

//     await _test(
//       'Inventory — Get stock levels',
//       () => inventoryAdmin.inventoryAdminGetStockLevels(),
//       expect200: true,
//       section: 'Inventory Admin',
//     );

//     await _test(
//       'Inventory — Get stock reservations',
//       () => inventoryAdmin.inventoryAdminGetReservations(),
//       expect200: true,
//       section: 'Inventory Admin',
//     );

//     // ── 9. ADMIN — ORDERS / REPORTING / AUDIT ────────────────
//     print('\n[9/10] Admin — Orders, Reporting & Audit');
//     final ordersAdmin = apiClient.getOrdersAdminApi();
//     final reportingAdmin = apiClient.getReportingAdminApi();
//     final auditAdmin = apiClient.getAuditAdminApi();
//     final contentAdmin = apiClient.getContentAdminApi();
//     final paymentsAdmin = apiClient.getPaymentsAdminApi();
//     final commerceSupport = apiClient.getCommerceSupportAdminApi();

//     await _test(
//       'Orders — List orders',
//       () => ordersAdmin.adminOrdersListOrders(),
//       expect200: true,
//       section: 'Orders Admin',
//     );

//     await _test(
//       'Reporting — Sales summary',
//       () => reportingAdmin.adminReportingGetSalesSummary(),
//       expect200: true,
//       section: 'Reporting Admin',
//     );

//     await _test(
//       'Reporting — Top products',
//       () => reportingAdmin.adminReportingGetTopProducts(),
//       expect200: true,
//       section: 'Reporting Admin',
//     );

//     await _test(
//       'Reporting — Inventory KPIs',
//       () => reportingAdmin.adminReportingGetInventoryKpis(),
//       expect200: true,
//       section: 'Reporting Admin',
//     );

//     await _test(
//       'Reporting — Promotion performance',
//       () => reportingAdmin.adminReportingGetPromotionPerformance(),
//       expect200: true,
//       section: 'Reporting Admin',
//     );

//     await _test(
//       'Reporting — List exports',
//       () => reportingAdmin.adminReportingListExports(),
//       expect200: true,
//       section: 'Reporting Admin',
//     );

//     await _test(
//       'Audit — List audit logs',
//       () => auditAdmin.adminAuditListAuditLogs(),
//       expect200: true,
//       section: 'Audit Admin',
//     );

//     await _test(
//       'Content Admin — List pages',
//       () => contentAdmin.adminContentListPages(),
//       expect200: true,
//       section: 'Content Admin',
//     );

//     await _test(
//       'Content Admin — Legal references',
//       () => contentAdmin.adminContentGetLegalReferences(),
//       expect200: true,
//       section: 'Content Admin',
//     );

//     await _test(
//       'Payments — List attempts',
//       () => paymentsAdmin.adminPaymentsListAttempts(),
//       expect200: true,
//       section: 'Payments Admin',
//     );

//     await _test(
//       'Commerce Support — Active carts',
//       () => commerceSupport.commerceSupportAdminListActiveCarts(),
//       expect200: true,
//       section: 'Commerce Support',
//     );

//     await _test(
//       'Commerce Support — Wishlists',
//       () => commerceSupport.commerceSupportAdminListWishlists(),
//       expect200: true,
//       section: 'Commerce Support',
//     );

//     // ── 10. REVIEWS / NOTIFICATIONS ──────────────────────────
//     print('\n[10/10] Reviews & Notifications');
//     final reviewsAdmin = apiClient.getReviewsAdminApi();
//     final notificationsAdmin = apiClient.getNotificationsAdminApi();

//     await _test(
//       'Reviews Admin — List reviews',
//       () => reviewsAdmin.adminReviewsListReviews(),
//       expect200: true,
//       section: 'Reviews Admin',
//     );

//     await _test(
//       'Notifications Admin — List notifications',
//       () => notificationsAdmin.adminNotificationsListNotifications(),
//       expect200: true,
//       section: 'Notifications Admin',
//     );
//   } else {
//     print('         SKIPPED — no access token, admin tests cannot run');
//    }

//   // ── Negative: unauthenticated admin request ────────────────────
//   print('\n[NEG] Negative / Security Tests');
//   final bareClient = EcommerceApiClient(basePathOverride: 'http://localhost:3003');
//   bareClient.dio.options.connectTimeout = const Duration(seconds: 10);
//   await _test(
//     'Security — Admin endpoint without token',
//     () => bareClient.getIdentityAdminApi().adminAccessListRoles(),
//     expect4xx: true,
//     section: 'Security',
//   );
// }

// // ─────────────────────────────────────────────────────────────────
// // Test infrastructure
// // ─────────────────────────────────────────────────────────────────

// class TestResult {
//   final String name;
//   final String section;
//   final int? statusCode;
//   final Duration duration;
//   final bool passed;
//   final String? error;

//   TestResult({
//     required this.name,
//     required this.section,
//     this.statusCode,
//     required this.duration,
//     required this.passed,
//     this.error,
//   });
// }

// Future<void> _test(
//   String name,
//   Future<Response<Object?>> Function() call, {
//   bool expect200 = false,
//   bool expect4xx = false,
//   String section = '',
//   void Function(Response<Object?>)? onSuccess,
// }) async {
//   final sw = Stopwatch()..start();
//   try {
//     final res = await call();
//     sw.stop();

//     final code = res.statusCode ?? 0;
//     bool ok = true;

//     if (expect200 && code != 200) ok = false;
//     if (expect4xx && (code < 400 || code >= 500)) ok = false;

//     _results.add(TestResult(
//       name: name,
//       section: section,
//       statusCode: code,
//       duration: sw.elapsed,
//       passed: ok,
//     ));

//     final icon = ok ? 'PASS' : 'FAIL';
//     print('  [$icon] $name  →  HTTP $code  (${sw.elapsedMilliseconds}ms)');

//     if (!ok && expect200) {
//       print('         Expected 200 but got $code');
//     }
//     if (!ok && expect4xx) {
//       print('         Expected 4xx but got $code');
//     }
//     if (res.data is Map && (res.data as Map).containsKey('message')) {
//       print('         Message: ${(res.data as Map)['message']}');
//     }

//     if (ok && onSuccess != null) {
//       onSuccess(res);
//     }
//   } on DioException catch (e) {
//     sw.stop();
//     final code = e.response?.statusCode;
//     final errMsg = e.message ?? '$e';

//     // A 4xx is acceptable when we expect it
//     bool ok = expect4xx && code != null && code >= 400 && code < 500;

//     _results.add(TestResult(
//       name: name,
//       section: section,
//       statusCode: code,
//       duration: sw.elapsed,
//       passed: ok,
//       error: errMsg,
//     ));

//     final icon = ok ? 'PASS' : 'FAIL';
//     final codeStr = code != null ? 'HTTP $code' : 'NO RESPONSE';
//     print('  [$icon] $name  →  $codeStr  (${sw.elapsedMilliseconds}ms)');
//     if (!ok) {
//       print('         Error: $errMsg');
//     }
//   } catch (e) {
//     sw.stop();
//     _results.add(TestResult(
//       name: name,
//       section: section,
//       duration: sw.elapsed,
//       passed: false,
//       error: '$e',
//     ));
//     print('  [FAIL] $name  →  EXCEPTION  (${sw.elapsedMilliseconds}ms)');
//     print('         $e');
//   }
// }

// // ─────────────────────────────────────────────────────────────────
// // Report
// // ─────────────────────────────────────────────────────────────────

// void _generateReport() {
//   _stopwatch.stop();
//   final passed = _results.where((r) => r.passed).length;
//   final failed = _results.where((r) => !r.passed).length;
//   final total = _results.length;
//   final pct = total > 0 ? (passed / total * 100).toStringAsFixed(1) : '0.0';

//   // Group by section
//   final sections = <String, List<TestResult>>{};
//   for (final r in _results) {
//     sections.putIfAbsent(r.section, () => []).add(r);
//   }

//   print('');
//   print('=' * 70);
//   print('  TEST REPORT');
//   print('=' * 70);
//   print('');
//   print('  Date/Time   : ${DateTime.now().toIso8601String()}');
//   print('  Total tests : $total');
//   print('  Passed      : $passed');
//   print('  Failed      : $failed');
//   print('  Success rate: $pct%');
//   print('  Total time  : ${_stopwatch.elapsedMilliseconds}ms');
//   print('');
//   print('  Results by section:');
//   print('  ${'Section'.padRight(24)} ${'Pass'.padRight(6)} ${'Fail'.padRight(6)} ${'Rate'.padRight(6)}');
//   print('  ${'-' * 48}');

//   final sortedSections = sections.keys.toList()..sort();
//   for (final sec in sortedSections) {
//     final secResults = sections[sec]!;
//     final secPassed = secResults.where((r) => r.passed).length;
//     final secFailed = secResults.where((r) => !r.passed).length;
//     final secTotal = secResults.length;
//     final secPct = secTotal > 0 ? (secPassed / secTotal * 100).toStringAsFixed(0) : '0';
//     final icon = secFailed == 0 ? '✓' : '✗';
//     print('  $icon ${sec.padRight(22)} ${'$secPassed'.padRight(6)} ${'$secFailed'.padRight(6)} ${'$secPct%'.padRight(6)}');
//   }

//   if (failed > 0) {
//     print('');
//     print('  FAILURES:');
//     final sep = '-' * 70;
//     print('  $sep');
//     for (final r in _results.where((r) => !r.passed)) {
//       final code = r.statusCode != null ? 'HTTP ${r.statusCode}' : 'ERR';
//       print('  [${r.section}] ${r.name} — $code');
//       if (r.error != null) {
//         print('    ${r.error}');
//       }
//     }
//   }

//   print('');
//   print('=' * 70);
//   if (failed == 0) {
//     print('  RESULT: ALL TESTS PASSED');
//   } else {
//     print('  RESULT: $failed/$total TESTS FAILED');
//   }
//   print('=' * 70);
//   print('');

//   if (failed > 0) {
//     exit(1);
//   }
// }
