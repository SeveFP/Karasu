//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/card.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deck.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Deck {
  /// Returns a new [Deck] instance.
  Deck({

    required  this.id,

    required  this.authorId,

    required  this.title,

    required  this.description,

    required  this.cards,
  });

      /// Deck UUID
  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



      /// Author user UUID
  @JsonKey(
    
    name: r'author_id',
    required: true,
    includeIfNull: false,
  )


  final String authorId;



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



      /// Cards in this deck
  @JsonKey(
    
    name: r'cards',
    required: true,
    includeIfNull: false,
  )


  final List<Card> cards;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Deck &&
      other.id == id &&
      other.authorId == authorId &&
      other.title == title &&
      other.description == description &&
      other.cards == cards;

    @override
    int get hashCode =>
        id.hashCode +
        authorId.hashCode +
        title.hashCode +
        description.hashCode +
        cards.hashCode;

  factory Deck.fromJson(Map<String, dynamic> json) => _$DeckFromJson(json);

  Map<String, dynamic> toJson() => _$DeckToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

