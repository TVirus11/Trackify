import 'package:flutter/material.dart';
import 'package:trackify/widgets/expenses_list/expenses_list.dart';
import 'package:trackify/widgets/new_expense.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 1350,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 150,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trackify',
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text(
            'Chart',
          ),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
