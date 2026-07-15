import 'package:flutter/material.dart';

class Roweer extends StatefulWidget {
  const Roweer({super.key});

  @override
  State<Roweer> createState() => _RoweerState();
}

class _RoweerState extends State<Roweer> {
  int age = 2;
  void something() {
    setState(() {
      age = age < 30 ? age + 1 : 26;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Text('name : '),
              Expanded(child: SizedBox()),
              Text('venkat'),
            ],
          ),
          Row(children: [Text('age : '), Text('$age')]),

          for (int i = 0; i <= age; i++)
            Container(
              color: Colors.blue,
              height: 10,
              width: 10,
              margin: EdgeInsets.all(10),
            ),
          FilledButton(onPressed: something, child: Text('wefwqfqwf')),
        ],
      ),
    );
  }
}
