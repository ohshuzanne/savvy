import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:savvy/utils/color.dart';

import '../utils/categories.dart';

class CreateExpenses extends StatefulWidget {
  const CreateExpenses({super.key});

  @override
  State<CreateExpenses> createState() => _CreateExpensesState();
}

class _CreateExpensesState extends State<CreateExpenses> {
  DateTime selectedDay = DateTime.now();
  int selectedIndex = 0;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void selectCat(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (ctx) =>
        Container(width: double.infinity, child:Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: cats.length,
            itemBuilder: (context, index) {
              int _selectedIndex = selectedIndex;
              String cat = cats[index];
              Key tileKey = Key(cat);
              return ListTile(
                  title: Text(
                    cat,
                    style: GoogleFonts.lexend(
                      color: index == _selectedIndex ? mainPurple : Colors.black,
                    ),
                  ),
                  selected: index == _selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  });
            },
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Expenses",
          style: GoogleFonts.lexend(color: Colors.black),
        ),
        toolbarHeight: 80,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.only(right: 25.0, left: 25, bottom: 20, top: 10),
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
                          borderSide: BorderSide(color: Colors.grey)),
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
                    borderRadius: BorderRadius.circular(5),
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

                                initialDate: DateTime.now()).then((value) =>
                                setState(() {
                                  selectedDay = DateTime(
                                      value!.year, value.month, value.day,
                                      selectedDay.hour, selectedDay.minute);
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
                                context: context, initialTime: TimeOfDay.now())
                                .then((value) =>
                                setState(() {
                                  selectedDay = DateTime(
                                      selectedDay.year, selectedDay.month,
                                      selectedDay.day, value!.hour,
                                      value.minute);
                                }));
                          },
                        ),
                      ],
                    ),
                  ),
                ), SizedBox(height: 20,),
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
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text("${cats[selectedIndex]}", style: GoogleFonts.lexend(fontSize:15),),),
                  onTap: (){
                    selectCat(context);
                  }
                    ),


                SizedBox(height: 20,),
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
                          borderSide: BorderSide(color: Colors.grey)),
                      contentPadding: EdgeInsets.all(15),
                      hintText: "Ex: 20",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _amountController.clear();
                        },
                      )),
                ),
                SizedBox(height: 200,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Cancel", style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w500, fontSize: 17),),
                    SizedBox(width: 30,),
                    Text("Create",  style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w500, fontSize: 17)),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
