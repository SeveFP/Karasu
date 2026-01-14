import 'package:karasu/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:karasu/models/app_config.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:karasu/widgets/settings_sheet.dart';
import 'package:karasu/widgets/responsive_container.dart';

/// Shared scaffold for authenticated area with consistent AppBar and settings action.
class ShellScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;

  /// When true, shows app logo + name. When false, shows only the title.
  final bool showAppBranding;

  const ShellScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.showAppBranding = false,
  });

  @override
  Widget build(BuildContext context) {
    final config = ConfigService().config;

    return Scaffold(
      appBar: AppBar(
        title: showAppBranding ? _buildBrandedTitle(config) : Text(title),
        actions: [
          ...?actions,
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => showSettingsSheet(context),
            tooltip: AppLocalizations.of(context)!.settingsTooltip,
          ),
        ],
      ),
      body: ResponsiveBody(child: body),
    );
  }

  Widget _buildBrandedTitle(AppConfig config) {
    final logger = LoggerService.instance;
    logger.d('Building title with logo: ${config.logoPath}');

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: config.logoBackgroundColor != null
              ? BoxDecoration(
                  color: Color(config.logoBackgroundColor!),
                  borderRadius: BorderRadius.circular(4),
                )
              : null,
          child: Image.asset(
            config.logoPath,
            height: 32,
            errorBuilder: (context, error, stackTrace) {
              logger.e(
                'Failed to load logo image',
                error: error,
                stackTrace: stackTrace,
              );
              return RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: config.appName,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const TextSpan(
                      text: '𓅂',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 8),
        Text(config.appName, style: const TextStyle(fontSize: 24)),
      ],
    );
  }
}
