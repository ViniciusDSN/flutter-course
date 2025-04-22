import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'questions_summary.dart';
import 'styled_text.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restartQuiz, {super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        }
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final correctQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StyledText(
            'You answered $correctQuestions of $numTotalQuestions questions correctly!',
          ),
          const SizedBox(height: 20),
          QuestionsSummary(summaryData),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: restartQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white70,
              textStyle: const TextStyle(fontSize: 20),
              side: const BorderSide(color: Colors.white70, width: 2),
            ),
            icon: Icon(Icons.refresh_rounded),
            label: const Text('Go to Start Screen'),
          ),
        ],
      ),
    );
  }
}