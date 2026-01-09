import 'package:test/test.dart';
import 'package:toshokan_api/toshokan_api.dart';


/// tests for AuthenticationApi
void main() {
  final instance = ToshokanApi().getAuthenticationApi();

  group(AuthenticationApi, () {
    // Login
    //
    // Authenticate with username and password to receive a token
    //
    //Future<TokenResponse> logIn(LogInRequest logInRequest) async
    test('test logIn', () async {
      // TODO
    });

    // Register a new user
    //
    // Create a new user account and receive an authentication token
    //
    //Future<TokenResponse> signUp(SignUpRequest signUpRequest) async
    test('test signUp', () async {
      // TODO
    });

  });
}
