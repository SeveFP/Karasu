//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/lesson_state_response_decks_inner_cards_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson_state_response_decks_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LessonStateResponseDecksInner {
  /// Returns a new [LessonStateResponseDecksInner] instance.
  LessonStateResponseDecksInner({

    required  this.id,

    required  this.completed,

    required  this.cards,
  });

      /// Deck UUID
  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



      /// Whether the deck is completed
  @JsonKey(
    
    name: r'completed',
    required: true,
    includeIfNull: false,
  )


  final bool completed;



      /// Array of card completion statuses
  @JsonKey(
    
    name: r'cards',
    required: true,
    includeIfNull: false,
  )


  final List<LessonStateResponseDecksInnerCardsInner> cards;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LessonStateResponseDecksInner &&
      other.id == id &&
      other.completed == completed &&
      other.cards == cards;

    @override
    int get hashCode =>
        id.hashCode +
        completed.hashCode +
        cards.hashCode;

  factory LessonStateResponseDecksInner.fromJson(Map<String, dynamic> json) => _$LessonStateResponseDecksInnerFromJson(json);

  Map<String, dynamic> toJson() => _$LessonStateResponseDecksInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

