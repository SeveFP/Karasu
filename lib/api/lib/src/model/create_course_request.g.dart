// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_course_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateCourseRequestCWProxy {
  CreateCourseRequest title(String title);

  CreateCourseRequest description(String description);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateCourseRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateCourseRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateCourseRequest call({String title, String description});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateCourseRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateCourseRequest.copyWith.fieldName(...)`
class _$CreateCourseRequestCWProxyImpl implements _$CreateCourseRequestCWProxy {
  const _$CreateCourseRequestCWProxyImpl(this._value);

  final CreateCourseRequest _value;

  @override
  CreateCourseRequest title(String title) => this(title: title);

  @override
  CreateCourseRequest description(String description) =>
      this(description: description);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateCourseRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateCourseRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateCourseRequest call({
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return CreateCourseRequest(
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
    );
  }
}

extension $CreateCourseRequestCopyWith on CreateCourseRequest {
  /// Returns a callable class that can be used as follows: `instanceOfCreateCourseRequest.copyWith(...)` or like so:`instanceOfCreateCourseRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateCourseRequestCWProxy get copyWith =>
      _$CreateCourseRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCourseRequest _$CreateCourseRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CreateCourseRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['title', 'description']);
      final val = CreateCourseRequest(
        title: $checkedConvert('title', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$CreateCourseRequestToJson(
  CreateCourseRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
};
