// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_progress_detail.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LessonProgressDetailCWProxy {
  LessonProgressDetail lessonId(String lessonId);

  LessonProgressDetail isCompleted(bool isCompleted);

  LessonProgressDetail completedAt(DateTime? completedAt);

  LessonProgressDetail correctAnswers(int correctAnswers);

  LessonProgressDetail incorrectAnswers(int incorrectAnswers);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonProgressDetail(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonProgressDetail(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonProgressDetail call({
    String lessonId,
    bool isCompleted,
    DateTime? completedAt,
    int correctAnswers,
    int incorrectAnswers,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLessonProgressDetail.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLessonProgressDetail.copyWith.fieldName(...)`
class _$LessonProgressDetailCWProxyImpl
    implements _$LessonProgressDetailCWProxy {
  const _$LessonProgressDetailCWProxyImpl(this._value);

  final LessonProgressDetail _value;

  @override
  LessonProgressDetail lessonId(String lessonId) => this(lessonId: lessonId);

  @override
  LessonProgressDetail isCompleted(bool isCompleted) =>
      this(isCompleted: isCompleted);

  @override
  LessonProgressDetail completedAt(DateTime? completedAt) =>
      this(completedAt: completedAt);

  @override
  LessonProgressDetail correctAnswers(int correctAnswers) =>
      this(correctAnswers: correctAnswers);

  @override
  LessonProgressDetail incorrectAnswers(int incorrectAnswers) =>
      this(incorrectAnswers: incorrectAnswers);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonProgressDetail(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonProgressDetail(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonProgressDetail call({
    Object? lessonId = const $CopyWithPlaceholder(),
    Object? isCompleted = const $CopyWithPlaceholder(),
    Object? completedAt = const $CopyWithPlaceholder(),
    Object? correctAnswers = const $CopyWithPlaceholder(),
    Object? incorrectAnswers = const $CopyWithPlaceholder(),
  }) {
    return LessonProgressDetail(
      lessonId: lessonId == const $CopyWithPlaceholder()
          ? _value.lessonId
          // ignore: cast_nullable_to_non_nullable
          : lessonId as String,
      isCompleted: isCompleted == const $CopyWithPlaceholder()
          ? _value.isCompleted
          // ignore: cast_nullable_to_non_nullable
          : isCompleted as bool,
      completedAt: completedAt == const $CopyWithPlaceholder()
          ? _value.completedAt
          // ignore: cast_nullable_to_non_nullable
          : completedAt as DateTime?,
      correctAnswers: correctAnswers == const $CopyWithPlaceholder()
          ? _value.correctAnswers
          // ignore: cast_nullable_to_non_nullable
          : correctAnswers as int,
      incorrectAnswers: incorrectAnswers == const $CopyWithPlaceholder()
          ? _value.incorrectAnswers
          // ignore: cast_nullable_to_non_nullable
          : incorrectAnswers as int,
    );
  }
}

extension $LessonProgressDetailCopyWith on LessonProgressDetail {
  /// Returns a callable class that can be used as follows: `instanceOfLessonProgressDetail.copyWith(...)` or like so:`instanceOfLessonProgressDetail.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LessonProgressDetailCWProxy get copyWith =>
      _$LessonProgressDetailCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonProgressDetail _$LessonProgressDetailFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'LessonProgressDetail',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'lesson_id',
        'is_completed',
        'correct_answers',
        'incorrect_answers',
      ],
    );
    final val = LessonProgressDetail(
      lessonId: $checkedConvert('lesson_id', (v) => v as String),
      isCompleted: $checkedConvert('is_completed', (v) => v as bool),
      completedAt: $checkedConvert(
        'completed_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      correctAnswers: $checkedConvert(
        'correct_answers',
        (v) => (v as num).toInt(),
      ),
      incorrectAnswers: $checkedConvert(
        'incorrect_answers',
        (v) => (v as num).toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'lessonId': 'lesson_id',
    'isCompleted': 'is_completed',
    'completedAt': 'completed_at',
    'correctAnswers': 'correct_answers',
    'incorrectAnswers': 'incorrect_answers',
  },
);

Map<String, dynamic> _$LessonProgressDetailToJson(
  LessonProgressDetail instance,
) => <String, dynamic>{
  'lesson_id': instance.lessonId,
  'is_completed': instance.isCompleted,
  'completed_at': ?instance.completedAt?.toIso8601String(),
  'correct_answers': instance.correctAnswers,
  'incorrect_answers': instance.incorrectAnswers,
};
