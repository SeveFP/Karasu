//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/student_progress_summary.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_progress_summary_edge.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StudentProgressSummaryEdge {
  /// Returns a new [StudentProgressSummaryEdge] instance.
  StudentProgressSummaryEdge({required this.node, required this.cursor});

  @JsonKey(name: r'node', required: true, includeIfNull: false)
  final StudentProgressSummary node;

  /// Pagination cursor for this edge
  @JsonKey(name: r'cursor', required: true, includeIfNull: false)
  final String cursor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentProgressSummaryEdge &&
          other.node == node &&
          other.cursor == cursor;

  @override
  int get hashCode => node.hashCode + cursor.hashCode;

  factory StudentProgressSummaryEdge.fromJson(Map<String, dynamic> json) =>
      _$StudentProgressSummaryEdgeFromJson(json);

  Map<String, dynamic> toJson() => _$StudentProgressSummaryEdgeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
