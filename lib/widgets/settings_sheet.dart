import 'package:karasu/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:karasu/widgets/app_actions.dart';

Future<void> showSettingsSheet(BuildContext context) async {
  final actions = AppActions.of(context);
  if (actions == null) return;

  await showModalBottomSheet(
    context: context,
    builder: (context) => _SettingsSheet(actions: actions),
  );
}

class _SettingsSheet extends StatelessWidget {
  final AppActions actions;
  const _SettingsSheet({required this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              AppLocalizations.of(context)!.settingsTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(
              actions.currentThemeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            title: Text(AppLocalizations.of(context)!.toggleTheme),
            onTap: () {
              actions.onThemeToggle();
              Navigator.pop(context);
            },
          ),
          const Divider(height: 16),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(AppLocalizations.of(context)!.logoutButton),
            onTap: () {
              Navigator.pop(context); // Close the bottom sheet
              actions.onLogout();
              // Navigate back to root, clearing the stack
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
