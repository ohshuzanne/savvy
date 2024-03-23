import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:savvy/dummy.dart';

class MonthDropdown extends StatefulWidget {
  const MonthDropdown({super.key});

  @override
  State<MonthDropdown> createState() => _MonthDropdownState();
}

class _MonthDropdownState extends State<MonthDropdown> {
  String selectedMonth = DateFormat("MMM y").format(DateTime.now());
  List<String> availableMonth = [];



  List<String> getList() {
    double total = 0;
    for (Map i in expenseList) {
      if (!availableMonth.contains(DateFormat
          ("MMM y")
          .format(DateTime
          .parse(i['date']))
      )) {
        availableMonth.add(DateFormat
            ("MMM y")
            .format(DateTime
            .parse(i['date']))) ;
      }
      print(availableMonth);
    }
    return availableMonth;
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item, style: GoogleFonts.lexend(color: Colors.black, fontSize:15)));

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: selectedMonth,
        items: getList().map(buildMenuItem).toList(),
        onChanged: (value) =>
            setState(() {
              selectedMonth = value!;
            }));
  }
}
