//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/user_course_progress.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer_cards_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AnswerCardsResponse {
  /// Returns a new [AnswerCardsResponse] instance.
  AnswerCardsResponse({

    required  this.success,

     this.deckCompleted,

     this.lessonCompleted,

     this.userProgress,
  });

      /// Whether the operation succeeded
  @JsonKey(
    
    name: r'success',
    required: true,
    includeIfNull: false,
  )


  final bool success;



      /// Whether the deck was completed with these answers
  @JsonKey(
    
    name: r'deck_completed',
    required: false,
    includeIfNull: false,
  )


  final bool? deckCompleted;



      /// Whether the lesson was completed
  @JsonKey(
    
    name: r'lesson_completed',
    required: false,
    includeIfNull: false,
  )


  final bool? lessonCompleted;



  @JsonKey(
    
    name: r'user_progress',
    required: false,
    includeIfNull: false,
  )


  final UserCourseProgress? userProgress;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AnswerCardsResponse &&
      other.success == success &&
      other.deckCompleted == deckCompleted &&
      other.lessonCompleted == lessonCompleted &&
      other.userProgress == userProgress;

    @override
    int get hashCode =>
        success.hashCode +
        deckCompleted.hashCode +
        lessonCompleted.hashCode +
        userProgress.hashCode;

  factory AnswerCardsResponse.fromJson(Map<String, dynamic> json) => _$AnswerCardsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerCardsResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

