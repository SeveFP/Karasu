import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:karasu/models/app_config.dart';
import 'package:logger/logger.dart';

class ConfigService {
  static final ConfigService _instance = ConfigService._internal();
  static final Logger _logger = Logger();
  late AppConfig _config;

  factory ConfigService() {
    return _instance;
  }

  ConfigService._internal();

  AppConfig get config => _config;

  bool get isDebugMode => _config.mode == AppMode.debug;

  Future<void> loadConfig() async {
    AppConfig baseConfig;

    // Try to load dev config first
    try {
      final jsonString = await rootBundle.loadString('assets/config.dev.json');
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      baseConfig = AppConfig.fromJson(jsonMap);
      _logger.i('Loaded development config');
    } catch (e) {
      _logger.w('No development config found, loading default config');
      // Fallback to default config
      try {
        final jsonString = await rootBundle.loadString('assets/config.json');
        final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
        baseConfig = AppConfig.fromJson(jsonMap);
        _logger.i('Loaded default config');
      } catch (e) {
        _logger.e('Error loading config: $e');
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
          statusColors: AppStatusColors(
            successColorLight: 4281896508,
            successColorDark: 4284922730,
            successContainerLight: 4291356361,
            successContainerDark: 4279983648,
            errorColorLight: 4292030255,
            errorColorDark: 4293874512,
            errorContainerLight: 4294954450,
            errorContainerDark: 4290190364,
          ),
          debugPaintSizeEnabled: false,
          themeMode: AppThemeMode.system,
          defaultMaxCards: 10,
          mode: AppMode.production,
        );
      }
    }

    _config = AppConfig(
      appName: baseConfig.appName,
      toshokanURL: baseConfig.toshokanURL,
      protocol: baseConfig.protocol,
      logoPath: baseConfig.logoPath,
      logoBackgroundColor: baseConfig.logoBackgroundColor,
      colorScheme: baseConfig.colorScheme,
      statusColors: baseConfig.statusColors,
      debugPaintSizeEnabled: baseConfig.debugPaintSizeEnabled,
      themeMode: baseConfig.themeMode,
      defaultMaxCards: baseConfig.defaultMaxCards,
      mode: baseConfig.mode,
    );

    _logger.i('TOSHOKAN_URL: ${_config.toshokanURL}');
  }
}
