import 'package:flutter/material.dart';
import 'main_body.dart';
import 'database.dart';

class Quizz extends StatefulWidget {
  @override
  _QuizzState createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  //--------------------------------------------------------------
  //--------------------------------------------------------------
  //Change only this variable !
  int num_questions = 8; // set number of questions in the quiz
  //--------------------------------------------------------------
  //--------------------------------------------------------------
  double screen_width;
  _Quizz_Logic logic;
  String curr_question;
  bool curr_answer;
  bool finshed;

  void initState(){
    super.initState();
    this.logic = new _Quizz_Logic(this.num_questions); // Set Number of questions
    this.set_next_question();
    this.finshed = false;
  }

  void set_next_question(){
    List<dynamic> question = this.logic.get_question();
    if(question == null){
      this.finshed = true;
      return;
    };
    this.curr_question = question[0];
    this.curr_answer = question[1];
  }


  @override
  Widget build(BuildContext context){
    this.screen_width = MediaQuery.of(context).size.width;
    return main_body(body: this.get_body());
  }


Widget get_body(){
  return (this.finshed) ? Container(
    width: screen_width,
    constraints: BoxConstraints.expand(),
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("img/Congrates.jpg"),
            fit: BoxFit.fill)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        Text("You Scored ${this.logic.score} out of ${this.logic.num_questions}",
          style: TextStyle(
              color: Colors.red[700],
              fontSize: 30.0,
              fontWeight: FontWeight.w900
          ),
        ),
        SizedBox(height: 30.0),
        RaisedButton(
          child: Text("Take Another Quiz",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600
              )),
          color: Colors.green,
          padding: EdgeInsets.all(20.0),
          onPressed: (){
            setState(() {
              this.logic = new _Quizz_Logic(this.num_questions);
              set_next_question();
              this.finshed = false;
            });
          },
        )
      ],
    ),
  ) :
  Container(
    color: Colors.yellow[300],
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        button(
            width: screen_width,
            text: "True",
            textColor: Colors.white,
            backgroundColor: Colors.greenAccent,
            onPress: (){
              if(this.curr_answer) this.logic.inc_score();
//                   print(this.logic.score);
              setState(() {
                this.set_next_question();
              });
            }
        ),
        Container(
          width: screen_width,
          color: Colors.yellow,
          padding: EdgeInsets.all(20.0),
          child: Text(this.curr_question,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30.0,
            ),),
        ),
        button(
            width: screen_width,
            text: "False",
            textColor: Colors.black,
            backgroundColor: Colors.red,
            onPress: (){
              if(! this.curr_answer) this.logic.inc_score();
//                      print(this.logic.score);
              setState(() {
                this.set_next_question();
              });
            }
        )
      ],
    ),
  );
}
}

Widget button({double width,String text,Color textColor,
  Color backgroundColor,Function onPress}){
  return ButtonTheme(
    minWidth: width,
    child: RaisedButton(
        child: Text(text,
            style: TextStyle(
              color: textColor,
              fontSize: width/8,
              fontWeight: FontWeight.w900,
            )
        ),
        color: backgroundColor,
        padding: EdgeInsets.all(50.0),
        onPressed: (){onPress();}
    ),
  );
}

class _Quizz_Logic{
  int num_questions;
  int curr_question_index;
  int score;
  Map<String,bool> quiz_questions;
  _Quizz_Logic(this.num_questions){
      DataBase db = new DataBase();
      this.quiz_questions = db.get_random_questions(this.num_questions);
      this.curr_question_index = 0;
      this.score = 0;
//      db.print_info();
//      db.print_questions(quiz_questions);
  }

  List<dynamic> get_question(){
    if(this.curr_question_index == num_questions) return null;
    String question = this.quiz_questions.keys.toList()[this.curr_question_index];
    bool answer = this.quiz_questions[question];
    this.curr_question_index++;
    return [question,answer];
  }

  void inc_score(){ this.score++; }

}


