import 'package:dio/dio.dart';
import 'package:mag_api_client/mag_api_client.dart';

void main() async {
  try {
    final apiClient = MagApiClient(
      dio: Dio(BaseOptions(
        baseUrl: 'http://localhost:3003',
        headers: {
          'Content-Type': 'application/json',
        },
      )),
    );

    final accessToken = await tryAuth(apiClient);
    if (accessToken != null) {
      apiClient.dio.options.headers['Authorization'] = 'Bearer $accessToken';
    }
    await tryGetProducts(apiClient);
    await tryGetMyOrders(apiClient);
  } catch (e) {
    print('Error: $e');
  }
}

Future<String?> tryAuth(MagApiClient apiClient) async {
  try {
    final authClient = apiClient.getAuthenticationApi();

    final loginResponse = await authClient.authLogin(
      loginDto: LoginDto((b) {
        b.email = 'admin@gmail.com';
        b.password = 'Admin@123';
      }),
    );

    print('User email: ${loginResponse.data?.user.email}');
    print('Access token: ${loginResponse.data?.accessToken}');
    print('Refresh token: ${loginResponse.data?.refreshToken}');
    return loginResponse.data?.accessToken;
  } catch (e) {
    print('Auth Error: $e');
    return null;
  }
}

Future<void> tryGetProducts(MagApiClient apiClient) async {
  try {
    final catalog = apiClient.getCatalogPublicApi();
    final productsResponse = await catalog.catalogPublicBrowseProducts();

    print('Page: ${productsResponse.data?.page}');
    print('PageSize: ${productsResponse.data?.pageSize}');
    final names = productsResponse.data?.items.map((i) => i.name).toList();
    print('Products: $names');
  } catch (e) {
    print('Products Error: $e');
  }
}

Future<void> tryGetMyOrders(MagApiClient apiClient) async {
  try {
    print('Headers: ${apiClient.dio.options.headers}');
    final cartApi = apiClient.getPromotionsAdminApi();
    final p = await cartApi.promotionsAdminListPromotions();
    print('Orders: ${p.data?.map((o) => {o.name, o.description}).toList()}');
  } catch (e) {
    print('Orders Error: $e');
  }
}
