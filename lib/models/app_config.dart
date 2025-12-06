import 'package:flutter/material.dart';

enum AppThemeMode { system, light, dark }

class AppConfig {
  final String appName;
  final String toshokanURL;
  final String protocol;
  final String logoPath;
  final int? logoBackgroundColor;
  final AppColorScheme colorScheme;
  final bool debugPaintSizeEnabled;
  final AppThemeMode themeMode;

  AppConfig({
    required this.appName,
    required this.toshokanURL,
    required this.protocol,
    required this.logoPath,
    this.logoBackgroundColor,
    required this.colorScheme,
    this.debugPaintSizeEnabled = false,
    this.themeMode = AppThemeMode.system,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    AppThemeMode _modeFromJson(String? v) {
      switch (v) {
        case 'light':
          return AppThemeMode.light;
        case 'dark':
          return AppThemeMode.dark;
        default:
          return AppThemeMode.system;
      }
    }

    return AppConfig(
      appName: json['appName'] ?? 'Karasu',
      toshokanURL: json['toshokanURL'] ?? 'localhost:8080',
      protocol: json['protocol'] ?? 'https://',
      logoPath: json['logoPath'] ?? 'assets/logo.png',
      logoBackgroundColor: json['logoBackgroundColor'],
      colorScheme: AppColorScheme.fromJson(json['colorScheme'] ?? {}),
      debugPaintSizeEnabled: json['debugPaintSizeEnabled'] ?? false,
      themeMode: _modeFromJson(json['themeMode'] as String?),
    );
  }
}

class AppColorScheme {
  final int primaryColor;
  final int secondaryColor;
  final int tertiaryColor;

  AppColorScheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
  });

  factory AppColorScheme.fromJson(Map<String, dynamic> json) {
    return AppColorScheme(
      primaryColor: json['primaryColor'] ?? 0xFF6750A4,
      secondaryColor: json['secondaryColor'] ?? 0xFF625B71,
      tertiaryColor: json['tertiaryColor'] ?? 0xFF7D5260,
    );
  }

  ColorScheme get lightColorScheme {
    final seed = Color(primaryColor);
    return ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.light,
    ).copyWith(
      secondary: Color(secondaryColor),
      tertiary: Color(tertiaryColor),
    );
  }

  ColorScheme get darkColorScheme {
    final seed = Color(primaryColor);
    return ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.dark,
    ).copyWith(
      secondary: Color(secondaryColor),
      tertiary: Color(tertiaryColor),
    );
  }
}
