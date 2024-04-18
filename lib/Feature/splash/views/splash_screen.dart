import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:quiz/Feature/home/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {     //بنعمل فيه كود مكحتاجينه قبل فن البيلت
    // TODO: implement initState
    Future.delayed(Duration(
      seconds: 3,
    ),
        (){
      Navigator.push(context, MaterialPageRoute(builder: (R)
      {
        return HomeScreen();
      }
      ));
        }

    );
  }




  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        Align(
          alignment: Alignment.topLeft,
          child: Image.asset("assets/images/UP.png"
          ,height: 252,width: 265,

          ),
        ),
          Spacer(),
      JelloIn(
            child: Center(
              child: Image.asset("assets/images/logo.png"
                ,height: 59,width: 231,
              ),
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset("assets/images/down.png"
              ,height: 252,width: 265,
            ),
          )


        ],



      ),


    );
  }
}
