import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/auth_service.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:logger/logger.dart';

class GraphQLService {
  static final GraphQLService _instance = GraphQLService._internal();
  late ValueNotifier<GraphQLClient> _client;
  final _logger = LoggerService.instance;

  factory GraphQLService() {
    return _instance;
  }

  GraphQLService._internal();

  ValueNotifier<GraphQLClient> get client => _client;

  Future<void> initialize() async {
    final config = ConfigService().config;
    final authService = AuthService();

    final HttpLink httpLink = HttpLink(
      '${config.protocol}${config.toshokanURL}/query',
    );

    final AuthLink authLink = AuthLink(
      getToken: authService.fetchAccessToken,
    );

    final Link link = authLink.concat(httpLink);
    final loggerLink = _LoggerLink(_logger);

    _client = ValueNotifier(
      GraphQLClient(
        link: loggerLink.concat(link),
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );

    _logger.i('GraphQL client initialized');
  }
}

class _LoggerLink extends Link {
  final Logger _logger;

  _LoggerLink(this._logger);

  @override
  Stream<Response> request(
    Request request, [
    NextLink? forward,
  ]) {
    return forward!(request).map((Response fetchResult) {
      _logger.d('GraphQL Request: ${request.operation.operationName}');
      _logger.d('GraphQL Response: ${fetchResult.data}');
      return fetchResult;
    }).handleError((error) {
      _logger.e('GraphQL Error', error: error);
    });
  }
}
