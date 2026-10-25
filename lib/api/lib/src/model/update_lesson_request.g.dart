// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_lesson_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateLessonRequestCWProxy {
  UpdateLessonRequest order(int? order);

  UpdateLessonRequest title(String? title);

  UpdateLessonRequest description(String? description);

  UpdateLessonRequest body(String? body);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateLessonRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateLessonRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateLessonRequest call({
    int? order,
    String? title,
    String? description,
    String? body,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUpdateLessonRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUpdateLessonRequest.copyWith.fieldName(...)`
class _$UpdateLessonRequestCWProxyImpl implements _$UpdateLessonRequestCWProxy {
  const _$UpdateLessonRequestCWProxyImpl(this._value);

  final UpdateLessonRequest _value;

  @override
  UpdateLessonRequest order(int? order) => this(order: order);

  @override
  UpdateLessonRequest title(String? title) => this(title: title);

  @override
  UpdateLessonRequest description(String? description) =>
      this(description: description);

  @override
  UpdateLessonRequest body(String? body) => this(body: body);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateLessonRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateLessonRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateLessonRequest call({
    Object? order = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? body = const $CopyWithPlaceholder(),
  }) {
    return UpdateLessonRequest(
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
      body: body == const $CopyWithPlaceholder()
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String?,
    );
  }
}

extension $UpdateLessonRequestCopyWith on UpdateLessonRequest {
  /// Returns a callable class that can be used as follows: `instanceOfUpdateLessonRequest.copyWith(...)` or like so:`instanceOfUpdateLessonRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateLessonRequestCWProxy get copyWith =>
      _$UpdateLessonRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateLessonRequest _$UpdateLessonRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UpdateLessonRequest', json, ($checkedConvert) {
      final val = UpdateLessonRequest(
        order: $checkedConvert('order', (v) => (v as num?)?.toInt()),
        title: $checkedConvert('title', (v) => v as String?),
        description: $checkedConvert('description', (v) => v as String?),
        body: $checkedConvert('body', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UpdateLessonRequestToJson(
  UpdateLessonRequest instance,
) => <String, dynamic>{
  'order': ?instance.order,
  'title': ?instance.title,
  'description': ?instance.description,
  'body': ?instance.body,
};
