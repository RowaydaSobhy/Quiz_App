class QuestionModel{
  String title;
List<String> answers;
String ?correctAnser;
String? selectAnswer;


QuestionModel(
  {
    required this.title,
    required this.answers,
    required this.correctAnser,
    required this.selectAnswer,
}
    );
}