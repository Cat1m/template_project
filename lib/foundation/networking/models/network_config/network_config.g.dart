// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkConfigImpl _$$NetworkConfigImplFromJson(Map<String, dynamic> json) =>
    _$NetworkConfigImpl(
      baseUrl: json['baseUrl'] as String,
      headers: json['headers'] as Map<String, dynamic>? ?? const {},
      connectTimeout: (json['connectTimeout'] as num?)?.toInt() ?? 30000,
      receiveTimeout: (json['receiveTimeout'] as num?)?.toInt() ?? 30000,
      enableLogging: json['enableLogging'] as bool? ?? true,
      enableCaching: json['enableCaching'] as bool? ?? true,
    );

Map<String, dynamic> _$$NetworkConfigImplToJson(_$NetworkConfigImpl instance) =>
    <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'headers': instance.headers,
      'connectTimeout': instance.connectTimeout,
      'receiveTimeout': instance.receiveTimeout,
      'enableLogging': instance.enableLogging,
      'enableCaching': instance.enableCaching,
    };
