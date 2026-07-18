import 'package:clipper/expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses});
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, i) => Card(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 12,
            bottom: 12,
          ),
          child: Column(
            children: [
              Text(expenses[i].title),
              Row(
                children: [
                  Text('\$${expenses[i].amount}'),
                  Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expenses[i].category]),
                      SizedBox(width: 10),
                      Text(expenses[i].date),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
