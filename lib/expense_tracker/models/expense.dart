import 'package:uuid/uuid.dart';

enum Category { travel, food, leisure, work }

const uuid = Uuid();

class Expense {
  Expense({required this.amount, required this.category, required this.title})
    : id = uuid.v4(),
      date = DateTime.now();
  final int amount;
  final String title;
  final DateTime date;
  final String id;
  final Category category;
}
