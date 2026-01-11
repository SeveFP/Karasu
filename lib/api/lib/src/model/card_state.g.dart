// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CardStateCWProxy {
  CardState correctAnswers(int correctAnswers);

  CardState incorrectAnswers(int incorrectAnswers);

  CardState isCompleted(bool isCompleted);

  CardState completedAt(DateTime? completedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CardState(...).copyWith(id: 12, name: "My name")
  /// ````
  CardState call({
    int correctAnswers,
    int incorrectAnswers,
    bool isCompleted,
    DateTime? completedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCardState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCardState.copyWith.fieldName(...)`
class _$CardStateCWProxyImpl implements _$CardStateCWProxy {
  const _$CardStateCWProxyImpl(this._value);

  final CardState _value;

  @override
  CardState correctAnswers(int correctAnswers) =>
      this(correctAnswers: correctAnswers);

  @override
  CardState incorrectAnswers(int incorrectAnswers) =>
      this(incorrectAnswers: incorrectAnswers);

  @override
  CardState isCompleted(bool isCompleted) => this(isCompleted: isCompleted);

  @override
  CardState completedAt(DateTime? completedAt) =>
      this(completedAt: completedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CardState(...).copyWith(id: 12, name: "My name")
  /// ````
  CardState call({
    Object? correctAnswers = const $CopyWithPlaceholder(),
    Object? incorrectAnswers = const $CopyWithPlaceholder(),
    Object? isCompleted = const $CopyWithPlaceholder(),
    Object? completedAt = const $CopyWithPlaceholder(),
  }) {
    return CardState(
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

extension $CardStateCopyWith on CardState {
  /// Returns a callable class that can be used as follows: `instanceOfCardState.copyWith(...)` or like so:`instanceOfCardState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CardStateCWProxy get copyWith => _$CardStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardState _$CardStateFromJson(Map<String, dynamic> json) => $checkedCreate(
  'CardState',
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
    final val = CardState(
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

Map<String, dynamic> _$CardStateToJson(CardState instance) => <String, dynamic>{
  'correct_answers': instance.correctAnswers,
  'incorrect_answers': instance.incorrectAnswers,
  'is_completed': instance.isCompleted,
  'completed_at': ?instance.completedAt?.toIso8601String(),
};
