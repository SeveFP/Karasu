//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/lesson_with_progress.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson_with_progress_edge.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LessonWithProgressEdge {
  /// Returns a new [LessonWithProgressEdge] instance.
  LessonWithProgressEdge({

    required  this.node,

    required  this.cursor,
  });

  @JsonKey(
    
    name: r'node',
    required: true,
    includeIfNull: false,
  )


  final LessonWithProgress node;



      /// Pagination cursor for this edge
  @JsonKey(
    
    name: r'cursor',
    required: true,
    includeIfNull: false,
  )


  final String cursor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LessonWithProgressEdge &&
      other.node == node &&
      other.cursor == cursor;

    @override
    int get hashCode =>
        node.hashCode +
        cursor.hashCode;

  factory LessonWithProgressEdge.fromJson(Map<String, dynamic> json) => _$LessonWithProgressEdgeFromJson(json);

  Map<String, dynamic> toJson() => _$LessonWithProgressEdgeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

