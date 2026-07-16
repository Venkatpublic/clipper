import 'package:clipper/dice_container.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});
  const GradientContainer.purple({super.key})
    : colors = const [Colors.purpleAccent, Color.fromARGB(255, 247, 200, 255)];
  final List<Color> colors;
  void onRoll() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomRight,
        ),
      ),
      child: Center(child: DiceContainer()),
    );
  }
}
