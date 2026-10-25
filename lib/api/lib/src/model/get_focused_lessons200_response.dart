//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/lessons_with_progress_connection_response.dart';
import 'package:toshokan_api/src/model/page_info.dart';
import 'package:toshokan_api/src/model/bodyless_lesson_with_progress_edge.dart';
import 'package:toshokan_api/src/model/bodyless_lessons_with_progress_connection_response.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_focused_lessons200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetFocusedLessons200Response {
  /// Returns a new [GetFocusedLessons200Response] instance.
  GetFocusedLessons200Response({required this.edges, required this.pageInfo});

  @JsonKey(name: r'edges', required: true, includeIfNull: false)
  final List<BodylessLessonWithProgressEdge> edges;

  @JsonKey(name: r'page_info', required: true, includeIfNull: false)
  final PageInfo pageInfo;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetFocusedLessons200Response &&
          other.edges == edges &&
          other.pageInfo == pageInfo;

  @override
  int get hashCode => edges.hashCode + pageInfo.hashCode;

  factory GetFocusedLessons200Response.fromJson(Map<String, dynamic> json) =>
      _$GetFocusedLessons200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetFocusedLessons200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
