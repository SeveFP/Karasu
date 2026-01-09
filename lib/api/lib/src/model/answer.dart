//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Answer {
  /// Returns a new [Answer] instance.
  Answer({

    required  this.id,

    required  this.text,

     this.isCorrect,
  });

      /// Answer UUID
  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



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
    bool operator ==(Object other) => identical(this, other) || other is Answer &&
      other.id == id &&
      other.text == text &&
      other.isCorrect == isCorrect;

    @override
    int get hashCode =>
        id.hashCode +
        text.hashCode +
        isCorrect.hashCode;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

