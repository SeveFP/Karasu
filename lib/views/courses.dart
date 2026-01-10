import 'package:flutter/material.dart';
import 'package:karasu/services/lesson_service.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:karasu/router.dart';
import 'package:karasu/widgets/responsive_container.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

// TODO: Replace with actual enrolled courses list when GET /courses/enrolled is available
const String _hardcodedCourseId = '7ee33974-3982-41cf-aca3-1a3154060bfc';

/// Courses view showing user's enrolled courses.
/// Currently fetches a hardcoded course ID until the backend provides
/// a GET /courses/enrolled endpoint to list enrolled courses.
class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  final _logger = LoggerService.instance;
  final _service = LessonService.instance;
  final List<api.Course> _courses = [];
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchEnrolledCourse();
  }

  Future<void> _fetchEnrolledCourse() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final course = await _service.getCourse(_hardcodedCourseId);
      setState(() {
        _courses.add(course);
        _isLoading = false;
      });
    } catch (e) {
      _logger.e('Fetch course failed', error: e);
      setState(() {
        _error = 'Failed to load course: $e';
        _isLoading = false;
      });
    }
  }

  void _openCourse(api.Course course) {
    Navigator.pushNamed(
      context,
      AppRouter.lessons,
      arguments: {'courseId': course.id},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Courses')),
      body: ResponsiveBody(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => setState(() => _error = null),
              child: const Text('Dismiss'),
            ),
          ],
        ),
      );
    }

    if (_courses.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.38),
            ),
            const SizedBox(height: 24),
            Text(
              'No enrolled courses',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Contact your administrator to enroll in courses',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _courses.length,
      itemBuilder: (context, index) {
        final course = _courses[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(course.title?.substring(0, 1).toUpperCase() ?? 'C'),
            ),
            title: Text(course.title ?? 'Untitled Course'),
            subtitle: Text(course.description ?? 'No description'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _openCourse(course),
          ),
        );
      },
    );
  }
}
