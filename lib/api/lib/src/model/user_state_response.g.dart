// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserStateResponseCWProxy {
  UserStateResponse id(String id);

  UserStateResponse userId(String userId);

  UserStateResponse courseId(String courseId);

  UserStateResponse currentLessonId(String currentLessonId);

  UserStateResponse stateJson(String stateJson);

  UserStateResponse createdAt(DateTime createdAt);

  UserStateResponse updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserStateResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserStateResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  UserStateResponse call({
    String id,
    String userId,
    String courseId,
    String currentLessonId,
    String stateJson,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserStateResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserStateResponse.copyWith.fieldName(...)`
class _$UserStateResponseCWProxyImpl implements _$UserStateResponseCWProxy {
  const _$UserStateResponseCWProxyImpl(this._value);

  final UserStateResponse _value;

  @override
  UserStateResponse id(String id) => this(id: id);

  @override
  UserStateResponse userId(String userId) => this(userId: userId);

  @override
  UserStateResponse courseId(String courseId) => this(courseId: courseId);

  @override
  UserStateResponse currentLessonId(String currentLessonId) =>
      this(currentLessonId: currentLessonId);

  @override
  UserStateResponse stateJson(String stateJson) => this(stateJson: stateJson);

  @override
  UserStateResponse createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  UserStateResponse updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserStateResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserStateResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  UserStateResponse call({
    Object? id = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? courseId = const $CopyWithPlaceholder(),
    Object? currentLessonId = const $CopyWithPlaceholder(),
    Object? stateJson = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return UserStateResponse(
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
      stateJson: stateJson == const $CopyWithPlaceholder()
          ? _value.stateJson
          // ignore: cast_nullable_to_non_nullable
          : stateJson as String,
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

extension $UserStateResponseCopyWith on UserStateResponse {
  /// Returns a callable class that can be used as follows: `instanceOfUserStateResponse.copyWith(...)` or like so:`instanceOfUserStateResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserStateResponseCWProxy get copyWith =>
      _$UserStateResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStateResponse _$UserStateResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UserStateResponse',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'user_id',
            'course_id',
            'current_lesson_id',
            'state_json',
            'created_at',
            'updated_at',
          ],
        );
        final val = UserStateResponse(
          id: $checkedConvert('id', (v) => v as String),
          userId: $checkedConvert('user_id', (v) => v as String),
          courseId: $checkedConvert('course_id', (v) => v as String),
          currentLessonId: $checkedConvert(
            'current_lesson_id',
            (v) => v as String,
          ),
          stateJson: $checkedConvert('state_json', (v) => v as String),
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
        'stateJson': 'state_json',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$UserStateResponseToJson(UserStateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'course_id': instance.courseId,
      'current_lesson_id': instance.currentLessonId,
      'state_json': instance.stateJson,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
