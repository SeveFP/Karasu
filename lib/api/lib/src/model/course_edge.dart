//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/course.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_edge.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CourseEdge {
  /// Returns a new [CourseEdge] instance.
  CourseEdge({required this.node, required this.cursor});

  @JsonKey(name: r'node', required: true, includeIfNull: false)
  final Course node;

  /// Pagination cursor for this edge
  @JsonKey(name: r'cursor', required: true, includeIfNull: false)
  final String cursor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseEdge && other.node == node && other.cursor == cursor;

  @override
  int get hashCode => node.hashCode + cursor.hashCode;

  factory CourseEdge.fromJson(Map<String, dynamic> json) =>
      _$CourseEdgeFromJson(json);

  Map<String, dynamic> toJson() => _$CourseEdgeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
