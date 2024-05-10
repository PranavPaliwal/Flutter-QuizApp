import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.takeQuiz, {super.key});

  final void Function() takeQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 275,
            color: const Color.fromARGB(141, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          const Text(
            'Discover Flutter the Fun and Easy Way..!',
            style: TextStyle(
              fontFamily: 'CeraPro',
              color: Color.fromARGB(255, 64, 64, 64),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 25),

          OutlinedButton.icon(onPressed: takeQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor:  const Color.fromARGB(255,64,64,64),
          ),
          icon:const Icon(Icons.arrow_right_alt),
          
           label:const Text('Take Quiz'))
        ],
      ),
    );
  }
}
