//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/course_with_progress.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_with_progress_edge.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CourseWithProgressEdge {
  /// Returns a new [CourseWithProgressEdge] instance.
  CourseWithProgressEdge({

    required  this.node,

    required  this.cursor,
  });

  @JsonKey(
    
    name: r'node',
    required: true,
    includeIfNull: false,
  )


  final CourseWithProgress node;



      /// Pagination cursor for this edge
  @JsonKey(
    
    name: r'cursor',
    required: true,
    includeIfNull: false,
  )


  final String cursor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CourseWithProgressEdge &&
      other.node == node &&
      other.cursor == cursor;

    @override
    int get hashCode =>
        node.hashCode +
        cursor.hashCode;

  factory CourseWithProgressEdge.fromJson(Map<String, dynamic> json) => _$CourseWithProgressEdgeFromJson(json);

  Map<String, dynamic> toJson() => _$CourseWithProgressEdgeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

