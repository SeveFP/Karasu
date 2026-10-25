// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bodyless_lesson.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BodylessLessonCWProxy {
  BodylessLesson id(String id);

  BodylessLesson courseId(String courseId);

  BodylessLesson order(int order);

  BodylessLesson title(String title);

  BodylessLesson description(String description);

  BodylessLesson createdAt(DateTime createdAt);

  BodylessLesson updatedAt(DateTime? updatedAt);

  BodylessLesson deletedAt(DateTime? deletedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BodylessLesson(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BodylessLesson(...).copyWith(id: 12, name: "My name")
  /// ````
  BodylessLesson call({
    String id,
    String courseId,
    int order,
    String title,
    String description,
    DateTime createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBodylessLesson.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBodylessLesson.copyWith.fieldName(...)`
class _$BodylessLessonCWProxyImpl implements _$BodylessLessonCWProxy {
  const _$BodylessLessonCWProxyImpl(this._value);

  final BodylessLesson _value;

  @override
  BodylessLesson id(String id) => this(id: id);

  @override
  BodylessLesson courseId(String courseId) => this(courseId: courseId);

  @override
  BodylessLesson order(int order) => this(order: order);

  @override
  BodylessLesson title(String title) => this(title: title);

  @override
  BodylessLesson description(String description) =>
      this(description: description);

  @override
  BodylessLesson createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  BodylessLesson updatedAt(DateTime? updatedAt) => this(updatedAt: updatedAt);

  @override
  BodylessLesson deletedAt(DateTime? deletedAt) => this(deletedAt: deletedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BodylessLesson(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BodylessLesson(...).copyWith(id: 12, name: "My name")
  /// ````
  BodylessLesson call({
    Object? id = const $CopyWithPlaceholder(),
    Object? courseId = const $CopyWithPlaceholder(),
    Object? order = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? deletedAt = const $CopyWithPlaceholder(),
  }) {
    return BodylessLesson(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      courseId: courseId == const $CopyWithPlaceholder()
          ? _value.courseId
          // ignore: cast_nullable_to_non_nullable
          : courseId as String,
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
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
      deletedAt: deletedAt == const $CopyWithPlaceholder()
          ? _value.deletedAt
          // ignore: cast_nullable_to_non_nullable
          : deletedAt as DateTime?,
    );
  }
}

extension $BodylessLessonCopyWith on BodylessLesson {
  /// Returns a callable class that can be used as follows: `instanceOfBodylessLesson.copyWith(...)` or like so:`instanceOfBodylessLesson.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BodylessLessonCWProxy get copyWith => _$BodylessLessonCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodylessLesson _$BodylessLessonFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BodylessLesson',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'course_id',
            'order',
            'title',
            'description',
            'created_at',
          ],
        );
        final val = BodylessLesson(
          id: $checkedConvert('id', (v) => v as String),
          courseId: $checkedConvert('course_id', (v) => v as String),
          order: $checkedConvert('order', (v) => (v as num).toInt()),
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          deletedAt: $checkedConvert(
            'deleted_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'courseId': 'course_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'deletedAt': 'deleted_at',
      },
    );

Map<String, dynamic> _$BodylessLessonToJson(BodylessLesson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'order': instance.order,
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': ?instance.updatedAt?.toIso8601String(),
      'deleted_at': ?instance.deletedAt?.toIso8601String(),
    };
