import 'package:flutter/material.dart';
import 'package:karasu/models/app_config.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/views/create_card.dart';
import 'package:karasu/views/popularDecks.dart';

class KarasuScaffold extends StatefulWidget {
  final Widget body;
  final String? title;
  final bool isLoggedIn;

  const KarasuScaffold({
    super.key,
    required this.body,
    this.title,
    this.isLoggedIn = false,
  });

  @override
  State<KarasuScaffold> createState() => _KarasuScaffoldState();
}

class _KarasuScaffoldState extends State<KarasuScaffold> {
  late Widget _body;

  @override
  void initState() {
    super.initState();
    _body = widget.body;
  }

  @override
  void didUpdateWidget(KarasuScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.body != oldWidget.body) {
      _body = widget.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = ConfigService().config;
    var title = widget.title;
    title = title != null ? '- $title' : '';

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          if (widget.isLoggedIn)
            IconButton(
              icon: const Icon(
                Icons.new_label_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _body = CreateCard();
                });
              },
            )
        ],
        title: widget.isLoggedIn
            ? InkWell(
                onTap: () {
                  setState(() {
                    _body = const PopularDecksDisplay();
                  });
                },
                child: _buildTitle(config, title),
              )
            : _buildTitle(config, title),
      ),
      body: _body,
    );
  }

  Widget _buildTitle(AppConfig config, String title) {
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
              return RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: config.appName,
                        style: const TextStyle(fontSize: 24)),
                    const TextSpan(
                        text: '𓅂',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    TextSpan(text: title),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '${config.appName}$title',
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
