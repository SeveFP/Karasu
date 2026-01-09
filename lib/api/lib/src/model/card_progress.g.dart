// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_progress.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CardProgressCWProxy {
  CardProgress correctAnswers(int correctAnswers);

  CardProgress incorrectAnswers(int incorrectAnswers);

  CardProgress isCompleted(bool isCompleted);

  CardProgress completedAt(DateTime? completedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CardProgress(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CardProgress(...).copyWith(id: 12, name: "My name")
  /// ````
  CardProgress call({
    int correctAnswers,
    int incorrectAnswers,
    bool isCompleted,
    DateTime? completedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCardProgress.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCardProgress.copyWith.fieldName(...)`
class _$CardProgressCWProxyImpl implements _$CardProgressCWProxy {
  const _$CardProgressCWProxyImpl(this._value);

  final CardProgress _value;

  @override
  CardProgress correctAnswers(int correctAnswers) =>
      this(correctAnswers: correctAnswers);

  @override
  CardProgress incorrectAnswers(int incorrectAnswers) =>
      this(incorrectAnswers: incorrectAnswers);

  @override
  CardProgress isCompleted(bool isCompleted) => this(isCompleted: isCompleted);

  @override
  CardProgress completedAt(DateTime? completedAt) =>
      this(completedAt: completedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CardProgress(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CardProgress(...).copyWith(id: 12, name: "My name")
  /// ````
  CardProgress call({
    Object? correctAnswers = const $CopyWithPlaceholder(),
    Object? incorrectAnswers = const $CopyWithPlaceholder(),
    Object? isCompleted = const $CopyWithPlaceholder(),
    Object? completedAt = const $CopyWithPlaceholder(),
  }) {
    return CardProgress(
      correctAnswers: correctAnswers == const $CopyWithPlaceholder()
          ? _value.correctAnswers
          // ignore: cast_nullable_to_non_nullable
          : correctAnswers as int,
      incorrectAnswers: incorrectAnswers == const $CopyWithPlaceholder()
          ? _value.incorrectAnswers
          // ignore: cast_nullable_to_non_nullable
          : incorrectAnswers as int,
      isCompleted: isCompleted == const $CopyWithPlaceholder()
          ? _value.isCompleted
          // ignore: cast_nullable_to_non_nullable
          : isCompleted as bool,
      completedAt: completedAt == const $CopyWithPlaceholder()
          ? _value.completedAt
          // ignore: cast_nullable_to_non_nullable
          : completedAt as DateTime?,
    );
  }
}

extension $CardProgressCopyWith on CardProgress {
  /// Returns a callable class that can be used as follows: `instanceOfCardProgress.copyWith(...)` or like so:`instanceOfCardProgress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CardProgressCWProxy get copyWith => _$CardProgressCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardProgress _$CardProgressFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CardProgress',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'correct_answers',
            'incorrect_answers',
            'is_completed',
          ],
        );
        final val = CardProgress(
          correctAnswers: $checkedConvert(
            'correct_answers',
            (v) => (v as num).toInt(),
          ),
          incorrectAnswers: $checkedConvert(
            'incorrect_answers',
            (v) => (v as num).toInt(),
          ),
          isCompleted: $checkedConvert('is_completed', (v) => v as bool),
          completedAt: $checkedConvert(
            'completed_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'correctAnswers': 'correct_answers',
        'incorrectAnswers': 'incorrect_answers',
        'isCompleted': 'is_completed',
        'completedAt': 'completed_at',
      },
    );

Map<String, dynamic> _$CardProgressToJson(CardProgress instance) =>
    <String, dynamic>{
      'correct_answers': instance.correctAnswers,
      'incorrect_answers': instance.incorrectAnswers,
      'is_completed': instance.isCompleted,
      'completed_at': ?instance.completedAt?.toIso8601String(),
    };
