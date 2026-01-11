// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_with_progress.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CourseWithProgressCWProxy {
  CourseWithProgress id(String id);

  CourseWithProgress title(String title);

  CourseWithProgress description(String description);

  CourseWithProgress createdAt(DateTime createdAt);

  CourseWithProgress editedAt(DateTime? editedAt);

  CourseWithProgress deletedAt(DateTime? deletedAt);

  CourseWithProgress currentLessonId(String currentLessonId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CourseWithProgress(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CourseWithProgress(...).copyWith(id: 12, name: "My name")
  /// ````
  CourseWithProgress call({
    String id,
    String title,
    String description,
    DateTime createdAt,
    DateTime? editedAt,
    DateTime? deletedAt,
    String currentLessonId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCourseWithProgress.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCourseWithProgress.copyWith.fieldName(...)`
class _$CourseWithProgressCWProxyImpl implements _$CourseWithProgressCWProxy {
  const _$CourseWithProgressCWProxyImpl(this._value);

  final CourseWithProgress _value;

  @override
  CourseWithProgress id(String id) => this(id: id);

  @override
  CourseWithProgress title(String title) => this(title: title);

  @override
  CourseWithProgress description(String description) =>
      this(description: description);

  @override
  CourseWithProgress createdAt(DateTime createdAt) =>
      this(createdAt: createdAt);

  @override
  CourseWithProgress editedAt(DateTime? editedAt) => this(editedAt: editedAt);

  @override
  CourseWithProgress deletedAt(DateTime? deletedAt) =>
      this(deletedAt: deletedAt);

  @override
  CourseWithProgress currentLessonId(String currentLessonId) =>
      this(currentLessonId: currentLessonId);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CourseWithProgress(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CourseWithProgress(...).copyWith(id: 12, name: "My name")
  /// ````
  CourseWithProgress call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? editedAt = const $CopyWithPlaceholder(),
    Object? deletedAt = const $CopyWithPlaceholder(),
    Object? currentLessonId = const $CopyWithPlaceholder(),
  }) {
    return CourseWithProgress(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
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
      editedAt: editedAt == const $CopyWithPlaceholder()
          ? _value.editedAt
          // ignore: cast_nullable_to_non_nullable
          : editedAt as DateTime?,
      deletedAt: deletedAt == const $CopyWithPlaceholder()
          ? _value.deletedAt
          // ignore: cast_nullable_to_non_nullable
          : deletedAt as DateTime?,
      currentLessonId: currentLessonId == const $CopyWithPlaceholder()
          ? _value.currentLessonId
          // ignore: cast_nullable_to_non_nullable
          : currentLessonId as String,
    );
  }
}

extension $CourseWithProgressCopyWith on CourseWithProgress {
  /// Returns a callable class that can be used as follows: `instanceOfCourseWithProgress.copyWith(...)` or like so:`instanceOfCourseWithProgress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CourseWithProgressCWProxy get copyWith =>
      _$CourseWithProgressCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseWithProgress _$CourseWithProgressFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CourseWithProgress',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'title',
            'description',
            'created_at',
            'current_lesson_id',
          ],
        );
        final val = CourseWithProgress(
          id: $checkedConvert('id', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
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
          currentLessonId: $checkedConvert(
            'current_lesson_id',
            (v) => v as String,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'createdAt': 'created_at',
        'editedAt': 'edited_at',
        'deletedAt': 'deleted_at',
        'currentLessonId': 'current_lesson_id',
      },
    );

Map<String, dynamic> _$CourseWithProgressToJson(CourseWithProgress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
      'edited_at': ?instance.editedAt?.toIso8601String(),
      'deleted_at': ?instance.deletedAt?.toIso8601String(),
      'current_lesson_id': instance.currentLessonId,
    };
