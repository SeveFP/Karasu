//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bodyless_lesson.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BodylessLesson {
  /// Returns a new [BodylessLesson] instance.
  BodylessLesson({
    required this.id,

    required this.courseId,

    required this.order,

    required this.title,

    required this.description,

    required this.createdAt,

    this.updatedAt,

    this.deletedAt,
  });

  /// Lesson UUID
  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  /// Parent course UUID
  @JsonKey(name: r'course_id', required: true, includeIfNull: false)
  final String courseId;

  /// Lesson order within course
  @JsonKey(name: r'order', required: true, includeIfNull: false)
  final int order;

  /// Lesson title
  @JsonKey(name: r'title', required: true, includeIfNull: false)
  final String title;

  /// Lesson description
  @JsonKey(name: r'description', required: true, includeIfNull: false)
  final String description;

  /// Creation timestamp
  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// Last edit timestamp
  @JsonKey(name: r'updated_at', required: false, includeIfNull: false)
  final DateTime? updatedAt;

  /// Deletion timestamp
  @JsonKey(name: r'deleted_at', required: false, includeIfNull: false)
  final DateTime? deletedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BodylessLesson &&
          other.id == id &&
          other.courseId == courseId &&
          other.order == order &&
          other.title == title &&
          other.description == description &&
          other.createdAt == createdAt &&
          other.updatedAt == updatedAt &&
          other.deletedAt == deletedAt;

  @override
  int get hashCode =>
      id.hashCode +
      courseId.hashCode +
      order.hashCode +
      title.hashCode +
      description.hashCode +
      createdAt.hashCode +
      updatedAt.hashCode +
      deletedAt.hashCode;

  factory BodylessLesson.fromJson(Map<String, dynamic> json) =>
      _$BodylessLessonFromJson(json);

  Map<String, dynamic> toJson() => _$BodylessLessonToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
