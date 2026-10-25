//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/page_info.dart';
import 'package:toshokan_api/src/model/student_progress_summary_edge.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'students_progress_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StudentsProgressResponse {
  /// Returns a new [StudentsProgressResponse] instance.
  StudentsProgressResponse({
    required this.edges,

    required this.pageInfo,

    required this.totalEnrolled,
  });

  @JsonKey(name: r'edges', required: true, includeIfNull: false)
  final List<StudentProgressSummaryEdge> edges;

  @JsonKey(name: r'page_info', required: true, includeIfNull: false)
  final PageInfo pageInfo;

  /// Total number of enrolled students in the course
  @JsonKey(name: r'total_enrolled', required: true, includeIfNull: false)
  final int totalEnrolled;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentsProgressResponse &&
          other.edges == edges &&
          other.pageInfo == pageInfo &&
          other.totalEnrolled == totalEnrolled;

  @override
  int get hashCode =>
      edges.hashCode + pageInfo.hashCode + totalEnrolled.hashCode;

  factory StudentsProgressResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentsProgressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentsProgressResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
