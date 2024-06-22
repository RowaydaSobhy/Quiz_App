import 'package:flutter/material.dart';
import 'package:quiz/core/color_app.dart';


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
                  color: Colors.white,
                  border: Border.all(
                      color: AppColor.primerCoior
                  ),borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Container (
                    child: Column(
                      children: [
                        Text("النتيجه",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                        SizedBox(height: 10,),
                        Text("${score}/${length*10}",style: TextStyle(fontWeight: FontWeight.bold,color: AppColor.primerCoior))
                      ],
                    ),
                  )

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
                width: 230,height: 40,
                alignment: Alignment.center ,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.blueGrey),borderRadius: BorderRadius.circular(10)
                ),
                child: Text("اعاده الاختبار",style: TextStyle(fontWeight: FontWeight.bold,color: AppColor.primerCoior),),
              ),
            ),
          ) ,
          const SizedBox(
              height: 18
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                height: 40,width: 230,decoration: BoxDecoration(border: Border.all(color: AppColor.primerCoior),borderRadius: BorderRadius.circular(10)),
                child: MaterialButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),minWidth: 230,height: 40,elevation: 5,
                  onPressed: ( ) {

                    Navigator.push(context, MaterialPageRoute(builder: (C) {
                      return CorrectAnswerScreen(
                        questions: questions,
                      );
                    }));
                  } ,
                  child:    Text("راجع اجاباتك",style: TextStyle(fontWeight: FontWeight.bold,color: AppColor.primerCoior),)    ,
                ),
              ),
            ),
          )
        ],
      ),


    );
  }
}
