import 'package:flutter/material.dart';
import 'package:savvy/screen/create_expenses_screen.dart';
import 'package:savvy/screen/create_income_screen.dart';
import 'package:savvy/utils/color.dart';
import 'package:savvy/utils/colors.dart';

import '../CRUD/expenses.dart';

class CreateButton extends StatefulWidget {
  final bool isExpense;
  const CreateButton({super.key, this.isExpense = true});

  @override
  State<CreateButton> createState() => _CreateButtonState();
}

class _CreateButtonState extends State<CreateButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, bottom: 10),
      child: SizedBox(
        height: widget.isExpense?56:30,
        width: widget.isExpense?56:30,
        child: FittedBox(
          child: FloatingActionButton(
            heroTag: widget.isExpense? "fab1":"fab2",
          
            shape: CircleBorder(),
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: widget.isExpense? mainPurple:darkBlue,
              onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => widget.isExpense? CreateExpenses(expenses: Expenses.empty(),):CreateIncome()));
          }),
        ),
      ),
    );
  }
}
