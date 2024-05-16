import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizly/data/questions.dart';
import 'package:quizly/questions_screen.dart';
import 'package:quizly/start_screen.dart';
import 'package:quizly/result_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

List<String> selcetedAnswer=[];

var activeScreen='start-Screen';

 void switchScreen(){
  setState(() {
    activeScreen= 'question-Screen';
  });
 }

 void chooseAnswer(String answer){
  selcetedAnswer.add(answer);

  if(selcetedAnswer.length== questions.length){
    setState(() {
     
      activeScreen='result-Screen';
    });
  }
 }

 


  @override
  Widget build(BuildContext context) {

    Widget screenWidget= StartScreen(switchScreen);

    if(activeScreen=='question-Screen'){
      screenWidget= QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if(activeScreen=='result-Screen'){
      screenWidget= ResultScreen(
        chooseAnswer:selcetedAnswer,    
        );
    }
    
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        body: Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 11, 239, 255),
                Color.fromARGB(255, 219, 254, 253),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ), 
          child: screenWidget,
      ),
      ),
    );
  }
}