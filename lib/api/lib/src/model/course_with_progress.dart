//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_with_progress.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CourseWithProgress {
  /// Returns a new [CourseWithProgress] instance.
  CourseWithProgress({

    required  this.id,

    required  this.title,

    required  this.description,

    required  this.createdAt,

     this.editedAt,

     this.deletedAt,

    required  this.currentLessonId,
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



      /// UUID of the user's current lesson in this course
  @JsonKey(
    
    name: r'current_lesson_id',
    required: true,
    includeIfNull: false,
  )


  final String currentLessonId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CourseWithProgress &&
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.createdAt == createdAt &&
      other.editedAt == editedAt &&
      other.deletedAt == deletedAt &&
      other.currentLessonId == currentLessonId;

    @override
    int get hashCode =>
        id.hashCode +
        title.hashCode +
        description.hashCode +
        createdAt.hashCode +
        editedAt.hashCode +
        deletedAt.hashCode +
        currentLessonId.hashCode;

  factory CourseWithProgress.fromJson(Map<String, dynamic> json) => _$CourseWithProgressFromJson(json);

  Map<String, dynamic> toJson() => _$CourseWithProgressToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

