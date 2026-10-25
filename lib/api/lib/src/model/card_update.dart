//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_update.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CardUpdate {
  /// Returns a new [CardUpdate] instance.
  CardUpdate({this.title, this.explanation, this.kind});

  /// Updated question or prompt text
  @JsonKey(name: r'title', required: false, includeIfNull: false)
  final String? title;

  /// Updated explanation text for the correct answer
  @JsonKey(name: r'explanation', required: false, includeIfNull: false)
  final String? explanation;

  /// Updated card kind/type
  @JsonKey(name: r'kind', required: false, includeIfNull: false)
  final CardUpdateKindEnum? kind;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardUpdate &&
          other.title == title &&
          other.explanation == explanation &&
          other.kind == kind;

  @override
  int get hashCode => title.hashCode + explanation.hashCode + kind.hashCode;

  factory CardUpdate.fromJson(Map<String, dynamic> json) =>
      _$CardUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$CardUpdateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// Updated card kind/type
enum CardUpdateKindEnum {
  @JsonValue(r'single_choice')
  singleChoice(r'single_choice'),
  @JsonValue(r'fill_in_the_blanks')
  fillInTheBlanks(r'fill_in_the_blanks');

  const CardUpdateKindEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
