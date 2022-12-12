import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:karasu/views/login.dart';
import 'package:karasu/views/popularDecks.dart';
import 'package:karasu/widgets/karasuScaffold.dart';

final toshokanURL = 'localhost:8080';
final protocol = 'http://';
late String username = '';
late String password = '';

Future<String> fetchAccessToken() async {
  final url = Uri.parse(protocol + toshokanURL + '/login');
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
    throw Exception('Failed to login');
  }
}

void main() async {
  debugPaintSizeEnabled = false;
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    protocol + toshokanURL + '/query',
  );

  final AuthLink authLink = AuthLink(
    getToken: fetchAccessToken,
  );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
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
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KarasuScaffold(
        body: _hasLoggedIn
            ? const PopularDecksDisplay()
            : LoginView(credentialsCallback: _setHasLoggedIn),
      ),
    );
  }
}
