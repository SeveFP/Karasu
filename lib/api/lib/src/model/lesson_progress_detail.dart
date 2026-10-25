//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson_progress_detail.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LessonProgressDetail {
  /// Returns a new [LessonProgressDetail] instance.
  LessonProgressDetail({
    required this.lessonId,

    required this.isCompleted,

    this.completedAt,

    required this.correctAnswers,

    required this.incorrectAnswers,
  });

  @JsonKey(name: r'lesson_id', required: true, includeIfNull: false)
  final String lessonId;

  @JsonKey(name: r'is_completed', required: true, includeIfNull: false)
  final bool isCompleted;

  @JsonKey(name: r'completed_at', required: false, includeIfNull: false)
  final DateTime? completedAt;

  @JsonKey(name: r'correct_answers', required: true, includeIfNull: false)
  final int correctAnswers;

  @JsonKey(name: r'incorrect_answers', required: true, includeIfNull: false)
  final int incorrectAnswers;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonProgressDetail &&
          other.lessonId == lessonId &&
          other.isCompleted == isCompleted &&
          other.completedAt == completedAt &&
          other.correctAnswers == correctAnswers &&
          other.incorrectAnswers == incorrectAnswers;

  @override
  int get hashCode =>
      lessonId.hashCode +
      isCompleted.hashCode +
      completedAt.hashCode +
      correctAnswers.hashCode +
      incorrectAnswers.hashCode;

  factory LessonProgressDetail.fromJson(Map<String, dynamic> json) =>
      _$LessonProgressDetailFromJson(json);

  Map<String, dynamic> toJson() => _$LessonProgressDetailToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
