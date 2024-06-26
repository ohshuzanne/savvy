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

final String? geminiAPIKey = dotenv.env['GeminiAPIKey'];


class CreateExpenses extends StatefulWidget {
  final bool isUpdate;
  final Expenses expenses;

  const CreateExpenses(
      {super.key, this.isUpdate = false, required this.expenses});

  @override
  State<CreateExpenses> createState() => _CreateExpensesState();
}

class _CreateExpensesState extends State<CreateExpenses> {
  DateTime selectedDay = DateTime.now();
  int selectedIndex = 0;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if (widget.isUpdate) {
        _titleController.text = widget.expenses.title;
        _amountController.text = widget.expenses.amount.toString();
        selectedDay = widget.expenses.timestamp;
        selectedIndex =
            cats.indexWhere((element) => element == widget.expenses.category);
      }
    });
  }
  final model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: geminiAPIKey!,
  );


  Future<GenerateContentResponse> validateCategory(String title) async {
    final prompt = 'You are a worker in a finance company..'
        'You have been given title of expenses: $title.'
        'Determine which category are the expenses belong to with the provided choices including Foods, Shopping, Transports, and Others .'
        'Some of the example of transport can be grab, lrt, brt, ktm, ets, and any title related to bus'
        'Provide your response as a JSON object with the following schema: {"category": category of item}.'
        'Do not return your result as Markdown.';

    final response = await model.generateContent([
      Content.text(prompt),
    ]);
    print(response);
    return response;
  }

  Future<String?> _onCategory(String title) async {
    Map result = {};
    final category = await validateCategory(title);
    final response =
        category.text!.replaceAll("```json", "").replaceAll("```", "");
    result = json.decode(response);
    setState(() {
      print(result);
      switch (result['category']) {
        case ("Foods"):
          {
            selectedIndex = 0;
            break;
          }
        case ("Transports"):
          {
            selectedIndex = 1;
            break;
          }
        case ("Shopping"):
          {
            selectedIndex = 2;
            break;
          }
        default:
          {
            selectedIndex = 3;
            break;
          }
      }
    });
    return null;
  }

  void selectCat(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => StatefulBuilder(
              builder: (BuildContext context,
                      StateSetter setModalState /*You can rename this!*/) =>
                  Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                          itemCount: cats.length,
                          itemBuilder: (context, index) {
                            String cat = cats[index];
                            Key tileKey = Key(cat);
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  setModalState(() {});
                                });
                              },
                              child: ListTile(
                                title: Text(
                                  cat,
                                  style: GoogleFonts.lexend(
                                    color: index == selectedIndex
                                        ? mainPurple
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )),
            ));
  }

  createTransaction() {
    Expenses newExpenses = Expenses(
        id: widget.isUpdate ? widget.expenses.id : "",
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        timestamp: selectedDay,
        category: cats[selectedIndex]);
    widget.isUpdate
        ? ExpensesController().editExpenses(newExpenses)
        : ExpensesController().createExpenses(newExpenses);
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
            "New Expenses",
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
                        onChanged: (String title) {
                          setState(() {
                            _onCategory(title);
                          });
                        },
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
                            hintText: "Ex: Fried Chicken",
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
                        "Category",
                        style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Text(
                              "${cats[selectedIndex]}",
                              style: GoogleFonts.lexend(fontSize: 15),
                            ),
                          ),
                          onTap: () {
                            selectCat(context);
                          }),
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
                          hintText: "Ex: 20",
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
                        height: 200,
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
