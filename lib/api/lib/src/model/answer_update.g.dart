// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_update.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnswerUpdateCWProxy {
  AnswerUpdate text(String? text);

  AnswerUpdate isCorrect(bool? isCorrect);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnswerUpdate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnswerUpdate(...).copyWith(id: 12, name: "My name")
  /// ````
  AnswerUpdate call({String? text, bool? isCorrect});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnswerUpdate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnswerUpdate.copyWith.fieldName(...)`
class _$AnswerUpdateCWProxyImpl implements _$AnswerUpdateCWProxy {
  const _$AnswerUpdateCWProxyImpl(this._value);

  final AnswerUpdate _value;

  @override
  AnswerUpdate text(String? text) => this(text: text);

  @override
  AnswerUpdate isCorrect(bool? isCorrect) => this(isCorrect: isCorrect);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnswerUpdate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnswerUpdate(...).copyWith(id: 12, name: "My name")
  /// ````
  AnswerUpdate call({
    Object? text = const $CopyWithPlaceholder(),
    Object? isCorrect = const $CopyWithPlaceholder(),
  }) {
    return AnswerUpdate(
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String?,
      isCorrect: isCorrect == const $CopyWithPlaceholder()
          ? _value.isCorrect
          // ignore: cast_nullable_to_non_nullable
          : isCorrect as bool?,
    );
  }
}

extension $AnswerUpdateCopyWith on AnswerUpdate {
  /// Returns a callable class that can be used as follows: `instanceOfAnswerUpdate.copyWith(...)` or like so:`instanceOfAnswerUpdate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnswerUpdateCWProxy get copyWith => _$AnswerUpdateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerUpdate _$AnswerUpdateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AnswerUpdate', json, ($checkedConvert) {
      final val = AnswerUpdate(
        text: $checkedConvert('text', (v) => v as String?),
        isCorrect: $checkedConvert('is_correct', (v) => v as bool?),
      );
      return val;
    }, fieldKeyMap: const {'isCorrect': 'is_correct'});

Map<String, dynamic> _$AnswerUpdateToJson(AnswerUpdate instance) =>
    <String, dynamic>{
      'text': ?instance.text,
      'is_correct': ?instance.isCorrect,
    };
