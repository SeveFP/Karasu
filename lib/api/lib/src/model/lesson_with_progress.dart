//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson_with_progress.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LessonWithProgress {
  /// Returns a new [LessonWithProgress] instance.
  LessonWithProgress({

    required  this.id,

    required  this.courseId,

    required  this.order,

    required  this.title,

    required  this.description,

    required  this.body,

    required  this.createdAt,

     this.editedAt,

     this.deletedAt,

    required  this.isCompleted,

    required  this.isCurrent,
  });

      /// Lesson UUID
  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



      /// Parent course UUID
  @JsonKey(
    
    name: r'course_id',
    required: true,
    includeIfNull: false,
  )


  final String courseId;



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



      /// Lesson content body (may contain deck references)
  @JsonKey(
    
    name: r'body',
    required: true,
    includeIfNull: false,
  )


  final String body;



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



      /// Whether user has completed this lesson
  @JsonKey(
    
    name: r'is_completed',
    required: true,
    includeIfNull: false,
  )


  final bool isCompleted;



      /// Whether this is the user's current lesson
  @JsonKey(
    
    name: r'is_current',
    required: true,
    includeIfNull: false,
  )


  final bool isCurrent;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LessonWithProgress &&
      other.id == id &&
      other.courseId == courseId &&
      other.order == order &&
      other.title == title &&
      other.description == description &&
      other.body == body &&
      other.createdAt == createdAt &&
      other.editedAt == editedAt &&
      other.deletedAt == deletedAt &&
      other.isCompleted == isCompleted &&
      other.isCurrent == isCurrent;

    @override
    int get hashCode =>
        id.hashCode +
        courseId.hashCode +
        order.hashCode +
        title.hashCode +
        description.hashCode +
        body.hashCode +
        createdAt.hashCode +
        editedAt.hashCode +
        deletedAt.hashCode +
        isCompleted.hashCode +
        isCurrent.hashCode;

  factory LessonWithProgress.fromJson(Map<String, dynamic> json) => _$LessonWithProgressFromJson(json);

  Map<String, dynamic> toJson() => _$LessonWithProgressToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

