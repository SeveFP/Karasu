// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TokenResponseCWProxy {
  TokenResponse token(String token);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TokenResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TokenResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  TokenResponse call({String token});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTokenResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTokenResponse.copyWith.fieldName(...)`
class _$TokenResponseCWProxyImpl implements _$TokenResponseCWProxy {
  const _$TokenResponseCWProxyImpl(this._value);

  final TokenResponse _value;

  @override
  TokenResponse token(String token) => this(token: token);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TokenResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TokenResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  TokenResponse call({Object? token = const $CopyWithPlaceholder()}) {
    return TokenResponse(
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String,
    );
  }
}

extension $TokenResponseCopyWith on TokenResponse {
  /// Returns a callable class that can be used as follows: `instanceOfTokenResponse.copyWith(...)` or like so:`instanceOfTokenResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TokenResponseCWProxy get copyWith => _$TokenResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TokenResponse', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['token']);
      final val = TokenResponse(
        token: $checkedConvert('token', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{'token': instance.token};
