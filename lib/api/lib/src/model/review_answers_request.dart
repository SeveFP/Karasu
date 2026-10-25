//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_answers_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReviewAnswersRequest {
  /// Returns a new [ReviewAnswersRequest] instance.
  ReviewAnswersRequest({required this.answerIds});

  /// Selected answer UUIDs
  @JsonKey(name: r'answer_ids', required: true, includeIfNull: false)
  final List<String> answerIds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewAnswersRequest && other.answerIds == answerIds;

  @override
  int get hashCode => answerIds.hashCode;

  factory ReviewAnswersRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewAnswersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewAnswersRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
