//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deck_update.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeckUpdate {
  /// Returns a new [DeckUpdate] instance.
  DeckUpdate({this.title, this.description, this.isPublic});

  /// Updated deck title
  @JsonKey(name: r'title', required: false, includeIfNull: false)
  final String? title;

  /// Updated deck description
  @JsonKey(name: r'description', required: false, includeIfNull: false)
  final String? description;

  /// Updated visibility status
  @JsonKey(name: r'is_public', required: false, includeIfNull: false)
  final bool? isPublic;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeckUpdate &&
          other.title == title &&
          other.description == description &&
          other.isPublic == isPublic;

  @override
  int get hashCode => title.hashCode + description.hashCode + isPublic.hashCode;

  factory DeckUpdate.fromJson(Map<String, dynamic> json) =>
      _$DeckUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$DeckUpdateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
