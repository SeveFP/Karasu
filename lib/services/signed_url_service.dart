import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:karasu/services/auth_service.dart';
import 'package:karasu/services/logger_service.dart';

/// Service to resolve proxy URLs that return a JSON body
/// with a `signedUrl` field pointing to the actual asset.
class SignedUrlService {
  SignedUrlService._internal();
  static final SignedUrlService instance = SignedUrlService._internal();

  final _logger = LoggerService.instance;

  /// Accepts a proxy [url] that responds to GET with:
  /// { "signedUrl": "https://actual-resource" }
  /// Returns the resolved signed URL or [url] on failure.
  Future<String> resolve(String url) async {
    try {
      final uri = Uri.parse(url);

      // Try to include Authorization header if available via AuthService.
      // If this fails, we still attempt without it.
      final token = await AuthService().getOrFetchAccessToken();
      if (token == null) {
        _logger.w('Could not fetch access token for signed URL request');
      }

      final headers = <String, String>{
        if (token != null && token.isNotEmpty) 'Authorization': token,
        'Accept': 'application/json',
      };

      final response = await http.get(uri, headers: headers);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        try {
          final decoded = jsonDecode(response.body) as Map<String, dynamic>;
          final signed = decoded['signedUrl'] as String?;
          if (signed != null && signed.isNotEmpty) {
            _logger.d('Resolved signed URL: $url -> $signed');
            return signed;
          }
          _logger.w(
            'signedUrl not present in response; falling back to original URL',
          );
        } catch (e) {
          _logger.w('Failed parsing signedUrl response; falling back');
        }
      } else {
        _logger.w(
          'Signed URL request failed (${response.statusCode}); falling back',
        );
      }
    } catch (e, stack) {
      _logger.e('Resolving signed URL failed', error: e, stackTrace: stack);
    }

    // Fallback to original URL if anything goes wrong
    _logger.d('Using original URL (no resolution): $url');
    return url;
  }
}
