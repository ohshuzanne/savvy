import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:savvy/screen/budget_screen.dart';

import '../dummy.dart';

class TotalExpenses extends StatefulWidget {
  const TotalExpenses({super.key});


  @override
  State<TotalExpenses> createState() => _TotalExpensesState();
}

class _TotalExpensesState extends State<TotalExpenses> {




  String getTotal() {
    double total = 0;
    for (Map i in expenseList) {
      if (DateTime
          .parse(i['date'])
          .month == DateTime
          .now()
          .month) {
        total += i['amount'].toDouble();
      }
    }
    return (total).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.push(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  BudgetScreen()));},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Total Expenses", style: GoogleFonts.lexend(color: Colors.black)),
                        Text("/Budget",style: GoogleFonts.lexend(color: Colors.black, fontSize: 8))
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("RM ${getTotal()}", style: TextStyle(fontSize: 25),),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 7.0),
                          child: Text("/RM $budget", style: TextStyle(fontSize: 12),),
                        ),
                      ],
                    ),

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
