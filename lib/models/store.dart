import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import 'deck.dart';

class KData {
  List<DeckModel> decks;
  Map<int, DealModel> deals;

  KData(this.decks, this.deals);

  KData.fromJson(Map<String, dynamic> json)
      : decks = json['decks'].map((jsonDeck) => DeckModel.fromJson(jsonDeck)),
        deals = json['deals'].map((deckID, jsonDeal) =>
            MapEntry(deckID, DealModel.fromJson(jsonDeal)));

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    List jsonDecks = [];

    json['decks'] = [];
    json['deals'] = {};

    for (var deck in decks) {
      jsonDecks.add(deck.toJson());
    }

    json['decks'] = jsonDecks;

    deals.forEach((deckID, deal) {
      json['deals'][deckID] = deal.toJson();
    });

    return json;
  }
}

class KStore {
  final log = Logger('Store');

  KData data = KData([], {});

  static final KStore _instance = KStore._internal();

  KStore._internal();

  factory KStore() => _instance;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _instance._localPath;
    return File('$path/data.json');
  }

  List<DeckModel> getDecks() {
    return _instance.data.decks;
  }

  addDecks(List<DeckModel> decks) {
    _instance.data.decks.addAll(decks);
    _instance.persist();
  }

  DealModel? getDealByDeckID(int deckID) {
    return data.deals[deckID];
  }

  static Future load() async {
    try {
      final file = await _instance._localFile;

      final content = await file.readAsString();

      Map<String, dynamic> parsedContent = json.decode(content);
      _instance.data = KData.fromJson(parsedContent);
    } catch (e) {
      _instance.log.severe(e);
    }
  }

  Future<File> persist() async {
    final file = await _instance._localFile;

    var asJson = _instance.data.toJson();

    return file.writeAsString(json.encode(asJson));
  }
}
