//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_user_state_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetUserStateRequest {
  /// Returns a new [SetUserStateRequest] instance.
  SetUserStateRequest({required this.stateJson, this.currentLessonId});

  /// The full progress state as a JSON string
  @JsonKey(name: r'state_json', required: true, includeIfNull: false)
  final String stateJson;

  /// The current lesson ID to set. If omitted, the current lesson remains unchanged.
  @JsonKey(name: r'current_lesson_id', required: false, includeIfNull: false)
  final String? currentLessonId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SetUserStateRequest &&
          other.stateJson == stateJson &&
          other.currentLessonId == currentLessonId;

  @override
  int get hashCode => stateJson.hashCode + currentLessonId.hashCode;

  factory SetUserStateRequest.fromJson(Map<String, dynamic> json) =>
      _$SetUserStateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetUserStateRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
