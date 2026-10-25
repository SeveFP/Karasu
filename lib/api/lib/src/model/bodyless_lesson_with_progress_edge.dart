//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/bodyless_lesson_with_progress.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bodyless_lesson_with_progress_edge.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BodylessLessonWithProgressEdge {
  /// Returns a new [BodylessLessonWithProgressEdge] instance.
  BodylessLessonWithProgressEdge({required this.node, required this.cursor});

  @JsonKey(name: r'node', required: true, includeIfNull: false)
  final BodylessLessonWithProgress node;

  /// Pagination cursor for this edge
  @JsonKey(name: r'cursor', required: true, includeIfNull: false)
  final String cursor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BodylessLessonWithProgressEdge &&
          other.node == node &&
          other.cursor == cursor;

  @override
  int get hashCode => node.hashCode + cursor.hashCode;

  factory BodylessLessonWithProgressEdge.fromJson(Map<String, dynamic> json) =>
      _$BodylessLessonWithProgressEdgeFromJson(json);

  Map<String, dynamic> toJson() => _$BodylessLessonWithProgressEdgeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
