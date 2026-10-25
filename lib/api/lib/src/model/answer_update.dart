//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer_update.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AnswerUpdate {
  /// Returns a new [AnswerUpdate] instance.
  AnswerUpdate({this.text, this.isCorrect});

  /// Updated answer text
  @JsonKey(name: r'text', required: false, includeIfNull: false)
  final String? text;

  /// Updated correctness flag
  @JsonKey(name: r'is_correct', required: false, includeIfNull: false)
  final bool? isCorrect;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerUpdate &&
          other.text == text &&
          other.isCorrect == isCorrect;

  @override
  int get hashCode => text.hashCode + isCorrect.hashCode;

  factory AnswerUpdate.fromJson(Map<String, dynamic> json) =>
      _$AnswerUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerUpdateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
