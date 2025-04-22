import 'package:flutter/material.dart';
import 'gradient_container.dart';
import 'home_screen.dart';
import 'questions_screen.dart';
import 'data/questions.dart';
import 'results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? currentScreen;
  List<String> selectedAnswers = []; 

  @override
  void initState() {
    currentScreen = HomeScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      currentScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      currentScreen = HomeScreen(switchScreen);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        currentScreen = ResultsScreen(chosenAnswers: selectedAnswers, restartQuiz);
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors: [Colors.black54, Colors.black87],
          screen: currentScreen,
        ),
      ),
    );
  }
}