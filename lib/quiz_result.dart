import 'package:clipper/data/quiz.dart';
import 'package:clipper/result_answer.dart';
import 'package:flutter/material.dart';

class QuizResult extends StatefulWidget {
  const QuizResult({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });
  final List<String> chosenAnswers;
  final void Function() onRestart;
  List<Map<String, Object>> getResultSummary() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'index': i,
        'user_answer': chosenAnswers[i],
        'question': questions[i].question,
        'answer': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  List<Map<String, Object>>? data;
  int totalUestion = questions.length;
  int? correctAnswers;
  @override
  void initState() {
    // TODO: implement initState
    data = widget.getResultSummary();
    correctAnswers = data?.where((item) {
      return item['user_answer'] == item['answer'];
    }).length;
    print(data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $correctAnswers out of ${questions.length} correctly',
            style: TextStyle(
              color: const Color.fromARGB(252, 233, 160, 246),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          ResultAnswer(data: data),
          SizedBox(height: 20),
          TextButton.icon(
            onPressed: () {
              widget.onRestart();
            },
            label: Text('Restart Quiz!'),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.refresh_outlined),
          ),
        ],
      ),
    );
  }
}
