import 'package:flutter/material.dart';
import 'package:quizly/answerButton.dart';
import 'package:quizly/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex=0;

  void answerQuestion(String selcetedAnswer){
    widget.onSelectAnswer(selcetedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }


  @override
  Widget build(BuildContext context) {

    final currentQuestion=questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(currentQuestion.text,
             style: GoogleFonts.lato(
              color:  const Color.fromARGB(255,64,64,64),
              fontSize:24,
              fontWeight: FontWeight.bold,
             ),
             textAlign: TextAlign.center,
             ),
            const SizedBox(
              height: 30,
            ),
           ...currentQuestion.getShuffeldAnswer().map((answer){
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: AnswerButton(answerText: answer, onTap: (){
                answerQuestion(answer);
              }),
            );
           })
          ],
        ),
      ),
    );
  }
}
