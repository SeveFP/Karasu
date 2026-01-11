//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/card_state.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deck_state.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeckState {
  /// Returns a new [DeckState] instance.
  DeckState({

    required  this.cards,

    required  this.isCompleted,

     this.completedAt,
  });

      /// Map of card UUID to card state (card_id → CardState)
  @JsonKey(
    
    name: r'cards',
    required: true,
    includeIfNull: false,
  )


  final Map<String, CardState> cards;



      /// Whether all cards in the deck are completed
  @JsonKey(
    
    name: r'is_completed',
    required: true,
    includeIfNull: false,
  )


  final bool isCompleted;



      /// Timestamp when the deck was completed
  @JsonKey(
    
    name: r'completed_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? completedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DeckState &&
      other.cards == cards &&
      other.isCompleted == isCompleted &&
      other.completedAt == completedAt;

    @override
    int get hashCode =>
        cards.hashCode +
        isCompleted.hashCode +
        completedAt.hashCode;

  factory DeckState.fromJson(Map<String, dynamic> json) => _$DeckStateFromJson(json);

  Map<String, dynamic> toJson() => _$DeckStateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

