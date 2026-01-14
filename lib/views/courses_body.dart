import 'package:flutter/material.dart';
import 'package:karasu/services/lesson_service.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:karasu/router.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

class CoursesBody extends StatefulWidget {
  const CoursesBody({super.key});

  @override
  State<CoursesBody> createState() => _CoursesBodyState();
}

class _CoursesBodyState extends State<CoursesBody> {
  final _logger = LoggerService.instance;
  final _service = LessonService.instance;
  final List<api.CourseWithProgress> _courses = [];
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchCourses();
  }

  Future<void> _fetchCourses() async {
    setState(() => _isLoading = true);
    try {
      final courses = await _service.getEnrolledCourses();
      setState(() {
        _courses.clear();
        _courses.addAll(courses);
        _isLoading = false;
      });
    } catch (e) {
      _logger.e('Failed to fetch courses', error: e);
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _openCourse(api.CourseWithProgress course) {
    Navigator.pushNamed(
      context,
      AppRouter.lessons,
      arguments: {'courseId': course.id},
    );
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: _fetchCourses,
              child: Text(AppLocalizations.of(context)!.retry),
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
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.38),
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
              child: Text(
                (course.title.isNotEmpty ? course.title.substring(0, 1) : 'C')
                    .toUpperCase(),
              ),
            ),
            title: Text(course.title),
            subtitle: Text(course.description),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _openCourse(course),
          ),
        );
      },
    );
  }
}
