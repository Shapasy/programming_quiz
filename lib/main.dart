import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'how_it_work_screen.dart';
import 'quiz_screen.dart';


void main(){ runApp(MyApp()); }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Programming Quiz',
      routes: {
        '/': (BuildContext context) => Home(),
        '/how_work':(BuildContext context) => HowWork(),
        '/quiz':(BuildContext context) => Quizz()
      },
      initialRoute: '/',
    );
  }
}

