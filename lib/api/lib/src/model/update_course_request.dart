//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_course_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateCourseRequest {
  /// Returns a new [UpdateCourseRequest] instance.
  UpdateCourseRequest({this.order, this.title, this.description});

  /// Course order
  @JsonKey(name: r'order', required: false, includeIfNull: false)
  final int? order;

  /// Course title (empty string allowed)
  @JsonKey(name: r'title', required: false, includeIfNull: false)
  final String? title;

  /// Course description (empty string allowed)
  @JsonKey(name: r'description', required: false, includeIfNull: false)
  final String? description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateCourseRequest &&
          other.order == order &&
          other.title == title &&
          other.description == description;

  @override
  int get hashCode => order.hashCode + title.hashCode + description.hashCode;

  factory UpdateCourseRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCourseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCourseRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
