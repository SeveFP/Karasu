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

    final themeMode = () {
      switch (config.themeMode) {
        case AppThemeMode.light:
          return ThemeMode.light;
        case AppThemeMode.dark:
          return ThemeMode.dark;
        case AppThemeMode.system:
        default:
          return ThemeMode.system;
      }
    }();

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
        themeMode: themeMode,
        home: KarasuScaffold(
          body: body,
          isLoggedIn: _hasLoggedIn,
        ),
      ),
    );
  }
}
