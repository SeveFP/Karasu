import 'package:flutter/material.dart';
import 'package:karasu/models/app_config.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/logger_service.dart';
import 'package:karasu/views/courses.dart';
import 'package:karasu/views/create_card.dart';
import 'package:karasu/views/popularDecks.dart';
import 'package:karasu/widgets/responsive_container.dart';

class KarasuScaffold extends StatefulWidget {
  final Widget body;
  final String? title;
  final bool isLoggedIn;
  final VoidCallback? onThemeToggle;
  final ThemeMode? currentThemeMode;

  const KarasuScaffold({
    super.key,
    required this.body,
    this.title,
    this.isLoggedIn = false,
    this.onThemeToggle,
    this.currentThemeMode,
  });

  @override
  State<KarasuScaffold> createState() => _KarasuScaffoldState();
}

class _KarasuScaffoldState extends State<KarasuScaffold> {
  late Widget _body;
  final _logger = LoggerService.instance;

  @override
  void initState() {
    super.initState();
    _body = widget.body;
  }

  @override
  void didUpdateWidget(KarasuScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.body != oldWidget.body) {
      setState(() {
        _body = widget.body;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = ConfigService().config;
    var title = widget.title;
    title = title != null ? ' - $title' : '';

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          if (widget.onThemeToggle != null)
            IconButton(
              icon: Icon(
                widget.currentThemeMode == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              onPressed: widget.onThemeToggle,
              tooltip: 'Toggle theme',
            ),
          if (widget.isLoggedIn)
            IconButton(
              icon: const Icon(Icons.new_label_sharp, color: Colors.white),
              onPressed: () {
                setState(() {
                  _body = CreateCard();
                });
              },
            ),
        ],
        title: widget.isLoggedIn
            ? InkWell(
                onTap: () {
                  setState(() {
                    _body = CoursesView();
                  });
                },
                child: _buildTitle(config, title),
              )
            : _buildTitle(config, title),
      ),
      body: ResponsiveBody(child: _body),
    );
  }

  Widget _buildTitle(AppConfig config, String title) {
    _logger.d('Building title with logo: ${config.logoPath}');
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
              _logger.e(
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
                    TextSpan(text: title),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 8),
        Text('${config.appName}$title', style: const TextStyle(fontSize: 24)),
      ],
    );
  }
}
