class DeckModel {
  String id = "";
  String title = "";
  String description = "";
  List<CardModel> cards = [];

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
          if (value == null) {
            break;
          }
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

class DealModel {
  int deckID;
  List<CardModel> cards;

  DealModel(this.deckID, this.cards);

  DealModel.fromJson(Map<String, dynamic> json)
      : deckID = json['id'],
        cards = json['cards'].map((card) => CardModel.fromJson(card));

  Map<String, dynamic> toJson() => {
        'id': deckID,
        'cards': cards.map((card) => card.toJson()),
      };
}
