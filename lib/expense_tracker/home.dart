import 'package:clipper/expense_tracker/expense_list.dart';
import 'package:clipper/expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Expense> expenseHistory = [
    Expense(amount: 100, category: Category.travel, title: 'Bike petrol'),
    Expense(amount: 150, category: Category.food, title: 'lunch'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(131, 68, 137, 255),
      body: Column(
        children: [
          Text('Chart'),
          Expanded(child: ExpenseList(expenses: expenseHistory)),
        ],
      ),
    );
  }
}
