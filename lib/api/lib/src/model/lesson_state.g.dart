// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LessonStateCWProxy {
  LessonState lessonState(Map<String, LessonProgress> lessonState);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonState(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonState call({Map<String, LessonProgress> lessonState});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLessonState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLessonState.copyWith.fieldName(...)`
class _$LessonStateCWProxyImpl implements _$LessonStateCWProxy {
  const _$LessonStateCWProxyImpl(this._value);

  final LessonState _value;

  @override
  LessonState lessonState(Map<String, LessonProgress> lessonState) =>
      this(lessonState: lessonState);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonState(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonState call({Object? lessonState = const $CopyWithPlaceholder()}) {
    return LessonState(
      lessonState: lessonState == const $CopyWithPlaceholder()
          ? _value.lessonState
          // ignore: cast_nullable_to_non_nullable
          : lessonState as Map<String, LessonProgress>,
    );
  }
}

extension $LessonStateCopyWith on LessonState {
  /// Returns a callable class that can be used as follows: `instanceOfLessonState.copyWith(...)` or like so:`instanceOfLessonState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LessonStateCWProxy get copyWith => _$LessonStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonState _$LessonStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LessonState', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['lesson_state']);
      final val = LessonState(
        lessonState: $checkedConvert(
          'lesson_state',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) =>
                MapEntry(k, LessonProgress.fromJson(e as Map<String, dynamic>)),
          ),
        ),
      );
      return val;
    }, fieldKeyMap: const {'lessonState': 'lesson_state'});

Map<String, dynamic> _$LessonStateToJson(
  LessonState instance,
) => <String, dynamic>{
  'lesson_state': instance.lessonState.map((k, e) => MapEntry(k, e.toJson())),
};
