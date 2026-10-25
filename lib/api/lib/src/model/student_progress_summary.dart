//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/lesson_progress_detail.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_progress_summary.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StudentProgressSummary {
  /// Returns a new [StudentProgressSummary] instance.
  StudentProgressSummary({
    required this.userId,

    this.username,

    this.nick,

    required this.currentLessonId,

    required this.lessonsCompleted,

    required this.totalLessons,

    required this.totalCorrectAnswers,

    required this.totalIncorrectAnswers,

    required this.enrolledAt,

    required this.lastActivityAt,

    this.lessonDetails,
  });

  /// User UUID
  @JsonKey(name: r'user_id', required: true, includeIfNull: false)
  final String userId;

  /// User's username
  @JsonKey(name: r'username', required: false, includeIfNull: false)
  final String? username;

  /// User's display name (nickname)
  @JsonKey(name: r'nick', required: false, includeIfNull: false)
  final String? nick;

  /// ID of the lesson the student is currently on
  @JsonKey(name: r'current_lesson_id', required: true, includeIfNull: false)
  final String currentLessonId;

  /// Number of lessons completed
  @JsonKey(name: r'lessons_completed', required: true, includeIfNull: false)
  final int lessonsCompleted;

  /// Total number of lessons in the course
  @JsonKey(name: r'total_lessons', required: true, includeIfNull: false)
  final int totalLessons;

  /// Total number of correct answers across all lessons
  @JsonKey(name: r'total_correct_answers', required: true, includeIfNull: false)
  final int totalCorrectAnswers;

  /// Total number of incorrect answers across all lessons
  @JsonKey(
    name: r'total_incorrect_answers',
    required: true,
    includeIfNull: false,
  )
  final int totalIncorrectAnswers;

  /// When the user enrolled in the course
  @JsonKey(name: r'enrolled_at', required: true, includeIfNull: false)
  final DateTime enrolledAt;

  /// Timestamp of the user's last activity
  @JsonKey(name: r'last_activity_at', required: true, includeIfNull: false)
  final DateTime lastActivityAt;

  /// Per-lesson breakdown (only included when detailed=true)
  @JsonKey(name: r'lesson_details', required: false, includeIfNull: false)
  final List<LessonProgressDetail>? lessonDetails;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentProgressSummary &&
          other.userId == userId &&
          other.username == username &&
          other.nick == nick &&
          other.currentLessonId == currentLessonId &&
          other.lessonsCompleted == lessonsCompleted &&
          other.totalLessons == totalLessons &&
          other.totalCorrectAnswers == totalCorrectAnswers &&
          other.totalIncorrectAnswers == totalIncorrectAnswers &&
          other.enrolledAt == enrolledAt &&
          other.lastActivityAt == lastActivityAt &&
          other.lessonDetails == lessonDetails;

  @override
  int get hashCode =>
      userId.hashCode +
      username.hashCode +
      nick.hashCode +
      currentLessonId.hashCode +
      lessonsCompleted.hashCode +
      totalLessons.hashCode +
      totalCorrectAnswers.hashCode +
      totalIncorrectAnswers.hashCode +
      enrolledAt.hashCode +
      lastActivityAt.hashCode +
      lessonDetails.hashCode;

  factory StudentProgressSummary.fromJson(Map<String, dynamic> json) =>
      _$StudentProgressSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$StudentProgressSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
