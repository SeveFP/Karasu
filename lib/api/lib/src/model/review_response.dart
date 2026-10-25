//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/card.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReviewResponse {
  /// Returns a new [ReviewResponse] instance.
  ReviewResponse({required this.cards});

  @JsonKey(name: r'cards', required: true, includeIfNull: false)
  final List<Card> cards;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ReviewResponse && other.cards == cards;

  @override
  int get hashCode => cards.hashCode;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
