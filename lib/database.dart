import 'dart:math';

class DataBase{
  Map<String,bool> data;
  int true_data,false_data;

  DataBase(){
    this.data = {
        "Python is faster than C++.":false,
        "Bubble sort is the fastest sorting algorithm.":false,
        "Dynamic programming is used to overlapping subproblem.":true,
        "Normalization used to minimize data repetition in databases.":true,
        "Vue is a backend web framework.":false,
        "CNN is usually used in computer vision.":true,
        "RNN is usually used in computer vision.":false,
        ".Net framework is developed by amazon.":false,
        "We can use dijkstra algorithm even if we have a negative cycle.":false,
        "Using break inside loop can cause logical errors.":true,
        "In computer science There is space-time tradeoff.":true,
        "Array must be sorted in order to use binary search.":true,
        "R language is usually used in data analysis.":true,
        "MongoDB is sql databae.":false,
        "Flask is javascript framework.": false,
        "Flutter is used to only create mobile application.":false,
        "Javascript used to only create web application.":false,
        "C is an object oriented language.":false,
        "If x = (5>5 ? 5 : 4) then x is 5 ":false,
        "Dart programming language is developed by microsoft.":false,
        "HTML stands for extensible markup language.":false,
        "Java is cross-platform language.":true,
        "java double datatype is bigger than int datatype in size.":true,
        "CSS stands for Cascading Style Sheets.": true,
        "NPM is a package manager for Django.":false,
        "Angular is a TypeScript-based framework.":true,
        "PHP is used for back end development only.":true,
        "Angular framwork was developed by google.":true,
        "TCP/IP network model consists of 4 layers.":true,
        "UDP is a connecation oriented protocol.":false,
        "TCP sending data faster than UDP.":false,
        "Internet is a collection of computer network.":true,
        "Java class can inherit only one class.":true,
        "Fault is casuse of failure.":true,
        "ReLU is the most used activation function.":true,
        "XML stands for Hypertext Markup Language.":false,
        "WordPress software is written in PHP.":true,
        "Unity framework uses python.":false,
      };
      this.true_data = 0;
      this.false_data = 0;
      for(bool answer in this.data.values){
        (answer)?this.true_data++:this.false_data++;
      }
  }

  void print_info(){
    print("Database Informations :-");
    print("There is ${this.data.length} questions");
    print("1) ${this.true_data} correct questions");
    print("2) ${this.false_data} wroung questions");
    print("--------------------------------------");
  }

  Map<String,bool> get_random_questions(int num_questions){
    List<int> indices = this._get_special_random_numbers
    (this.data.length,num_questions);
    Map<String,bool> random_questions = {};
    int curr_index = 0;
    for(String question in this.data.keys){
      if(indices.contains(curr_index)){
        random_questions[question] = this.data[question];
      }
      curr_index++;
    }
    return random_questions;
  }

  List<int> _get_special_random_numbers(int range,int num_nums){
    List<int> random_nums = [];
    Random random = new Random();
    while(random_nums.length != num_nums){
      int random_num = random.nextInt(range);
      if(!random_nums.contains(random_num)){
        random_nums.add(random_num);
      }
    }
    return random_nums;
  }

  void print_questions(Map<String,bool> questions){
      print("(( Number of questions is ${questions.length} ))");
      for(String q in questions.keys){
      print(q);
      print(questions[q]);
      print("-------------------------");
    }
  }

}



//void main(List<String> args) {
//  DataBase db = new DataBase();
//  db.print_info();
//  int question_num = 5; // number of questions per quiz
//  Map<String,bool> quiz_questions = db.get_random_questions(question_num);
//  db.print_questions(quiz_questions);
//}










