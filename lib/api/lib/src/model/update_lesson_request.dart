//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_lesson_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateLessonRequest {
  /// Returns a new [UpdateLessonRequest] instance.
  UpdateLessonRequest({this.order, this.title, this.description, this.body});

  /// Lesson order within course
  @JsonKey(name: r'order', required: false, includeIfNull: false)
  final int? order;

  /// Lesson title (empty string allowed)
  @JsonKey(name: r'title', required: false, includeIfNull: false)
  final String? title;

  /// Lesson description (empty string allowed)
  @JsonKey(name: r'description', required: false, includeIfNull: false)
  final String? description;

  /// Lesson content body; if provided, must embed at least one deck reference in the markdown form `![deck](uuid)`
  @JsonKey(name: r'body', required: false, includeIfNull: false)
  final String? body;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateLessonRequest &&
          other.order == order &&
          other.title == title &&
          other.description == description &&
          other.body == body;

  @override
  int get hashCode =>
      order.hashCode + title.hashCode + description.hashCode + body.hashCode;

  factory UpdateLessonRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateLessonRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateLessonRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
