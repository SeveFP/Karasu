import 'package:toshokan_api/toshokan_api.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/logger_service.dart';

/// Configured OpenAPI client for Toshokan.
/// - Base URL: protocol + toshokanURL from ConfigService
/// - Auth: call [loginAndSetToken] or [setBearerToken] to enable BearerAuth
class OpenApiClient {
  OpenApiClient._();
  static final OpenApiClient instance = OpenApiClient._();

  final _logger = LoggerService.instance;
  ToshokanApi? _api;

  // Token cache with 10-minute expiration
  String? _cachedToken;
  DateTime? _tokenExpiry;
  static const _tokenCacheDuration = Duration(minutes: 10);

  // Auth failure callback - called when token fetch fails
  void Function()? onAuthFailure;

  ToshokanApi get api {
    final client = _api;
    if (client == null) {
      throw StateError(
        'OpenApiClient not initialized. Call initialize() first.',
      );
    }
    return client;
  }

  Future<void> initialize() async {
    final config = ConfigService().config;
    final base = '${config.protocol}${config.toshokanURL}';

    // Create Dio with logging - survives client regeneration
    final dio =
        Dio(
            BaseOptions(
              baseUrl: base,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            ),
          )
          ..interceptors.addAll([
            _LoggingInterceptor(_logger),
            OAuthInterceptor(),
            BasicAuthInterceptor(),
            BearerAuthInterceptor(),
            ApiKeyAuthInterceptor(),
          ]);

    _api = ToshokanApi(dio: dio, basePathOverride: base);
    _logger.i('OpenAPI client initialized at $base');
  }

  AuthenticationApi get auth => api.getAuthenticationApi();
  CoursesApi get courses => api.getCoursesApi();
  DecksApi get decks => api.getDecksApi();
  LessonsApi get lessons => api.getLessonsApi();
  ProgressApi get progress => api.getProgressApi();

  /// Set Bearer token for all secured endpoints.
  /// Pass the raw JWT (without the 'Bearer ' prefix).
  void setBearerToken(String jwt) {
    api.setBearerAuth('BearerAuth', jwt);
    _logger.i('Bearer token set');
  }

  /// Login and configure Bearer token automatically.
  /// Always fetches a fresh token from the server.
  Future<TokenResponse> loginAndSetToken({
    required String username,
    required String password,
  }) async {
    try {
      _logger.i('Fetching fresh token for user: $username');
      final req = LogInRequest(username: username, password: password);
      final res = await auth.logIn(logInRequest: req);
      final token = res.data?.token;
      if (token == null || token.isEmpty) {
        throw StateError('Empty token from login response');
      }

      // Cache the token
      _cachedToken = token;
      _tokenExpiry = DateTime.now().add(_tokenCacheDuration);
      _logger.i('Token cached (expires: $_tokenExpiry)');

      setBearerToken(token);
      return res.data!;
    } catch (e) {
      _logger.e('Login failed', error: e);
      onAuthFailure?.call();
      rethrow;
    }
  }

  /// Get cached token or login to fetch a fresh one.
  /// Uses cached token if still valid (10-minute cache).
  Future<TokenResponse> getOrLoginAndSetToken({
    required String username,
    required String password,
  }) async {
    // Check cache first
    if (_cachedToken != null &&
        _tokenExpiry != null &&
        DateTime.now().isBefore(_tokenExpiry!)) {
      _logger.i('Using cached token (expires: $_tokenExpiry)');
      setBearerToken(_cachedToken!);
      return TokenResponse(token: _cachedToken!);
    }

    // Cache miss or expired - fetch fresh
    try {
      return await loginAndSetToken(username: username, password: password);
    } catch (e) {
      onAuthFailure?.call();
      rethrow;
    }
  }
}

class _LoggingInterceptor extends Interceptor {
  final Logger _logger;
  _LoggingInterceptor(this._logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.d('API REQUEST: ${options.method} ${options.path}');
    if (options.headers.isNotEmpty) {
      _logger.d('Headers: ${options.headers}');
    }
    if (options.data != null) {
      _logger.d('Data: ${options.data}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d(
      'API RESPONSE: ${response.statusCode} ${response.requestOptions.path}',
    );
    _logger.d('Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
      'API ERROR: ${err.requestOptions.method} ${err.requestOptions.path}',
      error: err,
    );
    super.onError(err, handler);
  }
}
