import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Category { travel, food, leisure, work }

const uuid = Uuid();
DateFormat formatter = DateFormat.yMd();
const categoryIcons = {
  Category.travel: Icons.travel_explore,
  Category.food: Icons.hotel,
  Category.leisure: Icons.cake,
  Category.work: Icons.work,
};

class Expense {
  Expense({required this.amount, required this.category, required this.title})
    : id = uuid.v4(),
      date = formatter.format(DateTime.now());
  final int amount;
  final String title;
  final String date;
  final String id;
  final Category category;
}
