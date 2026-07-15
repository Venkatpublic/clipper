import 'package:flutter/material.dart';

class Roweer extends StatelessWidget {
  const Roweer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(children: [Text('name : '), Text('venkat')]),
        Row(children: [Text('age : '), Text('24')]),
      ],
    );
  }
}
