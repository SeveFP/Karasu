// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_answer_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateAnswerRequestCWProxy {
  CreateAnswerRequest text(String text);

  CreateAnswerRequest isCorrect(bool isCorrect);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateAnswerRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateAnswerRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateAnswerRequest call({String text, bool isCorrect});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateAnswerRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateAnswerRequest.copyWith.fieldName(...)`
class _$CreateAnswerRequestCWProxyImpl implements _$CreateAnswerRequestCWProxy {
  const _$CreateAnswerRequestCWProxyImpl(this._value);

  final CreateAnswerRequest _value;

  @override
  CreateAnswerRequest text(String text) => this(text: text);

  @override
  CreateAnswerRequest isCorrect(bool isCorrect) => this(isCorrect: isCorrect);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateAnswerRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateAnswerRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateAnswerRequest call({
    Object? text = const $CopyWithPlaceholder(),
    Object? isCorrect = const $CopyWithPlaceholder(),
  }) {
    return CreateAnswerRequest(
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String,
      isCorrect: isCorrect == const $CopyWithPlaceholder()
          ? _value.isCorrect
          // ignore: cast_nullable_to_non_nullable
          : isCorrect as bool,
    );
  }
}

extension $CreateAnswerRequestCopyWith on CreateAnswerRequest {
  /// Returns a callable class that can be used as follows: `instanceOfCreateAnswerRequest.copyWith(...)` or like so:`instanceOfCreateAnswerRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateAnswerRequestCWProxy get copyWith =>
      _$CreateAnswerRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAnswerRequest _$CreateAnswerRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CreateAnswerRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['text', 'is_correct']);
      final val = CreateAnswerRequest(
        text: $checkedConvert('text', (v) => v as String),
        isCorrect: $checkedConvert('is_correct', (v) => v as bool),
      );
      return val;
    }, fieldKeyMap: const {'isCorrect': 'is_correct'});

Map<String, dynamic> _$CreateAnswerRequestToJson(
  CreateAnswerRequest instance,
) => <String, dynamic>{'text': instance.text, 'is_correct': instance.isCorrect};
