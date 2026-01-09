//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/lesson_state_response_decks_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson_state_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LessonStateResponse {
  /// Returns a new [LessonStateResponse] instance.
  LessonStateResponse({

    required  this.id,

    required  this.completed,

    required  this.decks,
  });

      /// Lesson UUID
  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



      /// Whether the lesson is completed
  @JsonKey(
    
    name: r'completed',
    required: true,
    includeIfNull: false,
  )


  final bool completed;



      /// Array of deck completion statuses
  @JsonKey(
    
    name: r'decks',
    required: true,
    includeIfNull: false,
  )


  final List<LessonStateResponseDecksInner> decks;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LessonStateResponse &&
      other.id == id &&
      other.completed == completed &&
      other.decks == decks;

    @override
    int get hashCode =>
        id.hashCode +
        completed.hashCode +
        decks.hashCode;

  factory LessonStateResponse.fromJson(Map<String, dynamic> json) => _$LessonStateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LessonStateResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

