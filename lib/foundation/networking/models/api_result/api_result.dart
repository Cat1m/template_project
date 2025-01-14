// lib/features/networking/models/api_result.dart
import 'package:freezed_annotation/freezed_annotation.dart';

import '../network_error/network_error.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(NetworkError error) = Failure<T>;
}
