import 'package:flutter/material.dart';

import '../../home/data/models/question_model.dart';
class CustomCheckAnswerItemWidget extends StatelessWidget {
   CustomCheckAnswerItemWidget({super.key,required this.questionModel
  });
  final QuestionModel  questionModel;
int currentQuestionIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 10,),
        Text(questionModel.title),
        SizedBox(height: 10,),

        Divider(
          color: Colors.blueGrey,
          thickness: 1,
          endIndent: 10,
          indent: 10,),

        SizedBox(height: 10,),
        Wrap(
          children: [

            ...questionModel.answers.map((answer) =>
                SizedBox(
                width: MediaQuery.of(context).size.width/2   - 60,
                child: Text(answer,
                  style: TextStyle (
                      color:


                      questionModel.correctAnswer == answer ? Colors.green:

                      questionModel.correctAnswer != questionModel.selectedAnswer &&
                          questionModel.selectedAnswer == answer?

                      Colors.red:

                      Colors.black
                  ),
                )))

          ],
        ) ,
        SizedBox(height: 10,),
        Divider(
          color: Colors.blueGrey,
          thickness: 1,
          endIndent: 10,
          indent: 10,),





      ],
    );
  }
}


