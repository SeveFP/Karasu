//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_answer_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateAnswerRequest {
  /// Returns a new [CreateAnswerRequest] instance.
  CreateAnswerRequest({required this.text, required this.isCorrect});

  @JsonKey(name: r'text', required: true, includeIfNull: false)
  final String text;

  @JsonKey(name: r'is_correct', required: true, includeIfNull: false)
  final bool isCorrect;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateAnswerRequest &&
          other.text == text &&
          other.isCorrect == isCorrect;

  @override
  int get hashCode => text.hashCode + isCorrect.hashCode;

  factory CreateAnswerRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAnswerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAnswerRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
