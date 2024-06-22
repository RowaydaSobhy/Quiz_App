import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz/Feature/home/data/custom_dialog_widget.dart';
import 'package:quiz/Feature/home/data/models/question_model.dart';
import 'package:quiz/core/color_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {


  changeSelectedAnswerToNull( ) {
    for(int i  = 0 ;  i< questions.length ; i++ ) {
      questions[i].selectedAnswer  = null;
    }
  }

  int questionIndex=0;

  int score = 0 ;

  checkScore( ) {
    for(int i   = 0 ;  i<questions.length ; i++ ) {

      if(questions[i].correctAnswer== questions[i].selectedAnswer) {
        score += 10 ;
      }

    }
  }

List<QuestionModel> questions=[

  QuestionModel(correctAnswer: "rowayda",
  answers: ["rowayda", "rawan", "rana", "howayda"],
  title: "?What is your name",
  selectedAnswer: null)
  ,

  QuestionModel(correctAnswer: "21",
  answers: ["21", "20", "22"],
  title: "?How old are you",
  selectedAnswer: null)
  ,

  QuestionModel(correctAnswer: "pink",
  answers: ["red", "pink", "black"],
  title: "?Who is your favorite  color",
  selectedAnswer: null),
];



  plusQuestionIndex() {

  if(questionIndex < questions.length-1 ) {

  if(questions[questionIndex].selectedAnswer!=null){
  questionIndex++;
  setState(() {
  });
  }
  else {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  content: Text("choose one answer please"),
  ));
  }
  }else{
    checkScore();
    showDialog(context: context, builder: (cont )
    {
      return CustomDialog(
        questions: questions,
        score: score,
        length: questions.length,
        click: ( ) {
          questionIndex = 0;
          score =  0;
          changeSelectedAnswerToNull();
          Navigator.pop(context);
          setState(() {

          });
        },
      );
    } );

  }
  }

    @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 25.0),
                padding: EdgeInsets.only(top: 100.0),
                width: 500,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColor.primerCoior,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
                child: Text(
                  "QIEZ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),

              Divider(
                color: AppColor.primerCoior,
                thickness: 1,
                endIndent: 10,
                indent: 10,),


      Text(questions[questionIndex].title ,


      style: const TextStyle(


      color: Color(0xff006672),
      fontWeight: FontWeight.w700,
      fontSize: 14
      ),
      textAlign: TextAlign.right,
      ) ,
      SizedBox(height: 14,),

      Divider(
      color: AppColor.primerCoior,
      thickness: 1,
      endIndent: 10,
      indent: 10,),


      ...questions[questionIndex].answers.map(
      (answer){
      return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

      Text(answer),

      Radio(
      activeColor:Color(0xff006672) ,
      value: answer,
      groupValue:questions[questionIndex].selectedAnswer ,
      onChanged: ( x) {
      questions[questionIndex].selectedAnswer= x;
      setState(() {

      });
      },
      )

      ],
      );
      }
      ),
      Divider(
      color: AppColor.primerCoior,
      thickness: 1,
      endIndent: 10,
      indent: 10,),
      SizedBox(height: 14,),



      TextButton(

      style: ButtonStyle(
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8
      ) ,

      )),
      backgroundColor: MaterialStateProperty.all(Color(0xff006672))
      ),
      onPressed: ( ) {

      plusQuestionIndex();




      } , child: Padding(


      padding: const EdgeInsets.symmetric(
      horizontal: 20.0),
      child: Text(
      questionIndex== questions.length-1  ?  "sent":     "next",

      style: TextStyle(
      color: Colors.white
      ),
      ),
      ))
      //






      ],
      )
        )
      , );
    }
}




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


