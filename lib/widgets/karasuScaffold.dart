import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:karasu/views/create_card.dart';
import 'package:karasu/views/popularDecks.dart';

class KarasuScaffold extends StatefulWidget {
  late Widget body;
  final String? title;

  KarasuScaffold({super.key, required this.body, this.title});

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
            icon: const Icon(
              Icons.new_label_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                widget.body = CreateCard();
              });
            },
          )
        ],
        title: InkWell(
          onTap: () {
            setState(() {
              widget.body = const PopularDecksDisplay();
            });
          },
          child: RichText(
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
      ),
      body: widget.body,
    );
  }
}
