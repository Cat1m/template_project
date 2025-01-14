// lib/features/networking/interceptors/logger_interceptor.dart
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('🌐 REQUEST[${options.method}] => PATH: ${options.path}');
    }
    if (kDebugMode) {
      print('Headers:');
    }
    options.headers.forEach((key, value) {
      if (kDebugMode) {
        print('$key: $value');
      }
    });
    if (options.data != null) {
      if (kDebugMode) {
        print('Request Data:');
      }
      if (kDebugMode) {
        print(options.data);
      }
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        '✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
    }
    if (kDebugMode) {
      print('Response Data:');
    }
    if (kDebugMode) {
      print(response.data);
    }
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        '⚠️ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      );
    }
    if (kDebugMode) {
      print('Error Message:');
    }
    if (kDebugMode) {
      print(err.message);
    }
    return handler.next(err);
  }
}
