import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DeckModel {
  late String id;
  late String title;
  late String description;
  late List<CardModel> cards;

  DeckModel(this.id, this.title, this.description);

  DeckModel.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      switch (key) {
        case "id":
          id = value;
          break;
        case "title":
          title = value;
          break;
        case "description":
          description = value;
          break;
        case "cards":
          var list = value as List;
          cards = list.map((card) => CardModel.fromJson(card)).toList();
          break;
        default:
      }
    });
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'cards': cards.map((card) => card.toJson()).toList(),
      };
}

class CardModel {
  late String id;
  late String title;
  late List<AnswerModel> answers;

  CardModel(this.id, this.title, this.answers);

  CardModel.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      switch (key) {
        case "id":
          id = value;
          break;
        case "title":
          title = value;
          break;
        case "answers":
          var list = value as List;
          answers = list.map((answer) => AnswerModel.fromJson(answer)).toList();
          break;
        default:
      }
    });
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'answers': answers.map((answer) => answer.toJson()).toList(),
      };
}

class AnswerModel {
  String id;
  String text;
  bool isCorrect;

  AnswerModel(this.id, this.text, this.isCorrect);

  AnswerModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'],
        isCorrect = json['isCorrect'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'isCorrect': isCorrect,
      };
}

class OfflineStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/offline_decks.json');
  }

  Future<List<DeckModel>> getDecks() async {
    try {
      final file = await _localFile;

      final content = await file.readAsString();

      Map<String, dynamic> parsedContent = json.decode(content);
      var jsonDecks = parsedContent['decks'] as List;

      return jsonDecks.map((deck) => DeckModel.fromJson(deck)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<File> storeDecks(List<DeckModel> decks) async {
    final file = await _localFile;

    Map<String, dynamic> content = {'decks': decks};

    return file.writeAsString(json.encode(content));
  }
}
