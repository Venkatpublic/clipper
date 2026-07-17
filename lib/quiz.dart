import 'package:clipper/data/quiz.dart';
import 'package:clipper/quiz_result.dart';
import 'package:clipper/quiz_screen.dart';
import 'package:clipper/quiz_splash.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> answers = [];
  Widget? currentScreen;
  @override
  void initState() {
    currentScreen = QuizSplash(switchScreen: switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      currentScreen = QuizScreen(onAnswer: onAnswer);
    });
  }

  void onAnswer(String answer) {
    answers.add(answer);
    if (answers.length == questions.length) {
      setState(() {
        currentScreen = QuizResult(
          chosenAnswers: answers,
          onRestart: onRestart,
        );
      });
    }
  }

  void onRestart() {
    setState(() {
      currentScreen = QuizSplash(switchScreen: switchScreen);
      answers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.deepPurple, body: currentScreen),
    );
  }
}
