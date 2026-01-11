// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LessonStateCWProxy {
  LessonState decks(Map<String, DeckState> decks);

  LessonState isCompleted(bool isCompleted);

  LessonState completedAt(DateTime? completedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonState(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonState call({
    Map<String, DeckState> decks,
    bool isCompleted,
    DateTime? completedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLessonState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLessonState.copyWith.fieldName(...)`
class _$LessonStateCWProxyImpl implements _$LessonStateCWProxy {
  const _$LessonStateCWProxyImpl(this._value);

  final LessonState _value;

  @override
  LessonState decks(Map<String, DeckState> decks) => this(decks: decks);

  @override
  LessonState isCompleted(bool isCompleted) => this(isCompleted: isCompleted);

  @override
  LessonState completedAt(DateTime? completedAt) =>
      this(completedAt: completedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonState(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonState call({
    Object? decks = const $CopyWithPlaceholder(),
    Object? isCompleted = const $CopyWithPlaceholder(),
    Object? completedAt = const $CopyWithPlaceholder(),
  }) {
    return LessonState(
      decks: decks == const $CopyWithPlaceholder()
          ? _value.decks
          // ignore: cast_nullable_to_non_nullable
          : decks as Map<String, DeckState>,
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

extension $LessonStateCopyWith on LessonState {
  /// Returns a callable class that can be used as follows: `instanceOfLessonState.copyWith(...)` or like so:`instanceOfLessonState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LessonStateCWProxy get copyWith => _$LessonStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonState _$LessonStateFromJson(Map<String, dynamic> json) => $checkedCreate(
  'LessonState',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['decks', 'is_completed']);
    final val = LessonState(
      decks: $checkedConvert(
        'decks',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) => MapEntry(k, DeckState.fromJson(e as Map<String, dynamic>)),
        ),
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
    'isCompleted': 'is_completed',
    'completedAt': 'completed_at',
  },
);

Map<String, dynamic> _$LessonStateToJson(LessonState instance) =>
    <String, dynamic>{
      'decks': instance.decks.map((k, e) => MapEntry(k, e.toJson())),
      'is_completed': instance.isCompleted,
      'completed_at': ?instance.completedAt?.toIso8601String(),
    };
