import 'package:flutter/material.dart';

class KarasuScaffold extends StatefulWidget {
  final Widget body;
  final String? title;
  const KarasuScaffold({super.key, required this.body, this.title});

  @override
  State<KarasuScaffold> createState() => _KarasuScaffoldState();
}

class _KarasuScaffoldState extends State<KarasuScaffold> {
  @override
  Widget build(BuildContext context) {
    var title = widget.title;
    title = title != null ? '- $title' : '';

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.wifi_off,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                // widget.body = OfflineDecks();
              });
            },
          )
        ],
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              const TextSpan(text: 'Karasu', style: TextStyle(fontSize: 24)),
              const TextSpan(
                  text: '𓅂',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              TextSpan(text: title),
            ],
          ),
        ),
      ),
      body: widget.body,
    );
  }
}
