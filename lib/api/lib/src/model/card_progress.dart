//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_progress.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CardProgress {
  /// Returns a new [CardProgress] instance.
  CardProgress({

    required  this.correctAnswers,

    required  this.incorrectAnswers,

    required  this.isCompleted,

     this.completedAt,
  });

      /// Number of correct answers for this card
  @JsonKey(
    
    name: r'correct_answers',
    required: true,
    includeIfNull: false,
  )


  final int correctAnswers;



      /// Number of incorrect answers for this card
  @JsonKey(
    
    name: r'incorrect_answers',
    required: true,
    includeIfNull: false,
  )


  final int incorrectAnswers;



      /// Whether the card is completed (answered correctly at least once)
  @JsonKey(
    
    name: r'is_completed',
    required: true,
    includeIfNull: false,
  )


  final bool isCompleted;



      /// Timestamp when the card was completed
  @JsonKey(
    
    name: r'completed_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? completedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CardProgress &&
      other.correctAnswers == correctAnswers &&
      other.incorrectAnswers == incorrectAnswers &&
      other.isCompleted == isCompleted &&
      other.completedAt == completedAt;

    @override
    int get hashCode =>
        correctAnswers.hashCode +
        incorrectAnswers.hashCode +
        isCompleted.hashCode +
        completedAt.hashCode;

  factory CardProgress.fromJson(Map<String, dynamic> json) => _$CardProgressFromJson(json);

  Map<String, dynamic> toJson() => _$CardProgressToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

