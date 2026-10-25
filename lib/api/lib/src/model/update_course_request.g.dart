// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_course_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateCourseRequestCWProxy {
  UpdateCourseRequest order(int? order);

  UpdateCourseRequest title(String? title);

  UpdateCourseRequest description(String? description);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateCourseRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateCourseRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateCourseRequest call({int? order, String? title, String? description});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUpdateCourseRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUpdateCourseRequest.copyWith.fieldName(...)`
class _$UpdateCourseRequestCWProxyImpl implements _$UpdateCourseRequestCWProxy {
  const _$UpdateCourseRequestCWProxyImpl(this._value);

  final UpdateCourseRequest _value;

  @override
  UpdateCourseRequest order(int? order) => this(order: order);

  @override
  UpdateCourseRequest title(String? title) => this(title: title);

  @override
  UpdateCourseRequest description(String? description) =>
      this(description: description);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateCourseRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateCourseRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateCourseRequest call({
    Object? order = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return UpdateCourseRequest(
      order: order == const $CopyWithPlaceholder()
          ? _value.order
          // ignore: cast_nullable_to_non_nullable
          : order as int?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
    );
  }
}

extension $UpdateCourseRequestCopyWith on UpdateCourseRequest {
  /// Returns a callable class that can be used as follows: `instanceOfUpdateCourseRequest.copyWith(...)` or like so:`instanceOfUpdateCourseRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateCourseRequestCWProxy get copyWith =>
      _$UpdateCourseRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCourseRequest _$UpdateCourseRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UpdateCourseRequest', json, ($checkedConvert) {
      final val = UpdateCourseRequest(
        order: $checkedConvert('order', (v) => (v as num?)?.toInt()),
        title: $checkedConvert('title', (v) => v as String?),
        description: $checkedConvert('description', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UpdateCourseRequestToJson(
  UpdateCourseRequest instance,
) => <String, dynamic>{
  'order': ?instance.order,
  'title': ?instance.title,
  'description': ?instance.description,
};
