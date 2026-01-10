//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_lesson_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateLessonRequest {
  /// Returns a new [CreateLessonRequest] instance.
  CreateLessonRequest({

    required  this.order,

    required  this.title,

    required  this.description,

    required  this.body,
  });

      /// Lesson order within course
  @JsonKey(
    
    name: r'order',
    required: true,
    includeIfNull: false,
  )


  final int order;



      /// Lesson title
  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



      /// Lesson description
  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: false,
  )


  final String description;



      /// Lesson content body; must embed at least one deck reference in the markdown form `![deck](uuid)`
  @JsonKey(
    
    name: r'body',
    required: true,
    includeIfNull: false,
  )


  final String body;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateLessonRequest &&
      other.order == order &&
      other.title == title &&
      other.description == description &&
      other.body == body;

    @override
    int get hashCode =>
        order.hashCode +
        title.hashCode +
        description.hashCode +
        body.hashCode;

  factory CreateLessonRequest.fromJson(Map<String, dynamic> json) => _$CreateLessonRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateLessonRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

