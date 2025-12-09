import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:karasu/models/store.dart';
import 'package:karasu/models/app_config.dart';
import 'package:karasu/services/auth_service.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/graphql_service.dart';
import 'package:karasu/views/login.dart';
import 'package:karasu/views/popularDecks.dart';
import 'package:karasu/widgets/karasu_scaffold.dart';

void main() async {
  await initHiveForFlutter();
  await KStore.load();

  await ConfigService().loadConfig();

  debugPaintSizeEnabled = ConfigService().config.debugPaintSizeEnabled;

  await GraphQLService().initialize();

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
  }

  ThemeMode _themeModeFromConfig(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
      default:
        return ThemeMode.system;
    }
  }

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _setHasLoggedIn(String username, String password) {
    setState(() {
      _hasLoggedIn = true;
      AuthService().setCredentials(username, password);
    });
  }

  @override
  Widget build(BuildContext context) {
    final config = ConfigService().config;
    final graphqlService = GraphQLService();

    Widget body = ListView(
      children: [
        LoginView(credentialsCallback: _setHasLoggedIn),
      ],
    );

    if (_hasLoggedIn) {
      body = const PopularDecksDisplay();
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
        home: KarasuScaffold(
          body: body,
          isLoggedIn: _hasLoggedIn,
          onThemeToggle: _toggleTheme,
          currentThemeMode: _themeMode,
        ),
      ),
    );
  }
}
