import 'package:toshokan_api/src/model/all_courses_response.dart';
import 'package:toshokan_api/src/model/answer.dart';
import 'package:toshokan_api/src/model/answer_cards_response.dart';
import 'package:toshokan_api/src/model/answer_input.dart';
import 'package:toshokan_api/src/model/answer_update.dart';
import 'package:toshokan_api/src/model/bodyless_lesson.dart';
import 'package:toshokan_api/src/model/bodyless_lesson_with_progress.dart';
import 'package:toshokan_api/src/model/bodyless_lesson_with_progress_edge.dart';
import 'package:toshokan_api/src/model/bodyless_lessons_with_progress_connection_response.dart';
import 'package:toshokan_api/src/model/card.dart';
import 'package:toshokan_api/src/model/card_answer.dart';
import 'package:toshokan_api/src/model/card_input.dart';
import 'package:toshokan_api/src/model/card_state.dart';
import 'package:toshokan_api/src/model/card_update.dart';
import 'package:toshokan_api/src/model/course.dart';
import 'package:toshokan_api/src/model/course_edge.dart';
import 'package:toshokan_api/src/model/course_with_progress.dart';
import 'package:toshokan_api/src/model/course_with_progress_edge.dart';
import 'package:toshokan_api/src/model/courses_with_progress_connection_response.dart';
import 'package:toshokan_api/src/model/create_answer_request.dart';
import 'package:toshokan_api/src/model/create_course_request.dart';
import 'package:toshokan_api/src/model/create_lesson_request.dart';
import 'package:toshokan_api/src/model/deck.dart';
import 'package:toshokan_api/src/model/deck_input.dart';
import 'package:toshokan_api/src/model/deck_state.dart';
import 'package:toshokan_api/src/model/deck_update.dart';
import 'package:toshokan_api/src/model/enroll_course200_response.dart';
import 'package:toshokan_api/src/model/error.dart';
import 'package:toshokan_api/src/model/get_focused_lessons200_response.dart';
import 'package:toshokan_api/src/model/get_lesson_state_response.dart';
import 'package:toshokan_api/src/model/lesson.dart';
import 'package:toshokan_api/src/model/lesson_edge.dart';
import 'package:toshokan_api/src/model/lesson_progress_detail.dart';
import 'package:toshokan_api/src/model/lesson_state.dart';
import 'package:toshokan_api/src/model/lesson_with_progress.dart';
import 'package:toshokan_api/src/model/lesson_with_progress_edge.dart';
import 'package:toshokan_api/src/model/lessons_connection_response.dart';
import 'package:toshokan_api/src/model/lessons_with_progress_connection_response.dart';
import 'package:toshokan_api/src/model/log_in_request.dart';
import 'package:toshokan_api/src/model/page_info.dart';
import 'package:toshokan_api/src/model/review_answers_request.dart';
import 'package:toshokan_api/src/model/review_response.dart';
import 'package:toshokan_api/src/model/set_user_state_request.dart';
import 'package:toshokan_api/src/model/sign_up_request.dart';
import 'package:toshokan_api/src/model/student_progress_summary.dart';
import 'package:toshokan_api/src/model/student_progress_summary_edge.dart';
import 'package:toshokan_api/src/model/students_progress_response.dart';
import 'package:toshokan_api/src/model/token_response.dart';
import 'package:toshokan_api/src/model/update_course_request.dart';
import 'package:toshokan_api/src/model/update_lesson_request.dart';
import 'package:toshokan_api/src/model/user_course_progress.dart';
import 'package:toshokan_api/src/model/user_state_response.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ReturnType deserialize<ReturnType, BaseType>(
  dynamic value,
  String targetType, {
  bool growable = true,
}) {
  switch (targetType) {
    case 'String':
      return '$value' as ReturnType;
    case 'int':
      return (value is int ? value : int.parse('$value')) as ReturnType;
    case 'bool':
      if (value is bool) {
        return value as ReturnType;
      }
      final valueString = '$value'.toLowerCase();
      return (valueString == 'true' || valueString == '1') as ReturnType;
    case 'double':
      return (value is double ? value : double.parse('$value')) as ReturnType;
    case 'AllCoursesResponse':
      return AllCoursesResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Answer':
      return Answer.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'AnswerCardsResponse':
      return AnswerCardsResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AnswerInput':
      return AnswerInput.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'AnswerUpdate':
      return AnswerUpdate.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'BodylessLesson':
      return BodylessLesson.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'BodylessLessonWithProgress':
      return BodylessLessonWithProgress.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'BodylessLessonWithProgressEdge':
      return BodylessLessonWithProgressEdge.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'BodylessLessonsWithProgressConnectionResponse':
      return BodylessLessonsWithProgressConnectionResponse.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'Card':
      return Card.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'CardAnswer':
      return CardAnswer.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'CardInput':
      return CardInput.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'CardState':
      return CardState.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'CardUpdate':
      return CardUpdate.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Course':
      return Course.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'CourseEdge':
      return CourseEdge.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'CourseWithProgress':
      return CourseWithProgress.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CourseWithProgressEdge':
      return CourseWithProgressEdge.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CoursesWithProgressConnectionResponse':
      return CoursesWithProgressConnectionResponse.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'CreateAnswerRequest':
      return CreateAnswerRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateCourseRequest':
      return CreateCourseRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateLessonRequest':
      return CreateLessonRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Deck':
      return Deck.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'DeckInput':
      return DeckInput.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'DeckState':
      return DeckState.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'DeckUpdate':
      return DeckUpdate.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'EnrollCourse200Response':
      return EnrollCourse200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Error':
      return Error.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'GetFocusedLessons200Response':
      return GetFocusedLessons200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'GetLessonStateResponse':
      return GetLessonStateResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Lesson':
      return Lesson.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'LessonEdge':
      return LessonEdge.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'LessonProgressDetail':
      return LessonProgressDetail.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'LessonState':
      return LessonState.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'LessonWithProgress':
      return LessonWithProgress.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'LessonWithProgressEdge':
      return LessonWithProgressEdge.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'LessonsConnectionResponse':
      return LessonsConnectionResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'LessonsWithProgressConnectionResponse':
      return LessonsWithProgressConnectionResponse.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'LogInRequest':
      return LogInRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'PageInfo':
      return PageInfo.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ReviewAnswersRequest':
      return ReviewAnswersRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ReviewResponse':
      return ReviewResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SetUserStateRequest':
      return SetUserStateRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SignUpRequest':
      return SignUpRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'StudentProgressSummary':
      return StudentProgressSummary.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'StudentProgressSummaryEdge':
      return StudentProgressSummaryEdge.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'StudentsProgressResponse':
      return StudentsProgressResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'TokenResponse':
      return TokenResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateCourseRequest':
      return UpdateCourseRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateLessonRequest':
      return UpdateLessonRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UserCourseProgress':
      return UserCourseProgress.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UserStateResponse':
      return UserStateResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    default:
      RegExpMatch? match;

      if (value is List && (match = _regList.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
                .map<BaseType>(
                  (dynamic v) => deserialize<BaseType, BaseType>(
                    v,
                    targetType,
                    growable: growable,
                  ),
                )
                .toList(growable: growable)
            as ReturnType;
      }
      if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
                .map<BaseType>(
                  (dynamic v) => deserialize<BaseType, BaseType>(
                    v,
                    targetType,
                    growable: growable,
                  ),
                )
                .toSet()
            as ReturnType;
      }
      if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
        targetType = match![1]!.trim(); // ignore: parameter_assignments
        return Map<String, BaseType>.fromIterables(
              value.keys as Iterable<String>,
              value.values.map(
                (dynamic v) => deserialize<BaseType, BaseType>(
                  v,
                  targetType,
                  growable: growable,
                ),
              ),
            )
            as ReturnType;
      }
      break;
  }
  throw Exception('Cannot deserialize');
}
