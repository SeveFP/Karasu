//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_answer.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CardAnswer {
  /// Returns a new [CardAnswer] instance.
  CardAnswer({

    required  this.cardId,

    required  this.answerId,
  });

      /// Card UUID being answered
  @JsonKey(
    
    name: r'card_id',
    required: true,
    includeIfNull: false,
  )


  final String cardId;



      /// Selected answer UUID
  @JsonKey(
    
    name: r'answer_id',
    required: true,
    includeIfNull: false,
  )


  final String answerId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CardAnswer &&
      other.cardId == cardId &&
      other.answerId == answerId;

    @override
    int get hashCode =>
        cardId.hashCode +
        answerId.hashCode;

  factory CardAnswer.fromJson(Map<String, dynamic> json) => _$CardAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$CardAnswerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

