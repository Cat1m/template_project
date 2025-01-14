// lib/features/networking/interceptors/cache_interceptor.dart
import 'package:dio/dio.dart';
import '../services/cache_service.dart';

class CacheInterceptor extends Interceptor {
  final CacheService cacheService;
  final Duration cacheDuration;

  CacheInterceptor({
    required this.cacheService,
    this.cacheDuration = const Duration(hours: 1),
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Only cache GET requests
    if (options.method.toUpperCase() != 'GET') {
      return handler.next(options);
    }

    final cacheKey = _generateCacheKey(options);
    final cachedData = await cacheService.get(cacheKey);

    if (cachedData != null) {
      return handler.resolve(
        Response(
          requestOptions: options,
          data: cachedData,
          statusCode: 200,
        ),
      );
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // Only cache successful GET requests
    if (response.requestOptions.method.toUpperCase() == 'GET' &&
        response.statusCode == 200) {
      final cacheKey = _generateCacheKey(response.requestOptions);
      await cacheService.set(cacheKey, response.data, cacheDuration);
    }

    return handler.next(response);
  }

  String _generateCacheKey(RequestOptions options) {
    return '${options.method}:${options.uri}:${options.data.hashCode}';
  }
}
