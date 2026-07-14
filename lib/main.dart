import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Clipper"),
          centerTitle: true,
          backgroundColor: const Color(0xFF6D5DF6),
        ),
        body: Text('Hello there!'),
      ),
    ),
  );
}
