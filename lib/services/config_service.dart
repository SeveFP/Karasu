import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:karasu/models/app_config.dart';

class ConfigService {
  static final ConfigService _instance = ConfigService._internal();
  late AppConfig _config;

  factory ConfigService() {
    return _instance;
  }

  ConfigService._internal();

  AppConfig get config => _config;

  Future<void> loadConfig() async {
    AppConfig baseConfig;

    // Try to load dev config first
    try {
      final jsonString = await rootBundle.loadString('assets/config.dev.json');
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      baseConfig = AppConfig.fromJson(jsonMap);
      print('Loaded development config');
    } catch (e) {
      print('No development config found, loading default config');
      // Fallback to default config
      try {
        final jsonString = await rootBundle.loadString('assets/config.json');
        final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
        baseConfig = AppConfig.fromJson(jsonMap);
        print('Loaded default config');
      } catch (e) {
        print('Error loading config: $e');
        // Use hardcoded defaults as last resort, but better defaults should be set
        baseConfig = AppConfig(
          appName: 'Karasu',
          toshokanURL: 'localhost:8080',
          protocol: 'https://',
          logoPath: 'assets/logo.png',
          logoBackgroundColor: 4294967295,
          colorScheme: AppColorScheme(
            primaryColor: 0xFF6750A4,
            secondaryColor: 0xFF625B71,
            tertiaryColor: 0xFF7D5260,
          ),
        );
      }
    }

    // Override URL with environment variable if it exists
    final envToshokanURL = Platform.environment['TOSHOKAN_URL'];

    _config = AppConfig(
      appName: baseConfig.appName,
      toshokanURL: envToshokanURL ?? baseConfig.toshokanURL,
      protocol: baseConfig.protocol,
      logoPath: baseConfig.logoPath,
      logoBackgroundColor: baseConfig.logoBackgroundColor,
      colorScheme: baseConfig.colorScheme,
    );

    print('TOSHOKAN_URL: ${_config.toshokanURL}');
  }
}
