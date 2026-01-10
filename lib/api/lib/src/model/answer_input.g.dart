// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_input.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnswerInputCWProxy {
  AnswerInput text(String text);

  AnswerInput isCorrect(bool? isCorrect);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnswerInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnswerInput(...).copyWith(id: 12, name: "My name")
  /// ````
  AnswerInput call({String text, bool? isCorrect});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnswerInput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnswerInput.copyWith.fieldName(...)`
class _$AnswerInputCWProxyImpl implements _$AnswerInputCWProxy {
  const _$AnswerInputCWProxyImpl(this._value);

  final AnswerInput _value;

  @override
  AnswerInput text(String text) => this(text: text);

  @override
  AnswerInput isCorrect(bool? isCorrect) => this(isCorrect: isCorrect);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnswerInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnswerInput(...).copyWith(id: 12, name: "My name")
  /// ````
  AnswerInput call({
    Object? text = const $CopyWithPlaceholder(),
    Object? isCorrect = const $CopyWithPlaceholder(),
  }) {
    return AnswerInput(
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String,
      isCorrect: isCorrect == const $CopyWithPlaceholder()
          ? _value.isCorrect
          // ignore: cast_nullable_to_non_nullable
          : isCorrect as bool?,
    );
  }
}

extension $AnswerInputCopyWith on AnswerInput {
  /// Returns a callable class that can be used as follows: `instanceOfAnswerInput.copyWith(...)` or like so:`instanceOfAnswerInput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnswerInputCWProxy get copyWith => _$AnswerInputCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerInput _$AnswerInputFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AnswerInput', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['text']);
      final val = AnswerInput(
        text: $checkedConvert('text', (v) => v as String),
        isCorrect: $checkedConvert('is_correct', (v) => v as bool?),
      );
      return val;
    }, fieldKeyMap: const {'isCorrect': 'is_correct'});

Map<String, dynamic> _$AnswerInputToJson(AnswerInput instance) =>
    <String, dynamic>{'text': instance.text, 'is_correct': ?instance.isCorrect};
