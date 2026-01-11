// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeckStateCWProxy {
  DeckState cards(Map<String, CardState> cards);

  DeckState isCompleted(bool isCompleted);

  DeckState completedAt(DateTime? completedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeckState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeckState(...).copyWith(id: 12, name: "My name")
  /// ````
  DeckState call({
    Map<String, CardState> cards,
    bool isCompleted,
    DateTime? completedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeckState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeckState.copyWith.fieldName(...)`
class _$DeckStateCWProxyImpl implements _$DeckStateCWProxy {
  const _$DeckStateCWProxyImpl(this._value);

  final DeckState _value;

  @override
  DeckState cards(Map<String, CardState> cards) => this(cards: cards);

  @override
  DeckState isCompleted(bool isCompleted) => this(isCompleted: isCompleted);

  @override
  DeckState completedAt(DateTime? completedAt) =>
      this(completedAt: completedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeckState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeckState(...).copyWith(id: 12, name: "My name")
  /// ````
  DeckState call({
    Object? cards = const $CopyWithPlaceholder(),
    Object? isCompleted = const $CopyWithPlaceholder(),
    Object? completedAt = const $CopyWithPlaceholder(),
  }) {
    return DeckState(
      cards: cards == const $CopyWithPlaceholder()
          ? _value.cards
          // ignore: cast_nullable_to_non_nullable
          : cards as Map<String, CardState>,
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

extension $DeckStateCopyWith on DeckState {
  /// Returns a callable class that can be used as follows: `instanceOfDeckState.copyWith(...)` or like so:`instanceOfDeckState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeckStateCWProxy get copyWith => _$DeckStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeckState _$DeckStateFromJson(Map<String, dynamic> json) => $checkedCreate(
  'DeckState',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['cards', 'is_completed']);
    final val = DeckState(
      cards: $checkedConvert(
        'cards',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) => MapEntry(k, CardState.fromJson(e as Map<String, dynamic>)),
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

Map<String, dynamic> _$DeckStateToJson(DeckState instance) => <String, dynamic>{
  'cards': instance.cards.map((k, e) => MapEntry(k, e.toJson())),
  'is_completed': instance.isCompleted,
  'completed_at': ?instance.completedAt?.toIso8601String(),
};
