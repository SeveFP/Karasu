// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'Karasu';

  @override
  String get login => 'Entra';

  @override
  String get logout => 'Surt';

  @override
  String get retry => 'Torna-ho a provar';

  @override
  String get coursesViewTitle => 'Els meus cursos';

  @override
  String get noLessons => 'Cap lliçó';

  @override
  String get noLessonsDescription => 'Aquest curs encara no té cap lliçó';

  @override
  String get lessonsTitle => 'Lliçons';

  @override
  String get lessonCompleted => 'Lliçó completada!';

  @override
  String get completeLessonContinue => 'Completa la lliçó i continua';

  @override
  String get lessonLocked => 'Lliçó blocada. Cal completar les lliçons anteriors.';

  @override
  String failedToLoadLessons(Object error) {
    return 'No s\'han pogut carregar les lliçons: $error';
  }

  @override
  String couldNotLoadProgress(Object error) {
    return 'No s\'ha pogut carregar el progrés: $error';
  }

  @override
  String loginFailed(Object error) {
    return 'No s\'ha pogut entrar: $error';
  }

  @override
  String get ok => 'D\'acord';

  @override
  String get loginTitle => 'Entrada';

  @override
  String get loggingIn => 'Entrant...';

  @override
  String get usernameLabel => 'Nom d\'usuari';

  @override
  String get usernameMissing => 'Cal indicar el nom d\'usuari';

  @override
  String get passwordLabel => 'Contrasenya';

  @override
  String get passwordMissing => 'Cal indicar la contrasenya';

  @override
  String get loginButton => 'Entra';

  @override
  String get errorTitle => 'Error';

  @override
  String get submitButton => 'Envia';

  @override
  String get deckLabel => 'Baralla';

  @override
  String scoreSummary(Object correct, Object total) {
    return '$correct / $total';
  }

  @override
  String get noCardsAvailable => 'No hi ha cap carta disponible';

  @override
  String correctAnswers(Object count) {
    return 'Respostes correctes: $count';
  }

  @override
  String incorrectAnswers(Object count) {
    return 'Respostes incorrectes: $count';
  }

  @override
  String get restartButton => 'Torna a començar';

  @override
  String get errorParsingCard => 'Error en processar la carta';

  @override
  String get imageFailedToLoad => 'No s\'ha pogut carregar la imatge';

  @override
  String get settingsTooltip => 'Configuració';

  @override
  String get settingsTitle => 'Configuració';

  @override
  String get toggleTheme => 'Canvia el tema';

  @override
  String get logoutButton => 'Surt';

  @override
  String get noDecks => 'Cap baralla';
}
