import 'package:flutter/material.dart';
import 'package:karasu/widgets/shell_scaffold.dart';
import 'courses_body.dart';

/// Courses view showing user's enrolled courses.
/// Currently fetches a hardcoded course ID until the backend provides
/// a GET /courses/enrolled endpoint to list enrolled courses.
class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShellScaffold(title: 'My Courses', body: CoursesBody());
  }
}
