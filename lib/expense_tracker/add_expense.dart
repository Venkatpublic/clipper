import 'package:clipper/expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category selectedCat = Category.leisure;
  DateTime? selectedDate;
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _opendateModal() async {
    DateTime now = DateTime.now();
    DateTime start = DateTime(now.year - 1, now.month, now.day);
    var userChoice = await showDatePicker(
      context: context,
      firstDate: start,
      lastDate: now,
    );
    setState(() {
      selectedDate = userChoice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                    prefixText: '\$',
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      selectedDate == null
                          ? 'No Date Selected'
                          : formatter.format(selectedDate!),
                    ),
                    IconButton(
                      onPressed: _opendateModal,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: selectedCat,
                items: Category.values.map((cat) {
                  return DropdownMenuItem(
                    child: Text(cat.name.toUpperCase()),
                    value: cat,
                  );
                }).toList(),
                onChanged: (val) {
                  if (val == null) {
                    return;
                  }
                  setState(() {
                    selectedCat = val;
                  });
                },
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Submit')),
            ],
          ),
        ],
      ),
    );
  }
}
