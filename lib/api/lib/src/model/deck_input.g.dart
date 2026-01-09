// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_input.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeckInputCWProxy {
  DeckInput title(String title);

  DeckInput description(String description);

  DeckInput isPublic(bool? isPublic);

  DeckInput cards(List<CardInput> cards);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeckInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeckInput(...).copyWith(id: 12, name: "My name")
  /// ````
  DeckInput call({
    String title,
    String description,
    bool? isPublic,
    List<CardInput> cards,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeckInput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeckInput.copyWith.fieldName(...)`
class _$DeckInputCWProxyImpl implements _$DeckInputCWProxy {
  const _$DeckInputCWProxyImpl(this._value);

  final DeckInput _value;

  @override
  DeckInput title(String title) => this(title: title);

  @override
  DeckInput description(String description) => this(description: description);

  @override
  DeckInput isPublic(bool? isPublic) => this(isPublic: isPublic);

  @override
  DeckInput cards(List<CardInput> cards) => this(cards: cards);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeckInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeckInput(...).copyWith(id: 12, name: "My name")
  /// ````
  DeckInput call({
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? isPublic = const $CopyWithPlaceholder(),
    Object? cards = const $CopyWithPlaceholder(),
  }) {
    return DeckInput(
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
      isPublic: isPublic == const $CopyWithPlaceholder()
          ? _value.isPublic
          // ignore: cast_nullable_to_non_nullable
          : isPublic as bool?,
      cards: cards == const $CopyWithPlaceholder()
          ? _value.cards
          // ignore: cast_nullable_to_non_nullable
          : cards as List<CardInput>,
    );
  }
}

extension $DeckInputCopyWith on DeckInput {
  /// Returns a callable class that can be used as follows: `instanceOfDeckInput.copyWith(...)` or like so:`instanceOfDeckInput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeckInputCWProxy get copyWith => _$DeckInputCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeckInput _$DeckInputFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DeckInput', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['title', 'description', 'cards']);
      final val = DeckInput(
        title: $checkedConvert('title', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        isPublic: $checkedConvert('is_public', (v) => v as bool? ?? false),
        cards: $checkedConvert(
          'cards',
          (v) => (v as List<dynamic>)
              .map((e) => CardInput.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'isPublic': 'is_public'});

Map<String, dynamic> _$DeckInputToJson(DeckInput instance) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'is_public': ?instance.isPublic,
  'cards': instance.cards.map((e) => e.toJson()).toList(),
};
