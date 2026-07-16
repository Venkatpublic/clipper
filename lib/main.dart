import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/quiz-logo.png', height: 300, width: 300),
              SizedBox(height: 50),
              Text(
                "Learn Flutter The Fun Way!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 50),
              OutlinedButton(onPressed: () {}, child: Text('Start Quiz')),
            ],
          ),
        ),
      ),
    ),
  );
  // runApp(const AutoCropApp());
}
