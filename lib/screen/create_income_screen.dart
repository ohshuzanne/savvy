import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'package:savvy/utils/color.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/CRUD/expenses.dart';

import '../utils/categories.dart';


class CreateIncome extends StatefulWidget {
  final bool isUpdate;

  const CreateIncome(
      {super.key, this.isUpdate = false});

  @override
  State<CreateIncome> createState() => _CreateIncomeState();
}

class _CreateIncomeState extends State<CreateIncome> {
  DateTime selectedDay = DateTime.now();
  int selectedIndex = 0;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();


  createTransaction() {
    // Expenses newExpenses = Expenses(
    //     id: widget.isUpdate ? widget.expenses.id : "",
    //     title: _titleController.text,
    //     amount: double.parse(_amountController.text),
    //     timestamp: selectedDay,
    //     category: cats[selectedIndex]);
    // widget.isUpdate
    //     ? ExpensesController().editExpenses(newExpenses)
    //     : ExpensesController().createExpenses(newExpenses);
    showSnackBar(widget.isUpdate? "Record updated":"Record created", context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        showBackDialog(widget.isUpdate? "Discard changes and leave?":'Discard record and leave?', context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "New Income",
            style: TextStyle(
              fontFamily: 'Lexend',
              fontSize: 18,
              color: darkGrey,
            ),
          ),
          toolbarHeight: 80,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    right: 25.0, left: 25, bottom: 20, top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: GoogleFonts.lexend(),
                        controller: _titleController,
                        maxLines: 1,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            contentPadding: EdgeInsets.all(15),
                            hintText: "Ex: Salary",
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                _titleController.clear();
                              },
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Date",
                        style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              GestureDetector(
                                child: Text(
                                  "${DateFormat("d/M/y").format(selectedDay)}",
                                  style: GoogleFonts.lexend(fontSize: 15),
                                ),
                                onTap: () {
                                  showDatePicker(
                                      firstDate: DateTime(1985),
                                      lastDate: DateTime(2050),
                                      context: context,
                                      initialDate: DateTime.now())
                                      .then((value) => setState(() {
                                    selectedDay = DateTime(
                                        value!.year,
                                        value.month,
                                        value.day,
                                        selectedDay.hour,
                                        selectedDay.minute);
                                  }));
                                },
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                child: Text(
                                  "${DateFormat("H:mm").format(selectedDay)}",
                                  style: GoogleFonts.lexend(fontSize: 15),
                                ),
                                onTap: () {
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                      .then((value) => setState(() {
                                    selectedDay = DateTime(
                                        selectedDay.year,
                                        selectedDay.month,
                                        selectedDay.day,
                                        value!.hour,
                                        value.minute);
                                  }));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Amount",
                        style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        textAlignVertical: TextAlignVertical.center,
                        style: GoogleFonts.lexend(),
                        controller: _amountController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          icon: Text(" RM"),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Ex: 4000",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              _amountController.clear();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 300,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showBackDialog(
                                  'Discard record and leave?', context);
                            },
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            onTap:createTransaction,
                            child: Text(
                                widget.isUpdate ? "Save Changes" : "Create",
                                style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w500, fontSize: 17)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
