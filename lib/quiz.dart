import 'package:clipper/quiz_screen.dart';
import 'package:clipper/quiz_splash.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? currentScreen;
  @override
  void initState() {
    // TODO: implement initState
    currentScreen = QuizSplash(switchScreen: switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      currentScreen = QuizScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.deepPurple, body: currentScreen),
    );
  }
}
