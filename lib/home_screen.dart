import 'package:flutter/material.dart';
import 'main_body.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return main_body(body: this.get_body(context));
  }

  Widget get_body(BuildContext context){
    return Container(
      width: (1.0/0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image:AssetImage('img/icon.webp'),width: 200),
          SizedBox(height: 10),
          this.get_button(title: "Take Quiz",on_press: (){
            Navigator.pushNamed(context,'/quiz');
          }),
          SizedBox(height: 10),
          this.get_button(title: "How it work",on_press: (){
              Navigator.pushNamed(context,'/how_work');
          }),
        ],
      ),
    );
  }

  Widget get_button({String title,on_press}){
    return RaisedButton(
        color: Colors.green[500],
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        child: Text(title,style: TextStyle(
          color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold
        )),
        onPressed: (){on_press();}
    );
  }

}
