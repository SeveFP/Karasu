// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_progress.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LessonProgressCWProxy {
  LessonProgress decks(Map<String, DeckProgress> decks);

  LessonProgress isCompleted(bool isCompleted);

  LessonProgress completedAt(DateTime? completedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonProgress(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonProgress(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonProgress call({
    Map<String, DeckProgress> decks,
    bool isCompleted,
    DateTime? completedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLessonProgress.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLessonProgress.copyWith.fieldName(...)`
class _$LessonProgressCWProxyImpl implements _$LessonProgressCWProxy {
  const _$LessonProgressCWProxyImpl(this._value);

  final LessonProgress _value;

  @override
  LessonProgress decks(Map<String, DeckProgress> decks) => this(decks: decks);

  @override
  LessonProgress isCompleted(bool isCompleted) =>
      this(isCompleted: isCompleted);

  @override
  LessonProgress completedAt(DateTime? completedAt) =>
      this(completedAt: completedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonProgress(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonProgress(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonProgress call({
    Object? decks = const $CopyWithPlaceholder(),
    Object? isCompleted = const $CopyWithPlaceholder(),
    Object? completedAt = const $CopyWithPlaceholder(),
  }) {
    return LessonProgress(
      decks: decks == const $CopyWithPlaceholder()
          ? _value.decks
          // ignore: cast_nullable_to_non_nullable
          : decks as Map<String, DeckProgress>,
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

extension $LessonProgressCopyWith on LessonProgress {
  /// Returns a callable class that can be used as follows: `instanceOfLessonProgress.copyWith(...)` or like so:`instanceOfLessonProgress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LessonProgressCWProxy get copyWith => _$LessonProgressCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonProgress _$LessonProgressFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LessonProgress',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['decks', 'is_completed']);
        final val = LessonProgress(
          decks: $checkedConvert(
            'decks',
            (v) => (v as Map<String, dynamic>).map(
              (k, e) =>
                  MapEntry(k, DeckProgress.fromJson(e as Map<String, dynamic>)),
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

Map<String, dynamic> _$LessonProgressToJson(LessonProgress instance) =>
    <String, dynamic>{
      'decks': instance.decks.map((k, e) => MapEntry(k, e.toJson())),
      'is_completed': instance.isCompleted,
      'completed_at': ?instance.completedAt?.toIso8601String(),
    };
