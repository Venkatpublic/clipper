import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class DiceContainer extends StatefulWidget {
  const DiceContainer({super.key});

  @override
  State<DiceContainer> createState() => _DiceContainerState();
}

class _DiceContainerState extends State<DiceContainer> {
  var currentDice = 1;
  void onRoll() {
    setState(() {
      currentDice = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/dice-$currentDice.png', height: 200, width: 200),
        SizedBox(height: 48),
        TextButton(
          style: TextButton.styleFrom(padding: const EdgeInsets.all(12)),
          onPressed: onRoll,
          child: Text(
            "Roll",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ],
    );
  }
}
