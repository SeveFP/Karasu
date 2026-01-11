//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer_cards_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AnswerCardsResponse {
  /// Returns a new [AnswerCardsResponse] instance.
  AnswerCardsResponse({

    required  this.success,
  });

      /// Whether the operation succeeded
  @JsonKey(
    
    name: r'success',
    required: true,
    includeIfNull: false,
  )


  final bool success;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AnswerCardsResponse &&
      other.success == success;

    @override
    int get hashCode =>
        success.hashCode;

  factory AnswerCardsResponse.fromJson(Map<String, dynamic> json) => _$AnswerCardsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerCardsResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

