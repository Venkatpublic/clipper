import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onAnswer});
  final String answer;
  final Function() onAnswer;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(answer, style: TextStyle(color: Colors.white)),
      onPressed: onAnswer,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(89, 72, 65, 85),
        padding: EdgeInsets.only(left: 40, right: 40),
      ),
    );
  }
}
