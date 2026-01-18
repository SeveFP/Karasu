import 'package:karasu/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:karasu/models/store.dart';
import 'package:karasu/models/app_config.dart';
import 'package:karasu/services/auth_service.dart';
import 'package:karasu/services/audio_service.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/graphql_service.dart';
import 'package:karasu/services/openapi_client.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:karasu/services/settings_service.dart';
import 'package:karasu/views/login.dart';
import 'package:karasu/views/courses.dart';
// import 'package:karasu/views/popularDecks.dart';
import 'package:karasu/widgets/app_actions.dart';
import 'package:karasu/router.dart';

void main() async {
  await initHiveForFlutter();
  await KStore.load();

  await ConfigService().loadConfig();

  debugPaintSizeEnabled = ConfigService().config.debugPaintSizeEnabled;

  await GraphQLService().initialize();
  await OpenApiClient.instance.initialize();

  // Pre-initialize audio player here to avoid UI freeze on first play
  AudioService.instance.initialize();

  await SettingsService.load();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasLoggedIn = false;
  bool _loginFailed = false;
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    final config = ConfigService().config;
    _themeMode = _themeModeFromConfig(config.themeMode);

    // Set auth failure callback - kick user out on auth failure
    OpenApiClient.instance.onAuthFailure = () {
      if (mounted) {
        setState(() {
          _hasLoggedIn = false;
        });
      }
    };
  }

  ThemeMode _themeModeFromConfig(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  ThemeMode _getOppositeTheme(ThemeMode mode) {
    if (mode == ThemeMode.system) {
      if (MediaQuery.platformBrightnessOf(context) == Brightness.light) {
        return ThemeMode.dark;
      }
      return ThemeMode.light;
    }

    return mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  void _toggleSound() {
    setState(() {
      SettingsService.setSoundEnabled(!SettingsService.soundEnabled);
    });
  }

  void _toggleTheme() {
    setState(() {
      _themeMode = _getOppositeTheme(_themeMode);
    });
  }

  void _handleLogout() {
    AuthService().clearCredentials();
    setState(() {
      _hasLoggedIn = false;
    });
  }

  void _setHasLoggedIn(String username, String password) async {
    try {
      await OpenApiClient.instance.loginAndSetToken(
        username: username,
        password: password,
      );

      if (!mounted) return;

      setState(() {
        _hasLoggedIn = true;
        _loginFailed = false;
        AuthService().setCredentials(username, password);
      });
    } catch (e) {
      LoggerService.instance.e('Login failed', error: e);

      if (!mounted) return;

      setState(() {
        _hasLoggedIn = false;
        _loginFailed = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.loginFailed(e.toString()),
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = ConfigService().config;
    final graphqlService = GraphQLService();

    Widget body = LoginView(
      credentialsCallback: _setHasLoggedIn,
      loginFailed: _loginFailed,
    );

    if (_hasLoggedIn) {
      body = const CoursesView();
    }

    // Use config.language if set, otherwise default to 'en'
    final forcedLocale = Locale(config.language ?? 'en');
    return GraphQLProvider(
      client: graphqlService.client,
      child: MaterialApp(
        title: config.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(config.colorScheme.primaryColor),
            brightness: Brightness.light,
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(config.colorScheme.primaryColor),
            brightness: Brightness.dark,
          ),
        ),
        themeMode: _themeMode,
        home: body,
        onGenerateRoute: AppRouter.onGenerateRoute,
        navigatorObservers: [AppRouter.routeObserver],
        locale: forcedLocale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('ca')],
        builder: (context, child) {
          return AppActions(
            onThemeToggle: _toggleTheme,
            currentThemeMode: _themeMode,
            soundEnabled: SettingsService.soundEnabled,
            onToggleSound: _toggleSound,
            onLogout: _handleLogout,
            child: child ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
