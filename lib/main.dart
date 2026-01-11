import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:karasu/models/store.dart';
import 'package:karasu/models/app_config.dart';
import 'package:karasu/services/auth_service.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/graphql_service.dart';
import 'package:karasu/services/openapi_client.dart';
import 'package:karasu/services/logger_service.dart';
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

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasLoggedIn = false;
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

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
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
        AuthService().setCredentials(username, password);
      });
    } catch (e) {
      LoggerService.instance.e('Login failed', error: e);

      if (!mounted) return;

      setState(() {
        _hasLoggedIn = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: $e'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = ConfigService().config;
    final graphqlService = GraphQLService();

    Widget body = LoginView(credentialsCallback: _setHasLoggedIn);

    if (_hasLoggedIn) {
      body = const CoursesView();
    }

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
        builder: (context, child) {
          return AppActions(
            onThemeToggle: _toggleTheme,
            currentThemeMode: _themeMode,
            onLogout: _handleLogout,
            child: child ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
