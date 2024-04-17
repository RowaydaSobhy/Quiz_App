import 'package:flutter/material.dart';
import 'package:quiz/Feature/home/home_screen.dart';
import 'package:quiz/Feature/splash/views/splash_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
    }
}