//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_state_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserStateResponse {
  /// Returns a new [UserStateResponse] instance.
  UserStateResponse({
    required this.id,

    required this.userId,

    required this.courseId,

    required this.currentLessonId,

    required this.stateJson,

    required this.createdAt,

    required this.updatedAt,
  });

  /// Progress record UUID
  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'user_id', required: true, includeIfNull: false)
  final String userId;

  @JsonKey(name: r'course_id', required: true, includeIfNull: false)
  final String courseId;

  @JsonKey(name: r'current_lesson_id', required: true, includeIfNull: false)
  final String currentLessonId;

  /// The full progress state as a JSON string
  @JsonKey(name: r'state_json', required: true, includeIfNull: false)
  final String stateJson;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  @JsonKey(name: r'updated_at', required: true, includeIfNull: false)
  final DateTime updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStateResponse &&
          other.id == id &&
          other.userId == userId &&
          other.courseId == courseId &&
          other.currentLessonId == currentLessonId &&
          other.stateJson == stateJson &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      id.hashCode +
      userId.hashCode +
      courseId.hashCode +
      currentLessonId.hashCode +
      stateJson.hashCode +
      createdAt.hashCode +
      updatedAt.hashCode;

  factory UserStateResponse.fromJson(Map<String, dynamic> json) =>
      _$UserStateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserStateResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
