// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReviewResponseCWProxy {
  ReviewResponse cards(List<Card> cards);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReviewResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReviewResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  ReviewResponse call({List<Card> cards});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReviewResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReviewResponse.copyWith.fieldName(...)`
class _$ReviewResponseCWProxyImpl implements _$ReviewResponseCWProxy {
  const _$ReviewResponseCWProxyImpl(this._value);

  final ReviewResponse _value;

  @override
  ReviewResponse cards(List<Card> cards) => this(cards: cards);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReviewResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReviewResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  ReviewResponse call({Object? cards = const $CopyWithPlaceholder()}) {
    return ReviewResponse(
      cards: cards == const $CopyWithPlaceholder()
          ? _value.cards
          // ignore: cast_nullable_to_non_nullable
          : cards as List<Card>,
    );
  }
}

extension $ReviewResponseCopyWith on ReviewResponse {
  /// Returns a callable class that can be used as follows: `instanceOfReviewResponse.copyWith(...)` or like so:`instanceOfReviewResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReviewResponseCWProxy get copyWith => _$ReviewResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewResponse _$ReviewResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ReviewResponse', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['cards']);
      final val = ReviewResponse(
        cards: $checkedConvert(
          'cards',
          (v) => (v as List<dynamic>)
              .map((e) => Card.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ReviewResponseToJson(ReviewResponse instance) =>
    <String, dynamic>{'cards': instance.cards.map((e) => e.toJson()).toList()};
