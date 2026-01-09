//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/card_input.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deck_input.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeckInput {
  /// Returns a new [DeckInput] instance.
  DeckInput({

    required  this.title,

    required  this.description,

     this.isPublic = false,

    required  this.cards,
  });

      /// Deck title
  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



      /// Deck description
  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: false,
  )


  final String description;



      /// Whether deck is publicly visible
  @JsonKey(
    defaultValue: false,
    name: r'is_public',
    required: false,
    includeIfNull: false,
  )


  final bool? isPublic;



      /// Cards to include in the deck
  @JsonKey(
    
    name: r'cards',
    required: true,
    includeIfNull: false,
  )


  final List<CardInput> cards;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DeckInput &&
      other.title == title &&
      other.description == description &&
      other.isPublic == isPublic &&
      other.cards == cards;

    @override
    int get hashCode =>
        title.hashCode +
        description.hashCode +
        isPublic.hashCode +
        cards.hashCode;

  factory DeckInput.fromJson(Map<String, dynamic> json) => _$DeckInputFromJson(json);

  Map<String, dynamic> toJson() => _$DeckInputToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

