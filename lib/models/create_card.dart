// CreateCardModel represents the CreateCardInput type in the GraphQL schema
class CreateCardModel {
  late String deckID;
  late String title;
  late List<CreateAnswerModel> answers;
  late String explanation;

  CreateCardModel(this.deckID, this.title, this.answers, this.explanation);

  CreateCardModel.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      switch (key) {
        case "deckID":
          deckID = value; // TODO does it make sense to have the id here?
          break;
        case "title":
          title = value;
          break;
        case "answers":
          var list = value as List;
          answers =
              list.map((answer) => CreateAnswerModel.fromJson(answer)).toList();
          break;
        case "explanation":
          explanation = value;
          break;
        default:
      }
    });
  }

  Map<String, dynamic> toJson() => {
        'card': {
          'title': title,
          'answers': answers.map((answer) => answer.toJson()).toList(),
          'explanation': explanation,
        },
        'deckID': deckID,
      };

  void setAnswer(int index, String text, bool isCorrect) {}
}

class CreateAnswerModel {
  String text;
  bool isCorrect;

  CreateAnswerModel(this.text, this.isCorrect);

  CreateAnswerModel.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        isCorrect = json['isCorrect'];

  Map<String, dynamic> toJson() => {
        'text': text,
        'isCorrect': isCorrect,
      };
}
