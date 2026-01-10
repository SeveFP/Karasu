//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_course_progress.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserCourseProgress {
  /// Returns a new [UserCourseProgress] instance.
  UserCourseProgress({

    required  this.id,

    required  this.userId,

    required  this.courseId,

    required  this.currentLessonId,

    required  this.createdAt,

    required  this.updatedAt,
  });

      /// Progress record UUID
  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



      /// User UUID
  @JsonKey(
    
    name: r'user_id',
    required: true,
    includeIfNull: false,
  )


  final String userId;



      /// Course UUID
  @JsonKey(
    
    name: r'course_id',
    required: true,
    includeIfNull: false,
  )


  final String courseId;



      /// Current lesson UUID
  @JsonKey(
    
    name: r'current_lesson_id',
    required: true,
    includeIfNull: false,
  )


  final String currentLessonId;



      /// Creation timestamp
  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



      /// Last update timestamp
  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UserCourseProgress &&
      other.id == id &&
      other.userId == userId &&
      other.courseId == courseId &&
      other.currentLessonId == currentLessonId &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        userId.hashCode +
        courseId.hashCode +
        currentLessonId.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory UserCourseProgress.fromJson(Map<String, dynamic> json) => _$UserCourseProgressFromJson(json);

  Map<String, dynamic> toJson() => _$UserCourseProgressToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

