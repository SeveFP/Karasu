// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_course_progress.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserCourseProgressCWProxy {
  UserCourseProgress id(String id);

  UserCourseProgress userId(String userId);

  UserCourseProgress courseId(String courseId);

  UserCourseProgress currentLessonId(String currentLessonId);

  UserCourseProgress createdAt(DateTime createdAt);

  UserCourseProgress updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserCourseProgress(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserCourseProgress(...).copyWith(id: 12, name: "My name")
  /// ````
  UserCourseProgress call({
    String id,
    String userId,
    String courseId,
    String currentLessonId,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserCourseProgress.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserCourseProgress.copyWith.fieldName(...)`
class _$UserCourseProgressCWProxyImpl implements _$UserCourseProgressCWProxy {
  const _$UserCourseProgressCWProxyImpl(this._value);

  final UserCourseProgress _value;

  @override
  UserCourseProgress id(String id) => this(id: id);

  @override
  UserCourseProgress userId(String userId) => this(userId: userId);

  @override
  UserCourseProgress courseId(String courseId) => this(courseId: courseId);

  @override
  UserCourseProgress currentLessonId(String currentLessonId) =>
      this(currentLessonId: currentLessonId);

  @override
  UserCourseProgress createdAt(DateTime createdAt) =>
      this(createdAt: createdAt);

  @override
  UserCourseProgress updatedAt(DateTime updatedAt) =>
      this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserCourseProgress(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserCourseProgress(...).copyWith(id: 12, name: "My name")
  /// ````
  UserCourseProgress call({
    Object? id = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? courseId = const $CopyWithPlaceholder(),
    Object? currentLessonId = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return UserCourseProgress(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      courseId: courseId == const $CopyWithPlaceholder()
          ? _value.courseId
          // ignore: cast_nullable_to_non_nullable
          : courseId as String,
      currentLessonId: currentLessonId == const $CopyWithPlaceholder()
          ? _value.currentLessonId
          // ignore: cast_nullable_to_non_nullable
          : currentLessonId as String,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
    );
  }
}

extension $UserCourseProgressCopyWith on UserCourseProgress {
  /// Returns a callable class that can be used as follows: `instanceOfUserCourseProgress.copyWith(...)` or like so:`instanceOfUserCourseProgress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserCourseProgressCWProxy get copyWith =>
      _$UserCourseProgressCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCourseProgress _$UserCourseProgressFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UserCourseProgress',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'user_id',
            'course_id',
            'current_lesson_id',
            'created_at',
            'updated_at',
          ],
        );
        final val = UserCourseProgress(
          id: $checkedConvert('id', (v) => v as String),
          userId: $checkedConvert('user_id', (v) => v as String),
          courseId: $checkedConvert('course_id', (v) => v as String),
          currentLessonId: $checkedConvert(
            'current_lesson_id',
            (v) => v as String,
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'courseId': 'course_id',
        'currentLessonId': 'current_lesson_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$UserCourseProgressToJson(UserCourseProgress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'course_id': instance.courseId,
      'current_lesson_id': instance.currentLessonId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
