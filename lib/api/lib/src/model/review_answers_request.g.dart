// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_answers_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReviewAnswersRequestCWProxy {
  ReviewAnswersRequest answerIds(List<String> answerIds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReviewAnswersRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReviewAnswersRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ReviewAnswersRequest call({List<String> answerIds});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReviewAnswersRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReviewAnswersRequest.copyWith.fieldName(...)`
class _$ReviewAnswersRequestCWProxyImpl
    implements _$ReviewAnswersRequestCWProxy {
  const _$ReviewAnswersRequestCWProxyImpl(this._value);

  final ReviewAnswersRequest _value;

  @override
  ReviewAnswersRequest answerIds(List<String> answerIds) =>
      this(answerIds: answerIds);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReviewAnswersRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReviewAnswersRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ReviewAnswersRequest call({
    Object? answerIds = const $CopyWithPlaceholder(),
  }) {
    return ReviewAnswersRequest(
      answerIds: answerIds == const $CopyWithPlaceholder()
          ? _value.answerIds
          // ignore: cast_nullable_to_non_nullable
          : answerIds as List<String>,
    );
  }
}

extension $ReviewAnswersRequestCopyWith on ReviewAnswersRequest {
  /// Returns a callable class that can be used as follows: `instanceOfReviewAnswersRequest.copyWith(...)` or like so:`instanceOfReviewAnswersRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReviewAnswersRequestCWProxy get copyWith =>
      _$ReviewAnswersRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewAnswersRequest _$ReviewAnswersRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReviewAnswersRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['answer_ids']);
  final val = ReviewAnswersRequest(
    answerIds: $checkedConvert(
      'answer_ids',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
  );
  return val;
}, fieldKeyMap: const {'answerIds': 'answer_ids'});

Map<String, dynamic> _$ReviewAnswersRequestToJson(
  ReviewAnswersRequest instance,
) => <String, dynamic>{'answer_ids': instance.answerIds};
