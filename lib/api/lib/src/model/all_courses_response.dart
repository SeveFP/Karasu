//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/page_info.dart';
import 'package:toshokan_api/src/model/course_edge.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_courses_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AllCoursesResponse {
  /// Returns a new [AllCoursesResponse] instance.
  AllCoursesResponse({
    required this.edges,

    required this.pageInfo,

    required this.totalCount,
  });

  @JsonKey(name: r'edges', required: true, includeIfNull: false)
  final List<CourseEdge> edges;

  @JsonKey(name: r'page_info', required: true, includeIfNull: false)
  final PageInfo pageInfo;

  /// Total number of courses in the system
  @JsonKey(name: r'total_count', required: true, includeIfNull: false)
  final int totalCount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllCoursesResponse &&
          other.edges == edges &&
          other.pageInfo == pageInfo &&
          other.totalCount == totalCount;

  @override
  int get hashCode => edges.hashCode + pageInfo.hashCode + totalCount.hashCode;

  factory AllCoursesResponse.fromJson(Map<String, dynamic> json) =>
      _$AllCoursesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllCoursesResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
