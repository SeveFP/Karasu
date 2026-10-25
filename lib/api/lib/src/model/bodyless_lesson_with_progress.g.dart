// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bodyless_lesson_with_progress.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BodylessLessonWithProgressCWProxy {
  BodylessLessonWithProgress id(String id);

  BodylessLessonWithProgress courseId(String courseId);

  BodylessLessonWithProgress order(int order);

  BodylessLessonWithProgress title(String title);

  BodylessLessonWithProgress description(String description);

  BodylessLessonWithProgress createdAt(DateTime createdAt);

  BodylessLessonWithProgress updatedAt(DateTime? updatedAt);

  BodylessLessonWithProgress deletedAt(DateTime? deletedAt);

  BodylessLessonWithProgress isCompleted(bool isCompleted);

  BodylessLessonWithProgress isCurrent(bool isCurrent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BodylessLessonWithProgress(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BodylessLessonWithProgress(...).copyWith(id: 12, name: "My name")
  /// ````
  BodylessLessonWithProgress call({
    String id,
    String courseId,
    int order,
    String title,
    String description,
    DateTime createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    bool isCompleted,
    bool isCurrent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBodylessLessonWithProgress.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBodylessLessonWithProgress.copyWith.fieldName(...)`
class _$BodylessLessonWithProgressCWProxyImpl
    implements _$BodylessLessonWithProgressCWProxy {
  const _$BodylessLessonWithProgressCWProxyImpl(this._value);

  final BodylessLessonWithProgress _value;

  @override
  BodylessLessonWithProgress id(String id) => this(id: id);

  @override
  BodylessLessonWithProgress courseId(String courseId) =>
      this(courseId: courseId);

  @override
  BodylessLessonWithProgress order(int order) => this(order: order);

  @override
  BodylessLessonWithProgress title(String title) => this(title: title);

  @override
  BodylessLessonWithProgress description(String description) =>
      this(description: description);

  @override
  BodylessLessonWithProgress createdAt(DateTime createdAt) =>
      this(createdAt: createdAt);

  @override
  BodylessLessonWithProgress updatedAt(DateTime? updatedAt) =>
      this(updatedAt: updatedAt);

  @override
  BodylessLessonWithProgress deletedAt(DateTime? deletedAt) =>
      this(deletedAt: deletedAt);

  @override
  BodylessLessonWithProgress isCompleted(bool isCompleted) =>
      this(isCompleted: isCompleted);

  @override
  BodylessLessonWithProgress isCurrent(bool isCurrent) =>
      this(isCurrent: isCurrent);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BodylessLessonWithProgress(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BodylessLessonWithProgress(...).copyWith(id: 12, name: "My name")
  /// ````
  BodylessLessonWithProgress call({
    Object? id = const $CopyWithPlaceholder(),
    Object? courseId = const $CopyWithPlaceholder(),
    Object? order = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? deletedAt = const $CopyWithPlaceholder(),
    Object? isCompleted = const $CopyWithPlaceholder(),
    Object? isCurrent = const $CopyWithPlaceholder(),
  }) {
    return BodylessLessonWithProgress(
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

extension $BodylessLessonWithProgressCopyWith on BodylessLessonWithProgress {
  /// Returns a callable class that can be used as follows: `instanceOfBodylessLessonWithProgress.copyWith(...)` or like so:`instanceOfBodylessLessonWithProgress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BodylessLessonWithProgressCWProxy get copyWith =>
      _$BodylessLessonWithProgressCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodylessLessonWithProgress _$BodylessLessonWithProgressFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BodylessLessonWithProgress',
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
        'is_completed',
        'is_current',
      ],
    );
    final val = BodylessLessonWithProgress(
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
      isCompleted: $checkedConvert('is_completed', (v) => v as bool),
      isCurrent: $checkedConvert('is_current', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {
    'courseId': 'course_id',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
    'deletedAt': 'deleted_at',
    'isCompleted': 'is_completed',
    'isCurrent': 'is_current',
  },
);

Map<String, dynamic> _$BodylessLessonWithProgressToJson(
  BodylessLessonWithProgress instance,
) => <String, dynamic>{
  'id': instance.id,
  'course_id': instance.courseId,
  'order': instance.order,
  'title': instance.title,
  'description': instance.description,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': ?instance.updatedAt?.toIso8601String(),
  'deleted_at': ?instance.deletedAt?.toIso8601String(),
  'is_completed': instance.isCompleted,
  'is_current': instance.isCurrent,
};
