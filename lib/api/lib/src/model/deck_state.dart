//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
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

    required  this.id,

    required  this.completed,
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is DeckState &&
      other.id == id &&
      other.completed == completed;

    @override
    int get hashCode =>
        id.hashCode +
        completed.hashCode;

  factory DeckState.fromJson(Map<String, dynamic> json) => _$DeckStateFromJson(json);

  Map<String, dynamic> toJson() => _$DeckStateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

