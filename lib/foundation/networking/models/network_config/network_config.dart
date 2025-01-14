import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_config.freezed.dart';
part 'network_config.g.dart';

@freezed
class NetworkConfig with _$NetworkConfig {
  const factory NetworkConfig({
    required String baseUrl,
    @Default({}) Map<String, dynamic> headers,
    @Default(30000) int connectTimeout,
    @Default(30000) int receiveTimeout,
    @Default(true) bool enableLogging,
    @Default(true) bool enableCaching,
  }) = _NetworkConfig;

  factory NetworkConfig.fromJson(Map<String, dynamic> json) =>
      _$NetworkConfigFromJson(json);
}
