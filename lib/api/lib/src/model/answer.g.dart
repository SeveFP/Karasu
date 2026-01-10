// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnswerCWProxy {
  Answer id(String id);

  Answer text(String text);

  Answer isCorrect(bool? isCorrect);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Answer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Answer(...).copyWith(id: 12, name: "My name")
  /// ````
  Answer call({String id, String text, bool? isCorrect});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnswer.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnswer.copyWith.fieldName(...)`
class _$AnswerCWProxyImpl implements _$AnswerCWProxy {
  const _$AnswerCWProxyImpl(this._value);

  final Answer _value;

  @override
  Answer id(String id) => this(id: id);

  @override
  Answer text(String text) => this(text: text);

  @override
  Answer isCorrect(bool? isCorrect) => this(isCorrect: isCorrect);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Answer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Answer(...).copyWith(id: 12, name: "My name")
  /// ````
  Answer call({
    Object? id = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
    Object? isCorrect = const $CopyWithPlaceholder(),
  }) {
    return Answer(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
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

extension $AnswerCopyWith on Answer {
  /// Returns a callable class that can be used as follows: `instanceOfAnswer.copyWith(...)` or like so:`instanceOfAnswer.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnswerCWProxy get copyWith => _$AnswerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Answer', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'text']);
      final val = Answer(
        id: $checkedConvert('id', (v) => v as String),
        text: $checkedConvert('text', (v) => v as String),
        isCorrect: $checkedConvert('is_correct', (v) => v as bool?),
      );
      return val;
    }, fieldKeyMap: const {'isCorrect': 'is_correct'});

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'is_correct': ?instance.isCorrect,
};
