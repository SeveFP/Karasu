//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/deck_state.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson_state.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LessonState {
  /// Returns a new [LessonState] instance.
  LessonState({

    required  this.decks,

    required  this.isCompleted,

     this.completedAt,
  });

      /// Map of deck UUID to deck state (deck_id → DeckState)
  @JsonKey(
    
    name: r'decks',
    required: true,
    includeIfNull: false,
  )


  final Map<String, DeckState> decks;



      /// Whether all decks in the lesson are completed
  @JsonKey(
    
    name: r'is_completed',
    required: true,
    includeIfNull: false,
  )


  final bool isCompleted;



      /// Timestamp when the lesson was completed
  @JsonKey(
    
    name: r'completed_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? completedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LessonState &&
      other.decks == decks &&
      other.isCompleted == isCompleted &&
      other.completedAt == completedAt;

    @override
    int get hashCode =>
        decks.hashCode +
        isCompleted.hashCode +
        completedAt.hashCode;

  factory LessonState.fromJson(Map<String, dynamic> json) => _$LessonStateFromJson(json);

  Map<String, dynamic> toJson() => _$LessonStateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

