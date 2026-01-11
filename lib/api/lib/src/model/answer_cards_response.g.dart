// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_cards_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnswerCardsResponseCWProxy {
  AnswerCardsResponse success(bool success);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnswerCardsResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnswerCardsResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  AnswerCardsResponse call({bool success});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnswerCardsResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnswerCardsResponse.copyWith.fieldName(...)`
class _$AnswerCardsResponseCWProxyImpl implements _$AnswerCardsResponseCWProxy {
  const _$AnswerCardsResponseCWProxyImpl(this._value);

  final AnswerCardsResponse _value;

  @override
  AnswerCardsResponse success(bool success) => this(success: success);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnswerCardsResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnswerCardsResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  AnswerCardsResponse call({Object? success = const $CopyWithPlaceholder()}) {
    return AnswerCardsResponse(
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success as bool,
    );
  }
}

extension $AnswerCardsResponseCopyWith on AnswerCardsResponse {
  /// Returns a callable class that can be used as follows: `instanceOfAnswerCardsResponse.copyWith(...)` or like so:`instanceOfAnswerCardsResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnswerCardsResponseCWProxy get copyWith =>
      _$AnswerCardsResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerCardsResponse _$AnswerCardsResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AnswerCardsResponse', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['success']);
      final val = AnswerCardsResponse(
        success: $checkedConvert('success', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$AnswerCardsResponseToJson(
  AnswerCardsResponse instance,
) => <String, dynamic>{'success': instance.success};
