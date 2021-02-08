import 'package:flutter/material.dart';
import 'main_body.dart';


class HowWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return main_body(body: this.get_body());
  }

  Widget get_body(){
      return Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            get_title("Programming Quiz"),
            Divider(color: Colors.greenAccent,thickness: 2),
            get_sub_title("There are 8 question per quiz"),
            get_sub_title("Questions are randomly generated"),
            get_sub_title("Take as many quizzes as you want"),
            get_sub_title("Enjoy and challenge your friends"),
          ],
        ),
      );
  }

  Widget get_title(String title){
    return  Center(
      child: Text(title,style: TextStyle(color: Colors.green[700],fontSize: 30,
          fontWeight: FontWeight.bold)),
    );
  }

  Widget get_sub_title(String title){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text("🔹${title}",style: TextStyle(
        color: Colors.blue[800],fontSize: 20,fontWeight: FontWeight.bold
      )),
    );
  }

}




