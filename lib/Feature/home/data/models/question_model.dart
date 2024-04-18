class QuestionModel {
  String title;
  List<String> answers ;
  String correctAnswer;
  String ?  selectedAnswer;






  QuestionModel(

      {
        required this.correctAnswer,
        required this.answers,
        required this.title,
        required this.selectedAnswer
      }
      );

}