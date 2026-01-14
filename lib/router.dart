import 'package:flutter/material.dart';
import 'package:karasu/views/lessons.dart';
import 'package:karasu/views/lesson.dart';
import 'package:toshokan_api/toshokan_api.dart' as api;

/// Centralized app routing configuration.
/// Defines all app routes and handles route generation with argument validation.
class AppRouter {
  static final RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();
  // Route names
  static const String lessons = '/lessons';
  static const String lesson = '/lesson';

  /// Generate routes based on RouteSettings.
  /// Returns null if route is not found or arguments are invalid.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case lessons:
        final args = settings.arguments as Map<String, dynamic>?;
        final courseId = args?['courseId'] as String?;
        if (courseId == null) return null;
        return MaterialPageRoute(
          builder: (_) => LessonsView(courseId: courseId),
          settings: settings,
        );

      case lesson:
        final args = settings.arguments as Map<String, dynamic>?;
        final lessonData = args?['lesson'] as api.LessonWithProgress?;
        if (lessonData == null) return null;
        return MaterialPageRoute(
          builder: (_) => LessonView(lesson: lessonData),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
