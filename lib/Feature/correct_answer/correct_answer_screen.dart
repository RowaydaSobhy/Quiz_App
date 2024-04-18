import 'package:flutter/material.dart';
import 'package:quiz/Feature/correct_answer/widget/check_answer_body.dart';
import 'package:quiz/Feature/correct_answer/widget/custom_appbar.dart';

import '../home/data/models/question_model.dart';

class CorrectAnswerScreen extends StatelessWidget {
  const CorrectAnswerScreen({super.key,required this.questions
  });
  final List<QuestionModel> questions;
  
  @override
  Widget build(BuildContext context) {
    print(questions[0].title.toString());
    return Scaffold(
      appBar:AppBar(
        toolbarHeight:100 ,
        flexibleSpace:CustomAppbar(
          name: "checkAnswer",

        ) ,
      ) ,
      body: CheckAnswerBody(questions: questions,
         
      ),
    );
  }
}
