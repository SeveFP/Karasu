import 'package:flutter/material.dart';

class AppActions extends InheritedWidget {
  final VoidCallback onThemeToggle;
  final ThemeMode currentThemeMode;
  final VoidCallback onLogout;

  const AppActions({
    super.key,
    required this.onThemeToggle,
    required this.currentThemeMode,
    required this.onLogout,
    required super.child,
  });

  static AppActions? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppActions>();
  }

  @override
  bool updateShouldNotify(AppActions oldWidget) {
    return onThemeToggle != oldWidget.onThemeToggle ||
        currentThemeMode != oldWidget.currentThemeMode ||
        onLogout != oldWidget.onLogout;
  }
}
