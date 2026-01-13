import 'package:flutter/material.dart';

enum AppThemeMode { system, light, dark }

enum AppMode { debug, production }

class AppConfig {
  final String appName;
  final String toshokanURL;
  final String protocol;
  final String logoPath;
  final int? logoBackgroundColor;
  final AppColorScheme colorScheme;
  final AppStatusColors statusColors;
  final bool debugPaintSizeEnabled;
  final AppThemeMode themeMode;
  final int defaultMaxCards;
  final AppMode mode;
  final bool lockLessons;

  AppConfig({
    required this.appName,
    required this.toshokanURL,
    required this.protocol,
    required this.logoPath,
    this.logoBackgroundColor,
    required this.colorScheme,
    required this.statusColors,
    this.debugPaintSizeEnabled = false,
    this.themeMode = AppThemeMode.system,
    required this.defaultMaxCards,
    this.mode = AppMode.production,
    required this.lockLessons,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    AppThemeMode modeFromJson(String? v) {
      switch (v) {
        case 'light':
          return AppThemeMode.light;
        case 'dark':
          return AppThemeMode.dark;
        default:
          return AppThemeMode.system;
      }
    }

    AppMode appModeFromJson(String? v) {
      switch (v) {
        case 'debug':
          return AppMode.debug;
        case 'production':
        default:
          return AppMode.production;
      }
    }

    return AppConfig(
      appName: json['appName'] ?? 'Karasu',
      toshokanURL: json['toshokanURL'] ?? 'localhost:8080',
      protocol: json['protocol'] ?? 'https://',
      logoPath: json['logoPath'] ?? 'assets/logo.png',
      logoBackgroundColor: json['logoBackgroundColor'],
      colorScheme: AppColorScheme.fromJson(json['colorScheme'] ?? {}),
      statusColors: AppStatusColors.fromJson(json['statusColors'] ?? {}),
      debugPaintSizeEnabled: json['debugPaintSizeEnabled'] ?? false,
      themeMode: modeFromJson(json['themeMode'] as String?),
      defaultMaxCards: json['defaultMaxCards'] ?? 10,
      mode: appModeFromJson(json['mode'] as String?),
      lockLessons: json['lockLessons'] == true,
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

class AppStatusColors {
  final int successColorLight;
  final int successColorDark;
  final int successContainerLight;
  final int successContainerDark;
  final int errorColorLight;
  final int errorColorDark;
  final int errorContainerLight;
  final int errorContainerDark;

  AppStatusColors({
    required this.successColorLight,
    required this.successColorDark,
    required this.successContainerLight,
    required this.successContainerDark,
    required this.errorColorLight,
    required this.errorColorDark,
    required this.errorContainerLight,
    required this.errorContainerDark,
  });

  factory AppStatusColors.fromJson(Map<String, dynamic> json) {
    return AppStatusColors(
      successColorLight: json['successColorLight'] ?? 0xFF2E7D32,
      successColorDark: json['successColorDark'] ?? 0xFF66BB6A,
      successContainerLight: json['successContainerLight'] ?? 0xFFC8E6C9,
      successContainerDark: json['successContainerDark'] ?? 0xFF1B5E20,
      errorColorLight: json['errorColorLight'] ?? 0xFFC62828,
      errorColorDark: json['errorColorDark'] ?? 0xFFEF5350,
      errorContainerLight: json['errorContainerLight'] ?? 0xFFFFCDD2,
      errorContainerDark: json['errorContainerDark'] ?? 0xFF690000,
    );
  }

  Color getSuccessColor(Brightness brightness) {
    return brightness == Brightness.light
        ? Color(successColorLight)
        : Color(successColorDark);
  }

  Color getErrorColor(Brightness brightness) {
    return brightness == Brightness.light
        ? Color(errorColorLight)
        : Color(errorColorDark);
  }

  Color getSuccessContainerColor(Brightness brightness) {
    return brightness == Brightness.light
        ? Color(successContainerLight)
        : Color(successContainerDark);
  }

  Color getErrorContainerColor(Brightness brightness) {
    return brightness == Brightness.light
        ? Color(errorContainerLight)
        : Color(errorContainerDark);
  }
}
