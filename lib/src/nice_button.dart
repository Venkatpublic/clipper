import 'package:flutter/material.dart';

class NiceButton extends StatelessWidget {
  const NiceButton({super.key, required this.title, required this.onpress});
  final Widget title;
  final void Function() onpress;
  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: onpress, child: title);
  }
}
