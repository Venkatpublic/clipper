import 'package:flutter/material.dart';

class ResultAnswer extends StatelessWidget {
  const ResultAnswer({super.key, this.data});
  final List<Map<String, Object>>? data;

  @override
  Widget build(BuildContext context) {
    final items = data ?? [];
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: items
                .map(
                  (item) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 11,
                        backgroundColor: item['answer'] == item['user_answer']
                            ? Colors.blueAccent
                            : Colors.purpleAccent,
                        child: Text(
                          ((item['index'] as int) + 1).toString(),
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['question'] as String,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              item['user_answer'] as String,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.purple),
                            ),
                            Text(
                              item['answer'] as String,
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
