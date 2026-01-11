// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_lesson_state_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetLessonStateResponseCWProxy {
  GetLessonStateResponse lessonState(Map<String, LessonState> lessonState);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetLessonStateResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetLessonStateResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  GetLessonStateResponse call({Map<String, LessonState> lessonState});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetLessonStateResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetLessonStateResponse.copyWith.fieldName(...)`
class _$GetLessonStateResponseCWProxyImpl
    implements _$GetLessonStateResponseCWProxy {
  const _$GetLessonStateResponseCWProxyImpl(this._value);

  final GetLessonStateResponse _value;

  @override
  GetLessonStateResponse lessonState(Map<String, LessonState> lessonState) =>
      this(lessonState: lessonState);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetLessonStateResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetLessonStateResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  GetLessonStateResponse call({
    Object? lessonState = const $CopyWithPlaceholder(),
  }) {
    return GetLessonStateResponse(
      lessonState: lessonState == const $CopyWithPlaceholder()
          ? _value.lessonState
          // ignore: cast_nullable_to_non_nullable
          : lessonState as Map<String, LessonState>,
    );
  }
}

extension $GetLessonStateResponseCopyWith on GetLessonStateResponse {
  /// Returns a callable class that can be used as follows: `instanceOfGetLessonStateResponse.copyWith(...)` or like so:`instanceOfGetLessonStateResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetLessonStateResponseCWProxy get copyWith =>
      _$GetLessonStateResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLessonStateResponse _$GetLessonStateResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetLessonStateResponse', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['lesson_state']);
  final val = GetLessonStateResponse(
    lessonState: $checkedConvert(
      'lesson_state',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, LessonState.fromJson(e as Map<String, dynamic>)),
      ),
    ),
  );
  return val;
}, fieldKeyMap: const {'lessonState': 'lesson_state'});

Map<String, dynamic> _$GetLessonStateResponseToJson(
  GetLessonStateResponse instance,
) => <String, dynamic>{
  'lesson_state': instance.lessonState.map((k, e) => MapEntry(k, e.toJson())),
};
