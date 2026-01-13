// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_input.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CardInputCWProxy {
  CardInput title(String title);

  CardInput possibleAnswers(List<AnswerInput> possibleAnswers);

  CardInput explanation(String? explanation);

  CardInput kind(CardInputKindEnum kind);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CardInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CardInput(...).copyWith(id: 12, name: "My name")
  /// ````
  CardInput call({
    String title,
    List<AnswerInput> possibleAnswers,
    String? explanation,
    CardInputKindEnum kind,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCardInput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCardInput.copyWith.fieldName(...)`
class _$CardInputCWProxyImpl implements _$CardInputCWProxy {
  const _$CardInputCWProxyImpl(this._value);

  final CardInput _value;

  @override
  CardInput title(String title) => this(title: title);

  @override
  CardInput possibleAnswers(List<AnswerInput> possibleAnswers) =>
      this(possibleAnswers: possibleAnswers);

  @override
  CardInput explanation(String? explanation) => this(explanation: explanation);

  @override
  CardInput kind(CardInputKindEnum kind) => this(kind: kind);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CardInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CardInput(...).copyWith(id: 12, name: "My name")
  /// ````
  CardInput call({
    Object? title = const $CopyWithPlaceholder(),
    Object? possibleAnswers = const $CopyWithPlaceholder(),
    Object? explanation = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
  }) {
    return CardInput(
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      possibleAnswers: possibleAnswers == const $CopyWithPlaceholder()
          ? _value.possibleAnswers
          // ignore: cast_nullable_to_non_nullable
          : possibleAnswers as List<AnswerInput>,
      explanation: explanation == const $CopyWithPlaceholder()
          ? _value.explanation
          // ignore: cast_nullable_to_non_nullable
          : explanation as String?,
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as CardInputKindEnum,
    );
  }
}

extension $CardInputCopyWith on CardInput {
  /// Returns a callable class that can be used as follows: `instanceOfCardInput.copyWith(...)` or like so:`instanceOfCardInput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CardInputCWProxy get copyWith => _$CardInputCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardInput _$CardInputFromJson(Map<String, dynamic> json) => $checkedCreate(
  'CardInput',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['title', 'possible_answers', 'kind']);
    final val = CardInput(
      title: $checkedConvert('title', (v) => v as String),
      possibleAnswers: $checkedConvert(
        'possible_answers',
        (v) => (v as List<dynamic>)
            .map((e) => AnswerInput.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      explanation: $checkedConvert('explanation', (v) => v as String?),
      kind: $checkedConvert(
        'kind',
        (v) => $enumDecode(_$CardInputKindEnumEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'possibleAnswers': 'possible_answers'},
);

Map<String, dynamic> _$CardInputToJson(CardInput instance) => <String, dynamic>{
  'title': instance.title,
  'possible_answers': instance.possibleAnswers.map((e) => e.toJson()).toList(),
  'explanation': ?instance.explanation,
  'kind': _$CardInputKindEnumEnumMap[instance.kind]!,
};

const _$CardInputKindEnumEnumMap = {
  CardInputKindEnum.singleChoice: 'single_choice',
  CardInputKindEnum.fillInTheBlanks: 'fill_in_the_blanks',
};
