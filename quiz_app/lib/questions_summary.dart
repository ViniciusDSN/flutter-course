import 'package:flutter/material.dart';
import 'package:quiz_app/results_text.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final bool isCorrect =
                data['user_answer'] == data['correct_answer'];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 25),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isCorrect ? Icons.check : Icons.close,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 5),
                      ResultsText(
                        data['user_answer'] as String,
                        Colors.grey,
                        TextAlign.left,
                      ),
                      ResultsText(
                        data['correct_answer'] as String,
                        Colors.green,
                        TextAlign.left,
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: Colors.white70,
                        thickness: 1.5,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}