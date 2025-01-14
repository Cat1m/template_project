// lib/features/networking/interceptors/auth_interceptor.dart
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Future<String?> Function() getToken;
  final Future<String?> Function() refreshToken;
  final void Function() onUnauthorized;

  AuthInterceptor({
    required this.getToken,
    required this.refreshToken,
    required this.onUnauthorized,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Get the original request
      final options = err.requestOptions;

      try {
        // Try to refresh token
        final newToken = await refreshToken();
        if (newToken != null) {
          // Update auth header
          options.headers['Authorization'] = 'Bearer $newToken';

          // Retry original request with new token
          final dio = Dio();
          final response = await dio.fetch(options);
          return handler.resolve(response);
        }
      } catch (e) {
        // Token refresh failed
        onUnauthorized();
      }
    }
    return handler.next(err);
  }
}
