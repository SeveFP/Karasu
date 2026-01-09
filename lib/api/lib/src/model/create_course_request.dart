//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_course_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateCourseRequest {
  /// Returns a new [CreateCourseRequest] instance.
  CreateCourseRequest({

    required  this.title,

    required  this.description,
  });

      /// Course title
  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



      /// Course description
  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: false,
  )


  final String description;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateCourseRequest &&
      other.title == title &&
      other.description == description;

    @override
    int get hashCode =>
        title.hashCode +
        description.hashCode;

  factory CreateCourseRequest.fromJson(Map<String, dynamic> json) => _$CreateCourseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCourseRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

