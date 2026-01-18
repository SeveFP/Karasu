import 'package:flutter/material.dart';

class AppActions extends InheritedWidget {
  final VoidCallback onThemeToggle;
  final ThemeMode currentThemeMode;
  final bool soundEnabled;
  final VoidCallback onToggleSound;
  final VoidCallback onLogout;

  const AppActions({
    super.key,
    required this.onThemeToggle,
    required this.currentThemeMode,
    required this.soundEnabled,
    required this.onToggleSound,
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
        soundEnabled != oldWidget.soundEnabled ||
        onToggleSound != oldWidget.onToggleSound ||
        onLogout != oldWidget.onLogout;
  }
}
