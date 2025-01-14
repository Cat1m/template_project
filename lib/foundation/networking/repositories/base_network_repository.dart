// lib/features/networking/repositories/base_network_repository.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/network_error/network_error.dart';
import '../services/connectivity_service.dart';

abstract class BaseNetworkRepository {
  final ConnectivityService _connectivityService;

  BaseNetworkRepository(this._connectivityService);

  Future<Either<NetworkError, T>> handleNetworkCall<T>(
    Future<T> Function() call,
  ) async {
    if (await _connectivityService.isConnected) {
      try {
        final response = await call();
        return Right(response);
      } catch (error) {
        return Left(_handleError(error));
      }
    } else {
      return const Left(NetworkError.noInternetConnection());
    }
  }

  NetworkError _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          return const NetworkError.requestCancelled();
        case DioExceptionType.connectionTimeout:
          return const NetworkError.requestTimeout();
        case DioExceptionType.unknown:
          return const NetworkError.noInternetConnection();
        case DioExceptionType.receiveTimeout:
          return const NetworkError.sendTimeout();
        case DioExceptionType.badResponse:
          switch (error.response?.statusCode) {
            case 400:
              return const NetworkError.badRequest();
            case 401:
              return const NetworkError.unauthorizedRequest();
            case 404:
              return NetworkError.notFound(
                  error.response?.data['message'] ?? 'Not found');
            case 409:
              return const NetworkError.conflict();
            case 500:
              return const NetworkError.internalServerError();
            default:
              return NetworkError.defaultError(
                error.response?.data['message'] ?? 'Unknown error occurred',
              );
          }
        default:
          return const NetworkError.unexpectedError();
      }
    } else {
      return const NetworkError.unexpectedError();
    }
  }
}
