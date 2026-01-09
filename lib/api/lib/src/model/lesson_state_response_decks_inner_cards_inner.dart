//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson_state_response_decks_inner_cards_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LessonStateResponseDecksInnerCardsInner {
  /// Returns a new [LessonStateResponseDecksInnerCardsInner] instance.
  LessonStateResponseDecksInnerCardsInner({

    required  this.id,

    required  this.completed,
  });

      /// Card UUID
  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



      /// Whether the card is completed
  @JsonKey(
    
    name: r'completed',
    required: true,
    includeIfNull: false,
  )


  final bool completed;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LessonStateResponseDecksInnerCardsInner &&
      other.id == id &&
      other.completed == completed;

    @override
    int get hashCode =>
        id.hashCode +
        completed.hashCode;

  factory LessonStateResponseDecksInnerCardsInner.fromJson(Map<String, dynamic> json) => _$LessonStateResponseDecksInnerCardsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$LessonStateResponseDecksInnerCardsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

