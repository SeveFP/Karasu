// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LogInRequestCWProxy {
  LogInRequest username(String username);

  LogInRequest password(String password);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LogInRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LogInRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  LogInRequest call({String username, String password});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLogInRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLogInRequest.copyWith.fieldName(...)`
class _$LogInRequestCWProxyImpl implements _$LogInRequestCWProxy {
  const _$LogInRequestCWProxyImpl(this._value);

  final LogInRequest _value;

  @override
  LogInRequest username(String username) => this(username: username);

  @override
  LogInRequest password(String password) => this(password: password);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LogInRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LogInRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  LogInRequest call({
    Object? username = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return LogInRequest(
      username: username == const $CopyWithPlaceholder()
          ? _value.username
          // ignore: cast_nullable_to_non_nullable
          : username as String,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
    );
  }
}

extension $LogInRequestCopyWith on LogInRequest {
  /// Returns a callable class that can be used as follows: `instanceOfLogInRequest.copyWith(...)` or like so:`instanceOfLogInRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LogInRequestCWProxy get copyWith => _$LogInRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogInRequest _$LogInRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LogInRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['username', 'password']);
      final val = LogInRequest(
        username: $checkedConvert('username', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$LogInRequestToJson(LogInRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
