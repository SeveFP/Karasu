class DeckModel {
  String id;
  String title;
  String description;

  DeckModel(this.id, this.title, this.description);
}

class AnswerModel {
  String id;
  String text;
  bool isCorrect;

  AnswerModel(this.id, this.text, this.isCorrect);
}

class CardModel {
  String id;
  String title;
  List<AnswerModel> answers;

  CardModel(this.id, this.title, this.answers);
}
