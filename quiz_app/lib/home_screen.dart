import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: Color.fromARGB(180, 255, 255, 255),
        ),
        const SizedBox(height: 20),
        const StyledText(
          'Learn Flutter the fun way!',
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white70,
            textStyle: const TextStyle(fontSize: 20),
            side: const BorderSide(color: Colors.white70, width: 2),
          ),
          icon: Icon(Icons.double_arrow_rounded),
          label: const Text('Start Quiz'),
        ),
      ],
    );
  }
}