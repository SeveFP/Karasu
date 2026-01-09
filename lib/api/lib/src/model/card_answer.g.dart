// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_answer.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CardAnswerCWProxy {
  CardAnswer cardId(String cardId);

  CardAnswer answerId(String answerId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CardAnswer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CardAnswer(...).copyWith(id: 12, name: "My name")
  /// ````
  CardAnswer call({String cardId, String answerId});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCardAnswer.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCardAnswer.copyWith.fieldName(...)`
class _$CardAnswerCWProxyImpl implements _$CardAnswerCWProxy {
  const _$CardAnswerCWProxyImpl(this._value);

  final CardAnswer _value;

  @override
  CardAnswer cardId(String cardId) => this(cardId: cardId);

  @override
  CardAnswer answerId(String answerId) => this(answerId: answerId);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CardAnswer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CardAnswer(...).copyWith(id: 12, name: "My name")
  /// ````
  CardAnswer call({
    Object? cardId = const $CopyWithPlaceholder(),
    Object? answerId = const $CopyWithPlaceholder(),
  }) {
    return CardAnswer(
      cardId: cardId == const $CopyWithPlaceholder()
          ? _value.cardId
          // ignore: cast_nullable_to_non_nullable
          : cardId as String,
      answerId: answerId == const $CopyWithPlaceholder()
          ? _value.answerId
          // ignore: cast_nullable_to_non_nullable
          : answerId as String,
    );
  }
}

extension $CardAnswerCopyWith on CardAnswer {
  /// Returns a callable class that can be used as follows: `instanceOfCardAnswer.copyWith(...)` or like so:`instanceOfCardAnswer.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CardAnswerCWProxy get copyWith => _$CardAnswerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardAnswer _$CardAnswerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CardAnswer', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['card_id', 'answer_id']);
      final val = CardAnswer(
        cardId: $checkedConvert('card_id', (v) => v as String),
        answerId: $checkedConvert('answer_id', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'cardId': 'card_id', 'answerId': 'answer_id'});

Map<String, dynamic> _$CardAnswerToJson(CardAnswer instance) =>
    <String, dynamic>{
      'card_id': instance.cardId,
      'answer_id': instance.answerId,
    };
