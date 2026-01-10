// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_progress.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeckProgressCWProxy {
  DeckProgress cards(Map<String, CardProgress> cards);

  DeckProgress isCompleted(bool isCompleted);

  DeckProgress completedAt(DateTime? completedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeckProgress(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeckProgress(...).copyWith(id: 12, name: "My name")
  /// ````
  DeckProgress call({
    Map<String, CardProgress> cards,
    bool isCompleted,
    DateTime? completedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeckProgress.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeckProgress.copyWith.fieldName(...)`
class _$DeckProgressCWProxyImpl implements _$DeckProgressCWProxy {
  const _$DeckProgressCWProxyImpl(this._value);

  final DeckProgress _value;

  @override
  DeckProgress cards(Map<String, CardProgress> cards) => this(cards: cards);

  @override
  DeckProgress isCompleted(bool isCompleted) => this(isCompleted: isCompleted);

  @override
  DeckProgress completedAt(DateTime? completedAt) =>
      this(completedAt: completedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeckProgress(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeckProgress(...).copyWith(id: 12, name: "My name")
  /// ````
  DeckProgress call({
    Object? cards = const $CopyWithPlaceholder(),
    Object? isCompleted = const $CopyWithPlaceholder(),
    Object? completedAt = const $CopyWithPlaceholder(),
  }) {
    return DeckProgress(
      cards: cards == const $CopyWithPlaceholder()
          ? _value.cards
          // ignore: cast_nullable_to_non_nullable
          : cards as Map<String, CardProgress>,
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

extension $DeckProgressCopyWith on DeckProgress {
  /// Returns a callable class that can be used as follows: `instanceOfDeckProgress.copyWith(...)` or like so:`instanceOfDeckProgress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeckProgressCWProxy get copyWith => _$DeckProgressCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeckProgress _$DeckProgressFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DeckProgress',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['cards', 'is_completed']);
        final val = DeckProgress(
          cards: $checkedConvert(
            'cards',
            (v) => (v as Map<String, dynamic>).map(
              (k, e) =>
                  MapEntry(k, CardProgress.fromJson(e as Map<String, dynamic>)),
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

Map<String, dynamic> _$DeckProgressToJson(DeckProgress instance) =>
    <String, dynamic>{
      'cards': instance.cards.map((k, e) => MapEntry(k, e.toJson())),
      'is_completed': instance.isCompleted,
      'completed_at': ?instance.completedAt?.toIso8601String(),
    };
