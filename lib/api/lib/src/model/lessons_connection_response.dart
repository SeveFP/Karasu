//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/page_info.dart';
import 'package:toshokan_api/src/model/lesson_edge.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lessons_connection_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LessonsConnectionResponse {
  /// Returns a new [LessonsConnectionResponse] instance.
  LessonsConnectionResponse({

    required  this.edges,

    required  this.pageInfo,
  });

  @JsonKey(
    
    name: r'edges',
    required: true,
    includeIfNull: false,
  )


  final List<LessonEdge> edges;



  @JsonKey(
    
    name: r'page_info',
    required: true,
    includeIfNull: false,
  )


  final PageInfo pageInfo;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LessonsConnectionResponse &&
      other.edges == edges &&
      other.pageInfo == pageInfo;

    @override
    int get hashCode =>
        edges.hashCode +
        pageInfo.hashCode;

  factory LessonsConnectionResponse.fromJson(Map<String, dynamic> json) => _$LessonsConnectionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LessonsConnectionResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

