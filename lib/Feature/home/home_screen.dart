import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz/Feature/home/data/models/question_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String?country = "رويدا";
  List <QuestionModel> questions = [
    {
  "title":  "q1",
  "answers": ["a1", "a2" , "a3"],
  "correctAnswer": "a1",
  "selectedAnswer": null
},
    {
      "title":"q5",
      "answer":["a5","a6"],
      "correctAnswer":"a5",
      "selectAnswer":null
    },
    {
      "title": "q1",
      "answers": ["a1", "a2", "a3"],
      "correctAnswer": "a1",
      "selectedAnswer": null
    }

  ];
  int score = 0 ;
  checkScore( ) {
    for(int i   = 0 ;  i<questions.length ; i++ ) {

      if(questions[i].correctAnswer== questions[i].selectedAnswer) {
        score += 10 ;
      }

    }
  }




  int questionIndex = 0;

  plusquestionIndex() {
    if (questionIndex < questions.length - 1) {
      if(questions[questionIndex].selectAnswer!=null) {
        questionIndex++;
        setState(() {});
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("choose one answer"),
        ));
      }else{
      checkScore();
      showDialog(context: context, builder: (cont )
      {
        return CustomResultDialog(
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
                  color: Colors.blueGrey,
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
              Text(questions[questionIndex],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Divider(
                color: Colors.blueGrey,
                thickness: 1,
                endIndent: 10,
                indent: 10,),

              RadioListTile(
                  title: Text("رويدا"),
                  value: "رويدا",    //القيمه الفعليه الي هيا الاجابات
                  groupValue: country, //القيمه الصحيحه        لما الجروب بيساوي الفاليو بتتلون
                  onChanged: (val) {    //هنا بقول ان السيلكت انسر الي انا اختارته
                setState(() {
                  country = val;
                });
              }),
              RadioListTile(
                  title: Text("22"),
                  value: "22", groupValue: country, onChanged: (val) {
                setState(() {
                  country = val;
                });
              }),

              RadioListTile(
                  title: Text("اسود"),
                  value: "اسود ", groupValue: country, onChanged: (val) {
                setState(() {
                  country = val;
                });
              })
              ,
              Divider(
                color: Colors.blueGrey,
                thickness: 1,
                endIndent: 10,
                indent: 10,),

              TextButton(
                style:ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                )
                    ,onPressed: (){
                      plusquestionIndex();}
                  , child: Text(


                "NEXT",
              style: TextStyle(color: Colors.white),)),

    Text("${questionIndex + 1}/${questions.length}",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ],
          ),
        ));
  }
  }

