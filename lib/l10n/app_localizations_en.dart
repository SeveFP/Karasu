// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Karasu';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get retry => 'Retry';

  @override
  String get coursesViewTitle => 'My Courses';

  @override
  String get noLessons => 'No lessons';

  @override
  String get noLessonsDescription => 'This course has no lessons yet';

  @override
  String get lessonsTitle => 'Lessons';

  @override
  String get lessonCompleted => 'Lesson Completed!';

  @override
  String get completeLessonContinue => 'Complete Lesson & Continue';

  @override
  String get lessonLocked => 'This lesson is locked. Please complete previous lessons first.';

  @override
  String failedToLoadLessons(Object error) {
    return 'Failed to load lessons: $error';
  }

  @override
  String couldNotLoadProgress(Object error) {
    return 'Could not load progress: $error';
  }

  @override
  String loginFailed(Object error) {
    return 'Login failed: $error';
  }

  @override
  String get ok => 'OK';

  @override
  String get loginTitle => 'Login';

  @override
  String get loggingIn => 'Logging in...';

  @override
  String get usernameLabel => 'Username';

  @override
  String get usernameMissing => 'Username is missing';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordMissing => 'Password is missing';

  @override
  String get loginButton => 'Log in';

  @override
  String get errorTitle => 'Error';

  @override
  String get submitButton => 'Submit';

  @override
  String get deckLabel => 'Deck';

  @override
  String scoreSummary(Object correct, Object total) {
    return '$correct / $total';
  }

  @override
  String get noCardsAvailable => 'No cards available';

  @override
  String correctAnswers(Object count) {
    return 'Correct answers: $count';
  }

  @override
  String incorrectAnswers(Object count) {
    return 'Incorrect answers: $count';
  }

  @override
  String get restartButton => 'Restart';

  @override
  String get errorParsingCard => 'Error parsing card';

  @override
  String get imageFailedToLoad => 'Image failed to load';

  @override
  String get settingsTooltip => 'Settings';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get toggleTheme => 'Toggle Theme';

  @override
  String get logoutButton => 'Logout';

  @override
  String get noDecks => 'No decks';
}
