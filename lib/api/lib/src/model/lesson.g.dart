// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LessonCWProxy {
  Lesson id(String id);

  Lesson courseId(String courseId);

  Lesson order(int order);

  Lesson title(String title);

  Lesson description(String description);

  Lesson body(String body);

  Lesson createdAt(DateTime createdAt);

  Lesson editedAt(DateTime? editedAt);

  Lesson deletedAt(DateTime? deletedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Lesson(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Lesson(...).copyWith(id: 12, name: "My name")
  /// ````
  Lesson call({
    String id,
    String courseId,
    int order,
    String title,
    String description,
    String body,
    DateTime createdAt,
    DateTime? editedAt,
    DateTime? deletedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLesson.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLesson.copyWith.fieldName(...)`
class _$LessonCWProxyImpl implements _$LessonCWProxy {
  const _$LessonCWProxyImpl(this._value);

  final Lesson _value;

  @override
  Lesson id(String id) => this(id: id);

  @override
  Lesson courseId(String courseId) => this(courseId: courseId);

  @override
  Lesson order(int order) => this(order: order);

  @override
  Lesson title(String title) => this(title: title);

  @override
  Lesson description(String description) => this(description: description);

  @override
  Lesson body(String body) => this(body: body);

  @override
  Lesson createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Lesson editedAt(DateTime? editedAt) => this(editedAt: editedAt);

  @override
  Lesson deletedAt(DateTime? deletedAt) => this(deletedAt: deletedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Lesson(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Lesson(...).copyWith(id: 12, name: "My name")
  /// ````
  Lesson call({
    Object? id = const $CopyWithPlaceholder(),
    Object? courseId = const $CopyWithPlaceholder(),
    Object? order = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? body = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? editedAt = const $CopyWithPlaceholder(),
    Object? deletedAt = const $CopyWithPlaceholder(),
  }) {
    return Lesson(
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
      body: body == const $CopyWithPlaceholder()
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      editedAt: editedAt == const $CopyWithPlaceholder()
          ? _value.editedAt
          // ignore: cast_nullable_to_non_nullable
          : editedAt as DateTime?,
      deletedAt: deletedAt == const $CopyWithPlaceholder()
          ? _value.deletedAt
          // ignore: cast_nullable_to_non_nullable
          : deletedAt as DateTime?,
    );
  }
}

extension $LessonCopyWith on Lesson {
  /// Returns a callable class that can be used as follows: `instanceOfLesson.copyWith(...)` or like so:`instanceOfLesson.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LessonCWProxy get copyWith => _$LessonCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Lesson',
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
        'body',
        'created_at',
      ],
    );
    final val = Lesson(
      id: $checkedConvert('id', (v) => v as String),
      courseId: $checkedConvert('course_id', (v) => v as String),
      order: $checkedConvert('order', (v) => (v as num).toInt()),
      title: $checkedConvert('title', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      body: $checkedConvert('body', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      editedAt: $checkedConvert(
        'edited_at',
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
    'editedAt': 'edited_at',
    'deletedAt': 'deleted_at',
  },
);

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
  'id': instance.id,
  'course_id': instance.courseId,
  'order': instance.order,
  'title': instance.title,
  'description': instance.description,
  'body': instance.body,
  'created_at': instance.createdAt.toIso8601String(),
  'edited_at': ?instance.editedAt?.toIso8601String(),
  'deleted_at': ?instance.deletedAt?.toIso8601String(),
};
