import 'package:flutter/material.dart';
import 'package:savvy/screen/create_expenses_screen.dart';
import 'package:savvy/utils/utilities.dart';

import '../CRUD/expenses.dart';

class CreateButton extends StatefulWidget {
  const CreateButton({super.key});

  @override
  State<CreateButton> createState() => _CreateButtonState();
}

class _CreateButtonState extends State<CreateButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, right: 20),
      child: FloatingActionButton(

        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: mainPurple,
          onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => CreateExpenses(expenses: Expenses.empty(),)));
      }),
    );
  }
}
