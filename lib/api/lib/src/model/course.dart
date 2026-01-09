//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Course {
  /// Returns a new [Course] instance.
  Course({

    required  this.id,

    required  this.title,

    required  this.description,

    required  this.createdAt,

     this.editedAt,

     this.deletedAt,
  });

      /// Course UUID
  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



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



      /// Creation timestamp
  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



      /// Last edit timestamp
  @JsonKey(
    
    name: r'edited_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? editedAt;



      /// Deletion timestamp
  @JsonKey(
    
    name: r'deleted_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? deletedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Course &&
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.createdAt == createdAt &&
      other.editedAt == editedAt &&
      other.deletedAt == deletedAt;

    @override
    int get hashCode =>
        id.hashCode +
        title.hashCode +
        description.hashCode +
        createdAt.hashCode +
        editedAt.hashCode +
        deletedAt.hashCode;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

