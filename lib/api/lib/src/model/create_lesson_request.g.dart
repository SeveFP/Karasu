// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_lesson_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateLessonRequestCWProxy {
  CreateLessonRequest order(int order);

  CreateLessonRequest title(String title);

  CreateLessonRequest description(String description);

  CreateLessonRequest body(String body);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateLessonRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateLessonRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateLessonRequest call({
    int order,
    String title,
    String description,
    String body,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateLessonRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateLessonRequest.copyWith.fieldName(...)`
class _$CreateLessonRequestCWProxyImpl implements _$CreateLessonRequestCWProxy {
  const _$CreateLessonRequestCWProxyImpl(this._value);

  final CreateLessonRequest _value;

  @override
  CreateLessonRequest order(int order) => this(order: order);

  @override
  CreateLessonRequest title(String title) => this(title: title);

  @override
  CreateLessonRequest description(String description) =>
      this(description: description);

  @override
  CreateLessonRequest body(String body) => this(body: body);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateLessonRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateLessonRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateLessonRequest call({
    Object? order = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? body = const $CopyWithPlaceholder(),
  }) {
    return CreateLessonRequest(
      order: order == const $CopyWithPlaceholder()
          ? _value.order
          // ignore: cast_nullable_to_non_nullable
          : order as int,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
      body: body == const $CopyWithPlaceholder()
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
    );
  }
}

extension $CreateLessonRequestCopyWith on CreateLessonRequest {
  /// Returns a callable class that can be used as follows: `instanceOfCreateLessonRequest.copyWith(...)` or like so:`instanceOfCreateLessonRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateLessonRequestCWProxy get copyWith =>
      _$CreateLessonRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateLessonRequest _$CreateLessonRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CreateLessonRequest', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['order', 'title', 'description', 'body'],
      );
      final val = CreateLessonRequest(
        order: $checkedConvert('order', (v) => (v as num).toInt()),
        title: $checkedConvert('title', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        body: $checkedConvert('body', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$CreateLessonRequestToJson(
  CreateLessonRequest instance,
) => <String, dynamic>{
  'order': instance.order,
  'title': instance.title,
  'description': instance.description,
  'body': instance.body,
};
