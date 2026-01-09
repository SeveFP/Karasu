// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enroll_course200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EnrollCourse200ResponseCWProxy {
  EnrollCourse200Response success(bool? success);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EnrollCourse200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EnrollCourse200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  EnrollCourse200Response call({bool? success});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEnrollCourse200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEnrollCourse200Response.copyWith.fieldName(...)`
class _$EnrollCourse200ResponseCWProxyImpl
    implements _$EnrollCourse200ResponseCWProxy {
  const _$EnrollCourse200ResponseCWProxyImpl(this._value);

  final EnrollCourse200Response _value;

  @override
  EnrollCourse200Response success(bool? success) => this(success: success);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EnrollCourse200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EnrollCourse200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  EnrollCourse200Response call({
    Object? success = const $CopyWithPlaceholder(),
  }) {
    return EnrollCourse200Response(
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success as bool?,
    );
  }
}

extension $EnrollCourse200ResponseCopyWith on EnrollCourse200Response {
  /// Returns a callable class that can be used as follows: `instanceOfEnrollCourse200Response.copyWith(...)` or like so:`instanceOfEnrollCourse200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EnrollCourse200ResponseCWProxy get copyWith =>
      _$EnrollCourse200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollCourse200Response _$EnrollCourse200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('EnrollCourse200Response', json, ($checkedConvert) {
  final val = EnrollCourse200Response(
    success: $checkedConvert('success', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$EnrollCourse200ResponseToJson(
  EnrollCourse200Response instance,
) => <String, dynamic>{'success': ?instance.success};
