import 'package:test/test.dart';
import 'package:toshokan_api/toshokan_api.dart';


/// tests for LessonsApi
void main() {
  final instance = ToshokanApi().getLessonsApi();

  group(LessonsApi, () {
    // Create a new lesson
    //
    // Create a new lesson within a course. The lesson body must reference at least one deck using the markdown form `![deck](uuid)`.
    //
    //Future<Lesson> createLesson(String courseId, CreateLessonRequest createLessonRequest) async
    test('test createLesson', () async {
      // TODO
    });

    // Get focused lessons with progress
    //
    // Retrieve lessons around the user's current lesson with completion status
    //
    //Future<LessonsWithProgressConnectionResponse> getFocusedLessons(String courseId) async
    test('test getFocusedLessons', () async {
      // TODO
    });

    // Get lessons for a course
    //
    // Retrieve paginated list of lessons for a specific course
    //
    //Future<LessonsConnectionResponse> getLessons(String courseId, { String after, String before, int first, int last }) async
    test('test getLessons', () async {
      // TODO
    });

  });
}
