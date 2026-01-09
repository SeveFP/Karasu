//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer_input.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AnswerInput {
  /// Returns a new [AnswerInput] instance.
  AnswerInput({

    required  this.text,

     this.isCorrect,
  });

      /// Answer text
  @JsonKey(
    
    name: r'text',
    required: true,
    includeIfNull: false,
  )


  final String text;



      /// Whether this is the correct answer
  @JsonKey(
    
    name: r'is_correct',
    required: false,
    includeIfNull: false,
  )


  final bool? isCorrect;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AnswerInput &&
      other.text == text &&
      other.isCorrect == isCorrect;

    @override
    int get hashCode =>
        text.hashCode +
        isCorrect.hashCode;

  factory AnswerInput.fromJson(Map<String, dynamic> json) => _$AnswerInputFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerInputToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

