import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:karasu/models/store.dart';
import 'package:karasu/views/login.dart';
import 'package:karasu/views/popularDecks.dart';
import 'package:karasu/widgets/karasuScaffold.dart';
import 'package:karasu/services/config_service.dart';

late String username = '';
late String password = '';

Future<String> fetchAccessToken() async {
  if (username.isEmpty || password.isEmpty) {
    throw Exception('Username or password cannot be empty');
  }

  final config = ConfigService().config;
  final url = Uri.parse(config.protocol + config.toshokanURL + '/login');
  final credentials = {
    'username': username,
    'password': password,
  };
  final response = await http.post(url,
      body: json.encode(credentials),
      headers: {"Content-Type": "application/json"});

  if (response.statusCode == 200) {
    final res = jsonDecode(response.body);
    return 'Bearer ' + res['token'];
  } else {
    throw Exception('Failed to login: ${response.body}');
  }
}

void main() async {
  debugPaintSizeEnabled = false;
  await initHiveForFlutter();
  await KStore.load();

  // Load configuration (will try dev config first)
  await ConfigService().loadConfig();
  final config = ConfigService().config;

  final HttpLink httpLink = HttpLink(
    config.protocol + config.toshokanURL + '/query',
  );

  final AuthLink authLink = AuthLink(
    getToken: fetchAccessToken,
  );

  final Link link = authLink.concat(httpLink);
  final loggerLink = LoggerLink();

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: loggerLink.concat(link),
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  runApp(GraphQLProvider(
    client: client,
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<String> accessToken;
  bool _hasLoggedIn = false;

  void _setHasLoggedIn(String u, String p) {
    setState(() {
      _hasLoggedIn = true;
      username = u;
      password = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    final config = ConfigService().config;

    Widget body = ListView(
      children: [
        LoginView(credentialsCallback: _setHasLoggedIn),
      ],
    );

    if (_hasLoggedIn) {
      body = const PopularDecksDisplay();
    }

    return MaterialApp(
      title: config.appName,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(config.colorScheme.primaryColor),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(config.colorScheme.primaryColor),
          brightness: Brightness.dark,
        ),
      ),
      home: KarasuScaffold(body: body),
    );
  }
}

class LoggerLink extends Link {
  @override
  Stream<Response> request(
    Request request, [
    NextLink? forward,
  ]) {
    Stream<Response> response = forward!(request).map((Response fetchResult) {
      print("Request: " + request.toString());
      return fetchResult;
    }).handleError((error) {
      print("Error: " + error.toString());
    });

    return response;
  }

  LoggerLink();
}
