// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CardCWProxy {
  Card id(String id);

  Card title(String title);

  Card possibleAnswers(List<Answer> possibleAnswers);

  Card explanation(String? explanation);

  Card kind(CardKindEnum kind);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Card(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Card(...).copyWith(id: 12, name: "My name")
  /// ````
  Card call({
    String id,
    String title,
    List<Answer> possibleAnswers,
    String? explanation,
    CardKindEnum kind,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCard.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCard.copyWith.fieldName(...)`
class _$CardCWProxyImpl implements _$CardCWProxy {
  const _$CardCWProxyImpl(this._value);

  final Card _value;

  @override
  Card id(String id) => this(id: id);

  @override
  Card title(String title) => this(title: title);

  @override
  Card possibleAnswers(List<Answer> possibleAnswers) =>
      this(possibleAnswers: possibleAnswers);

  @override
  Card explanation(String? explanation) => this(explanation: explanation);

  @override
  Card kind(CardKindEnum kind) => this(kind: kind);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Card(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Card(...).copyWith(id: 12, name: "My name")
  /// ````
  Card call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? possibleAnswers = const $CopyWithPlaceholder(),
    Object? explanation = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
  }) {
    return Card(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      possibleAnswers: possibleAnswers == const $CopyWithPlaceholder()
          ? _value.possibleAnswers
          // ignore: cast_nullable_to_non_nullable
          : possibleAnswers as List<Answer>,
      explanation: explanation == const $CopyWithPlaceholder()
          ? _value.explanation
          // ignore: cast_nullable_to_non_nullable
          : explanation as String?,
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as CardKindEnum,
    );
  }
}

extension $CardCopyWith on Card {
  /// Returns a callable class that can be used as follows: `instanceOfCard.copyWith(...)` or like so:`instanceOfCard.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CardCWProxy get copyWith => _$CardCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => $checkedCreate('Card', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'title', 'possible_answers', 'kind'],
  );
  final val = Card(
    id: $checkedConvert('id', (v) => v as String),
    title: $checkedConvert('title', (v) => v as String),
    possibleAnswers: $checkedConvert(
      'possible_answers',
      (v) => (v as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    explanation: $checkedConvert('explanation', (v) => v as String?),
    kind: $checkedConvert('kind', (v) => $enumDecode(_$CardKindEnumEnumMap, v)),
  );
  return val;
}, fieldKeyMap: const {'possibleAnswers': 'possible_answers'});

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'possible_answers': instance.possibleAnswers.map((e) => e.toJson()).toList(),
  'explanation': ?instance.explanation,
  'kind': _$CardKindEnumEnumMap[instance.kind]!,
};

const _$CardKindEnumEnumMap = {
  CardKindEnum.singleChoice: 'single_choice',
  CardKindEnum.fillInTheBlanks: 'fill_in_the_blanks',
};
