//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/answer_input.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_input.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CardInput {
  /// Returns a new [CardInput] instance.
  CardInput({

    required  this.title,

    required  this.possibleAnswers,

     this.explanation,

    required  this.kind,
  });

      /// Question or prompt text
  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



      /// Multiple choice answers
  @JsonKey(
    
    name: r'possible_answers',
    required: true,
    includeIfNull: false,
  )


  final List<AnswerInput> possibleAnswers;



      /// Explanation text for the correct answer
  @JsonKey(
    
    name: r'explanation',
    required: false,
    includeIfNull: false,
  )


  final String? explanation;



      /// Card kind/type
  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final CardInputKindEnum kind;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CardInput &&
      other.title == title &&
      other.possibleAnswers == possibleAnswers &&
      other.explanation == explanation &&
      other.kind == kind;

    @override
    int get hashCode =>
        title.hashCode +
        possibleAnswers.hashCode +
        explanation.hashCode +
        kind.hashCode;

  factory CardInput.fromJson(Map<String, dynamic> json) => _$CardInputFromJson(json);

  Map<String, dynamic> toJson() => _$CardInputToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Card kind/type
enum CardInputKindEnum {
    /// Card kind/type
@JsonValue(r'single_choice')
singleChoice(r'single_choice'),
    /// Card kind/type
@JsonValue(r'fill_in_the_blanks')
fillInTheBlanks(r'fill_in_the_blanks');

const CardInputKindEnum(this.value);

final String value;

@override
String toString() => value;
}


