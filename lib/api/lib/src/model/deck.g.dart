// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeckCWProxy {
  Deck id(String id);

  Deck authorId(String authorId);

  Deck title(String title);

  Deck description(String description);

  Deck cards(List<Card> cards);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Deck(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Deck(...).copyWith(id: 12, name: "My name")
  /// ````
  Deck call({
    String id,
    String authorId,
    String title,
    String description,
    List<Card> cards,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeck.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeck.copyWith.fieldName(...)`
class _$DeckCWProxyImpl implements _$DeckCWProxy {
  const _$DeckCWProxyImpl(this._value);

  final Deck _value;

  @override
  Deck id(String id) => this(id: id);

  @override
  Deck authorId(String authorId) => this(authorId: authorId);

  @override
  Deck title(String title) => this(title: title);

  @override
  Deck description(String description) => this(description: description);

  @override
  Deck cards(List<Card> cards) => this(cards: cards);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Deck(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Deck(...).copyWith(id: 12, name: "My name")
  /// ````
  Deck call({
    Object? id = const $CopyWithPlaceholder(),
    Object? authorId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? cards = const $CopyWithPlaceholder(),
  }) {
    return Deck(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      authorId: authorId == const $CopyWithPlaceholder()
          ? _value.authorId
          // ignore: cast_nullable_to_non_nullable
          : authorId as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
      cards: cards == const $CopyWithPlaceholder()
          ? _value.cards
          // ignore: cast_nullable_to_non_nullable
          : cards as List<Card>,
    );
  }
}

extension $DeckCopyWith on Deck {
  /// Returns a callable class that can be used as follows: `instanceOfDeck.copyWith(...)` or like so:`instanceOfDeck.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeckCWProxy get copyWith => _$DeckCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Deck _$DeckFromJson(Map<String, dynamic> json) => $checkedCreate('Deck', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'author_id', 'title', 'description', 'cards'],
  );
  final val = Deck(
    id: $checkedConvert('id', (v) => v as String),
    authorId: $checkedConvert('author_id', (v) => v as String),
    title: $checkedConvert('title', (v) => v as String),
    description: $checkedConvert('description', (v) => v as String),
    cards: $checkedConvert(
      'cards',
      (v) => (v as List<dynamic>)
          .map((e) => Card.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
}, fieldKeyMap: const {'authorId': 'author_id'});

Map<String, dynamic> _$DeckToJson(Deck instance) => <String, dynamic>{
  'id': instance.id,
  'author_id': instance.authorId,
  'title': instance.title,
  'description': instance.description,
  'cards': instance.cards.map((e) => e.toJson()).toList(),
};
