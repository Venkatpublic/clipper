import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.content, {super.key, double size = 24})
    : font_size = size;
  final String content;
  final double font_size;
  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(color: Colors.white, fontSize: font_size),
    );
  }
}
