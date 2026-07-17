import 'package:clipper/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:clipper/data/quiz.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int qno = 0;

  void onAnswer() {
    setState(() {
      qno++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[qno];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(answer: item, onAnswer: onAnswer);
            }),
          ],
        ),
      ),
    );
  }
}
