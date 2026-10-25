// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_update.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CardUpdateCWProxy {
  CardUpdate title(String? title);

  CardUpdate explanation(String? explanation);

  CardUpdate kind(CardUpdateKindEnum? kind);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CardUpdate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CardUpdate(...).copyWith(id: 12, name: "My name")
  /// ````
  CardUpdate call({
    String? title,
    String? explanation,
    CardUpdateKindEnum? kind,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCardUpdate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCardUpdate.copyWith.fieldName(...)`
class _$CardUpdateCWProxyImpl implements _$CardUpdateCWProxy {
  const _$CardUpdateCWProxyImpl(this._value);

  final CardUpdate _value;

  @override
  CardUpdate title(String? title) => this(title: title);

  @override
  CardUpdate explanation(String? explanation) => this(explanation: explanation);

  @override
  CardUpdate kind(CardUpdateKindEnum? kind) => this(kind: kind);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CardUpdate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CardUpdate(...).copyWith(id: 12, name: "My name")
  /// ````
  CardUpdate call({
    Object? title = const $CopyWithPlaceholder(),
    Object? explanation = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
  }) {
    return CardUpdate(
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      explanation: explanation == const $CopyWithPlaceholder()
          ? _value.explanation
          // ignore: cast_nullable_to_non_nullable
          : explanation as String?,
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as CardUpdateKindEnum?,
    );
  }
}

extension $CardUpdateCopyWith on CardUpdate {
  /// Returns a callable class that can be used as follows: `instanceOfCardUpdate.copyWith(...)` or like so:`instanceOfCardUpdate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CardUpdateCWProxy get copyWith => _$CardUpdateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardUpdate _$CardUpdateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CardUpdate', json, ($checkedConvert) {
      final val = CardUpdate(
        title: $checkedConvert('title', (v) => v as String?),
        explanation: $checkedConvert('explanation', (v) => v as String?),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecodeNullable(_$CardUpdateKindEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CardUpdateToJson(CardUpdate instance) =>
    <String, dynamic>{
      'title': ?instance.title,
      'explanation': ?instance.explanation,
      'kind': ?_$CardUpdateKindEnumEnumMap[instance.kind],
    };

const _$CardUpdateKindEnumEnumMap = {
  CardUpdateKindEnum.singleChoice: 'single_choice',
  CardUpdateKindEnum.fillInTheBlanks: 'fill_in_the_blanks',
};
