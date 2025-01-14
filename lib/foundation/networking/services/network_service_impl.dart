// lib/features/networking/services/network_service_impl.dart
import 'package:dio/dio.dart';
import '../models/network_config/network_config.dart';
import '../interceptors/auth_interceptor.dart';
import '../interceptors/cache_interceptor.dart';
import '../interceptors/logger_interceptor.dart';
import 'network_service.dart';
import 'cache_service.dart';

class NetworkServiceImpl implements NetworkService {
  late final Dio _dio;
  final CacheService _cacheService;
  final Future<String?> Function() _getToken;
  final Future<String?> Function() _refreshToken;
  final void Function() _onUnauthorized;

  NetworkServiceImpl({
    required CacheService cacheService,
    required Future<String?> Function() getToken,
    required Future<String?> Function() refreshToken,
    required void Function() onUnauthorized,
  })  : _cacheService = cacheService,
        _getToken = getToken,
        _refreshToken = refreshToken,
        _onUnauthorized = onUnauthorized;

  @override
  Future<void> initialize(NetworkConfig config) async {
    _dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        headers: config.headers,
        connectTimeout: Duration(milliseconds: config.connectTimeout),
        receiveTimeout: Duration(milliseconds: config.receiveTimeout),
        contentType: 'application/json',
      ),
    );

    // Add interceptors based on config
    if (config.enableLogging) {
      _dio.interceptors.add(LoggerInterceptor());
    }

    if (config.enableCaching) {
      _dio.interceptors.add(
        CacheInterceptor(
          cacheService: _cacheService,
          cacheDuration: const Duration(hours: 1),
        ),
      );
    }

    _dio.interceptors.add(
      AuthInterceptor(
        getToken: _getToken,
        refreshToken: _refreshToken,
        onUnauthorized: _onUnauthorized,
      ),
    );
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
