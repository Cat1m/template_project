// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NetworkConfig _$NetworkConfigFromJson(Map<String, dynamic> json) {
  return _NetworkConfig.fromJson(json);
}

/// @nodoc
mixin _$NetworkConfig {
  String get baseUrl => throw _privateConstructorUsedError;
  Map<String, dynamic> get headers => throw _privateConstructorUsedError;
  int get connectTimeout => throw _privateConstructorUsedError;
  int get receiveTimeout => throw _privateConstructorUsedError;
  bool get enableLogging => throw _privateConstructorUsedError;
  bool get enableCaching => throw _privateConstructorUsedError;

  /// Serializes this NetworkConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NetworkConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetworkConfigCopyWith<NetworkConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkConfigCopyWith<$Res> {
  factory $NetworkConfigCopyWith(
          NetworkConfig value, $Res Function(NetworkConfig) then) =
      _$NetworkConfigCopyWithImpl<$Res, NetworkConfig>;
  @useResult
  $Res call(
      {String baseUrl,
      Map<String, dynamic> headers,
      int connectTimeout,
      int receiveTimeout,
      bool enableLogging,
      bool enableCaching});
}

/// @nodoc
class _$NetworkConfigCopyWithImpl<$Res, $Val extends NetworkConfig>
    implements $NetworkConfigCopyWith<$Res> {
  _$NetworkConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? headers = null,
    Object? connectTimeout = null,
    Object? receiveTimeout = null,
    Object? enableLogging = null,
    Object? enableCaching = null,
  }) {
    return _then(_value.copyWith(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      headers: null == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      connectTimeout: null == connectTimeout
          ? _value.connectTimeout
          : connectTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      receiveTimeout: null == receiveTimeout
          ? _value.receiveTimeout
          : receiveTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      enableLogging: null == enableLogging
          ? _value.enableLogging
          : enableLogging // ignore: cast_nullable_to_non_nullable
              as bool,
      enableCaching: null == enableCaching
          ? _value.enableCaching
          : enableCaching // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkConfigImplCopyWith<$Res>
    implements $NetworkConfigCopyWith<$Res> {
  factory _$$NetworkConfigImplCopyWith(
          _$NetworkConfigImpl value, $Res Function(_$NetworkConfigImpl) then) =
      __$$NetworkConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String baseUrl,
      Map<String, dynamic> headers,
      int connectTimeout,
      int receiveTimeout,
      bool enableLogging,
      bool enableCaching});
}

/// @nodoc
class __$$NetworkConfigImplCopyWithImpl<$Res>
    extends _$NetworkConfigCopyWithImpl<$Res, _$NetworkConfigImpl>
    implements _$$NetworkConfigImplCopyWith<$Res> {
  __$$NetworkConfigImplCopyWithImpl(
      _$NetworkConfigImpl _value, $Res Function(_$NetworkConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? headers = null,
    Object? connectTimeout = null,
    Object? receiveTimeout = null,
    Object? enableLogging = null,
    Object? enableCaching = null,
  }) {
    return _then(_$NetworkConfigImpl(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      headers: null == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      connectTimeout: null == connectTimeout
          ? _value.connectTimeout
          : connectTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      receiveTimeout: null == receiveTimeout
          ? _value.receiveTimeout
          : receiveTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      enableLogging: null == enableLogging
          ? _value.enableLogging
          : enableLogging // ignore: cast_nullable_to_non_nullable
              as bool,
      enableCaching: null == enableCaching
          ? _value.enableCaching
          : enableCaching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkConfigImpl implements _NetworkConfig {
  const _$NetworkConfigImpl(
      {required this.baseUrl,
      final Map<String, dynamic> headers = const {},
      this.connectTimeout = 30000,
      this.receiveTimeout = 30000,
      this.enableLogging = true,
      this.enableCaching = true})
      : _headers = headers;

  factory _$NetworkConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkConfigImplFromJson(json);

  @override
  final String baseUrl;
  final Map<String, dynamic> _headers;
  @override
  @JsonKey()
  Map<String, dynamic> get headers {
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headers);
  }

  @override
  @JsonKey()
  final int connectTimeout;
  @override
  @JsonKey()
  final int receiveTimeout;
  @override
  @JsonKey()
  final bool enableLogging;
  @override
  @JsonKey()
  final bool enableCaching;

  @override
  String toString() {
    return 'NetworkConfig(baseUrl: $baseUrl, headers: $headers, connectTimeout: $connectTimeout, receiveTimeout: $receiveTimeout, enableLogging: $enableLogging, enableCaching: $enableCaching)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkConfigImpl &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            (identical(other.connectTimeout, connectTimeout) ||
                other.connectTimeout == connectTimeout) &&
            (identical(other.receiveTimeout, receiveTimeout) ||
                other.receiveTimeout == receiveTimeout) &&
            (identical(other.enableLogging, enableLogging) ||
                other.enableLogging == enableLogging) &&
            (identical(other.enableCaching, enableCaching) ||
                other.enableCaching == enableCaching));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      baseUrl,
      const DeepCollectionEquality().hash(_headers),
      connectTimeout,
      receiveTimeout,
      enableLogging,
      enableCaching);

  /// Create a copy of NetworkConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkConfigImplCopyWith<_$NetworkConfigImpl> get copyWith =>
      __$$NetworkConfigImplCopyWithImpl<_$NetworkConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkConfigImplToJson(
      this,
    );
  }
}

abstract class _NetworkConfig implements NetworkConfig {
  const factory _NetworkConfig(
      {required final String baseUrl,
      final Map<String, dynamic> headers,
      final int connectTimeout,
      final int receiveTimeout,
      final bool enableLogging,
      final bool enableCaching}) = _$NetworkConfigImpl;

  factory _NetworkConfig.fromJson(Map<String, dynamic> json) =
      _$NetworkConfigImpl.fromJson;

  @override
  String get baseUrl;
  @override
  Map<String, dynamic> get headers;
  @override
  int get connectTimeout;
  @override
  int get receiveTimeout;
  @override
  bool get enableLogging;
  @override
  bool get enableCaching;

  /// Create a copy of NetworkConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkConfigImplCopyWith<_$NetworkConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
