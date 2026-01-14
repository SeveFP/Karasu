import 'package:flutter/material.dart';
import 'package:karasu/widgets/shell_scaffold.dart';
import 'package:karasu/l10n/app_localizations.dart';
import 'courses_body.dart';

/// Courses view showing user's enrolled courses with progress information.
class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ShellScaffold(
      title: AppLocalizations.of(context)!.coursesViewTitle,
      body: const CoursesBody(),
    );
  }
}
