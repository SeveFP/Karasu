//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/lesson.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson_edge.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LessonEdge {
  /// Returns a new [LessonEdge] instance.
  LessonEdge({

    required  this.node,

    required  this.cursor,
  });

  @JsonKey(
    
    name: r'node',
    required: true,
    includeIfNull: false,
  )


  final Lesson node;



      /// Pagination cursor for this edge
  @JsonKey(
    
    name: r'cursor',
    required: true,
    includeIfNull: false,
  )


  final String cursor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LessonEdge &&
      other.node == node &&
      other.cursor == cursor;

    @override
    int get hashCode =>
        node.hashCode +
        cursor.hashCode;

  factory LessonEdge.fromJson(Map<String, dynamic> json) => _$LessonEdgeFromJson(json);

  Map<String, dynamic> toJson() => _$LessonEdgeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

