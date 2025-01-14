// lib/features/networking/models/network_error.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_error.freezed.dart';

@freezed
class NetworkError with _$NetworkError {
  const factory NetworkError.requestCancelled() = RequestCancelled;
  const factory NetworkError.unauthorizedRequest() = UnauthorizedRequest;
  const factory NetworkError.badRequest() = BadRequest;
  const factory NetworkError.notFound(String reason) = NotFound;
  const factory NetworkError.methodNotAllowed() = MethodNotAllowed;
  const factory NetworkError.notAcceptable() = NotAcceptable;
  const factory NetworkError.requestTimeout() = RequestTimeout;
  const factory NetworkError.sendTimeout() = SendTimeout;
  const factory NetworkError.conflict() = Conflict;
  const factory NetworkError.internalServerError() = InternalServerError;
  const factory NetworkError.notImplemented() = NotImplemented;
  const factory NetworkError.serviceUnavailable() = ServiceUnavailable;
  const factory NetworkError.noInternetConnection() = NoInternetConnection;
  const factory NetworkError.formatException() = FormatException;
  const factory NetworkError.unableToProcess() = UnableToProcess;
  const factory NetworkError.defaultError(String error) = DefaultError;
  const factory NetworkError.unexpectedError() = UnexpectedError;
}
