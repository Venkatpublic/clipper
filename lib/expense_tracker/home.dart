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
    Expense(amount: 100000, category: Category.leisure, title: 'Bale trip'),
  ];
  void openAddExpensePage() {
    showModalBottomSheet(context: context, builder: (cxt) => Text('hellp'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: openAddExpensePage, icon: Icon(Icons.add)),
        ],
      ),

      body: Column(
        children: [
          Text('Chart'),
          Expanded(child: ExpenseList(expenses: expenseHistory)),
        ],
      ),
    );
  }
}
