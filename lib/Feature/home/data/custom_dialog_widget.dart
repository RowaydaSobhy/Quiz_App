import 'package:flutter/material.dart';


import '../../correct_answer/correct_answer_screen.dart';
import 'models/question_model.dart';

class CustomDialog extends StatelessWidget {

  const CustomDialog({super.key, required this.score, required this.questions, required this.length, this.click});

  final int score;
  final List<QuestionModel> questions;
  final int length;
  final void Function()?  click ;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          IconButton(onPressed: (  ) {
            Navigator.pop(context);
          }, icon: Icon(Icons.close)),


          Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 32 ,
                  horizontal: 94
              ),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                      color: Colors.blueGrey
                  )
              ),
              child: Column(
                children: [
                  Text("result"),
                  Text("${score}/${length*10}") ,

                ],
              ),
            ),
          ),
          SizedBox(
              height: 24
          ),
          Center(
            child: GestureDetector(
              onTap: click ,
              child: Container(
                alignment: Alignment.center ,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.blueGrey)
                ),
                child: Text("Re Test"),
              ),
            ),
          ) ,
          const SizedBox(
              height: 24
          ),
          MaterialButton(
            onPressed: ( ) {

              Navigator.push(context, MaterialPageRoute(builder: (C) {
                return CorrectAnswerScreen(
                  questions: questions,
                );
              }));
            } ,
            child:    Text("راحع اجاباتك")    ,
          )
        ],
      ),


    );
  }
}
