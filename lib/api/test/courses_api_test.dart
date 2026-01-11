import 'package:test/test.dart';
import 'package:toshokan_api/toshokan_api.dart';


/// tests for CoursesApi
void main() {
  final instance = ToshokanApi().getCoursesApi();

  group(CoursesApi, () {
    // Create a new course
    //
    // Create a new course with title and description
    //
    //Future<Course> createCourse(CreateCourseRequest createCourseRequest) async
    test('test createCourse', () async {
      // TODO
    });

    // Enroll in a course
    //
    // Enroll the authenticated user in a course
    //
    //Future<EnrollCourse200Response> enrollCourse(String courseId) async
    test('test enrollCourse', () async {
      // TODO
    });

    // Get course details
    //
    // Retrieve details of a specific course by ID
    //
    //Future<Course> getCourse(String courseId) async
    test('test getCourse', () async {
      // TODO
    });

    // Get enrolled courses
    //
    // Retrieve paginated list of courses the authenticated user is enrolled in, with progress information
    //
    //Future<CoursesWithProgressConnectionResponse> getEnrolledCourses({ String after, String before, int first, int last }) async
    test('test getEnrolledCourses', () async {
      // TODO
    });

  });
}
