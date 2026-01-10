// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SignUpRequestCWProxy {
  SignUpRequest username(String username);

  SignUpRequest password(String password);

  SignUpRequest nick(String? nick);

  SignUpRequest bio(String? bio);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SignUpRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SignUpRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SignUpRequest call({
    String username,
    String password,
    String? nick,
    String? bio,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSignUpRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSignUpRequest.copyWith.fieldName(...)`
class _$SignUpRequestCWProxyImpl implements _$SignUpRequestCWProxy {
  const _$SignUpRequestCWProxyImpl(this._value);

  final SignUpRequest _value;

  @override
  SignUpRequest username(String username) => this(username: username);

  @override
  SignUpRequest password(String password) => this(password: password);

  @override
  SignUpRequest nick(String? nick) => this(nick: nick);

  @override
  SignUpRequest bio(String? bio) => this(bio: bio);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SignUpRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SignUpRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SignUpRequest call({
    Object? username = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? nick = const $CopyWithPlaceholder(),
    Object? bio = const $CopyWithPlaceholder(),
  }) {
    return SignUpRequest(
      username: username == const $CopyWithPlaceholder()
          ? _value.username
          // ignore: cast_nullable_to_non_nullable
          : username as String,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      nick: nick == const $CopyWithPlaceholder()
          ? _value.nick
          // ignore: cast_nullable_to_non_nullable
          : nick as String?,
      bio: bio == const $CopyWithPlaceholder()
          ? _value.bio
          // ignore: cast_nullable_to_non_nullable
          : bio as String?,
    );
  }
}

extension $SignUpRequestCopyWith on SignUpRequest {
  /// Returns a callable class that can be used as follows: `instanceOfSignUpRequest.copyWith(...)` or like so:`instanceOfSignUpRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SignUpRequestCWProxy get copyWith => _$SignUpRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SignUpRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['username', 'password']);
      final val = SignUpRequest(
        username: $checkedConvert('username', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
        nick: $checkedConvert('nick', (v) => v as String?),
        bio: $checkedConvert('bio', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'nick': ?instance.nick,
      'bio': ?instance.bio,
    };
