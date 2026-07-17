import 'package:flutter/material.dart';

class QuizSplash extends StatefulWidget {
  const QuizSplash({super.key, required this.switchScreen});
  final void Function() switchScreen;
  @override
  State<QuizSplash> createState() =>
      _QuizSplashState(switchScreen: switchScreen);
}

class _QuizSplashState extends State<QuizSplash> {
  _QuizSplashState({required this.switchScreen});
  final void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/quiz-logo.png',
            height: 300,
            width: 300,
            color: const Color.fromARGB(143, 255, 255, 255),
          ),
          SizedBox(height: 50),
          Text(
            "Learn Flutter The Fun Way!",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 50),
          OutlinedButton.icon(
            onPressed: switchScreen,
            label: Text('Start Quiz'),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.arrow_right_alt),
          ),
        ],
      ),
    );
  }
}
