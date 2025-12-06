import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/logger_service.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  late String _username = '';
  late String _password = '';
  final _logger = LoggerService.instance;

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  String get username => _username;
  String get password => _password;

  void setCredentials(String username, String password) {
    _username = username;
    _password = password;
    _logger.i('Credentials set for user: $username');
  }

  Future<String> fetchAccessToken() async {
    if (_username.isEmpty || _password.isEmpty) {
      throw Exception('Username or password cannot be empty');
    }

    final config = ConfigService().config;
    final url = Uri.parse(config.protocol + config.toshokanURL + '/login');
    final credentials = {
      'username': _username,
      'password': _password,
    };

    try {
      final response = await http.post(url,
          body: json.encode(credentials),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        _logger.i('Login successful');
        return 'Bearer ' + res['token'];
      } else {
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (e) {
      _logger.e('Login failed', error: e);
      rethrow;
    }
  }
}
