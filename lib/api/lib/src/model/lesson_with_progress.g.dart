// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_with_progress.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LessonWithProgressCWProxy {
  LessonWithProgress id(String id);

  LessonWithProgress courseId(String courseId);

  LessonWithProgress order(int order);

  LessonWithProgress title(String title);

  LessonWithProgress description(String description);

  LessonWithProgress body(String body);

  LessonWithProgress createdAt(DateTime createdAt);

  LessonWithProgress editedAt(DateTime? editedAt);

  LessonWithProgress deletedAt(DateTime? deletedAt);

  LessonWithProgress isCompleted(bool isCompleted);

  LessonWithProgress isCurrent(bool isCurrent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonWithProgress(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonWithProgress(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonWithProgress call({
    String id,
    String courseId,
    int order,
    String title,
    String description,
    String body,
    DateTime createdAt,
    DateTime? editedAt,
    DateTime? deletedAt,
    bool isCompleted,
    bool isCurrent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLessonWithProgress.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLessonWithProgress.copyWith.fieldName(...)`
class _$LessonWithProgressCWProxyImpl implements _$LessonWithProgressCWProxy {
  const _$LessonWithProgressCWProxyImpl(this._value);

  final LessonWithProgress _value;

  @override
  LessonWithProgress id(String id) => this(id: id);

  @override
  LessonWithProgress courseId(String courseId) => this(courseId: courseId);

  @override
  LessonWithProgress order(int order) => this(order: order);

  @override
  LessonWithProgress title(String title) => this(title: title);

  @override
  LessonWithProgress description(String description) =>
      this(description: description);

  @override
  LessonWithProgress body(String body) => this(body: body);

  @override
  LessonWithProgress createdAt(DateTime createdAt) =>
      this(createdAt: createdAt);

  @override
  LessonWithProgress editedAt(DateTime? editedAt) => this(editedAt: editedAt);

  @override
  LessonWithProgress deletedAt(DateTime? deletedAt) =>
      this(deletedAt: deletedAt);

  @override
  LessonWithProgress isCompleted(bool isCompleted) =>
      this(isCompleted: isCompleted);

  @override
  LessonWithProgress isCurrent(bool isCurrent) => this(isCurrent: isCurrent);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonWithProgress(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonWithProgress(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonWithProgress call({
    Object? id = const $CopyWithPlaceholder(),
    Object? courseId = const $CopyWithPlaceholder(),
    Object? order = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? body = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? editedAt = const $CopyWithPlaceholder(),
    Object? deletedAt = const $CopyWithPlaceholder(),
    Object? isCompleted = const $CopyWithPlaceholder(),
    Object? isCurrent = const $CopyWithPlaceholder(),
  }) {
    return LessonWithProgress(
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
      isCompleted: isCompleted == const $CopyWithPlaceholder()
          ? _value.isCompleted
          // ignore: cast_nullable_to_non_nullable
          : isCompleted as bool,
      isCurrent: isCurrent == const $CopyWithPlaceholder()
          ? _value.isCurrent
          // ignore: cast_nullable_to_non_nullable
          : isCurrent as bool,
    );
  }
}

extension $LessonWithProgressCopyWith on LessonWithProgress {
  /// Returns a callable class that can be used as follows: `instanceOfLessonWithProgress.copyWith(...)` or like so:`instanceOfLessonWithProgress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LessonWithProgressCWProxy get copyWith =>
      _$LessonWithProgressCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonWithProgress _$LessonWithProgressFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LessonWithProgress',
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
            'is_completed',
            'is_current',
          ],
        );
        final val = LessonWithProgress(
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
          isCompleted: $checkedConvert('is_completed', (v) => v as bool),
          isCurrent: $checkedConvert('is_current', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {
        'courseId': 'course_id',
        'createdAt': 'created_at',
        'editedAt': 'edited_at',
        'deletedAt': 'deleted_at',
        'isCompleted': 'is_completed',
        'isCurrent': 'is_current',
      },
    );

Map<String, dynamic> _$LessonWithProgressToJson(LessonWithProgress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'order': instance.order,
      'title': instance.title,
      'description': instance.description,
      'body': instance.body,
      'created_at': instance.createdAt.toIso8601String(),
      'edited_at': ?instance.editedAt?.toIso8601String(),
      'deleted_at': ?instance.deletedAt?.toIso8601String(),
      'is_completed': instance.isCompleted,
      'is_current': instance.isCurrent,
    };
