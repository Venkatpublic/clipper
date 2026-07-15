import 'package:clipper/src/dand.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clipper"),
        centerTitle: true,
        backgroundColor: const Color(0xFF6D5DF6),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.red,
            width: 50,
            child: Text('One'),
            alignment: Alignment.center,
          ),
          Container(
            color: Colors.indigo,
            width: 100,
            child: Text('Two'),
            alignment: Alignment.center,
          ),
          Container(
            color: Colors.grey,
            width: 200,
            child: Text('Three'),
            alignment: Alignment.center,
          ),
          Roweer(),

          Image.asset(
            'assets/img/catm.jpg',
            width: 50,
            height: 100,
            color: Colors.grey,
            colorBlendMode: BlendMode.multiply,
          ),
          Image.asset(
            'assets/img/cat_new.jpeg',
            color: Colors.grey,
            colorBlendMode: BlendMode.multiply,
          ),
        ],
      ),
    );
  }
}
