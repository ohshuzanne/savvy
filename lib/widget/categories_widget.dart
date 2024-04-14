import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/screen/categories_details_screen.dart';
import 'package:savvy/utils/categories.dart';
import 'package:savvy/utils/utilities.dart';
import 'package:savvy/utils/colors.dart';

import '../CRUD/expenses.dart';

class CategoriesWidget extends StatefulWidget {
  final String cat;
  const CategoriesWidget({super.key, required this.cat});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  String getTotal(List expenseList) {
    double total = 0;
    for (Expenses i in expenseList) {
      if (i.timestamp.month == DateTime.now().month &&
          i.category == widget.cat) {
        total += i.amount.toDouble();
      }
    }
    return (total).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: ExpensesController()
            .expensesCollection
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var expenses = snapshot.data!.docs.map((doc) {
              return Expenses.expensesFromSnap(doc);
            }).toList();
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => CategoriesDetails(
                          cat: widget.cat,
                        )));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: Container(
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
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 0, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          getIcons(widget.cat),
                          size: 30,
                          color: primaryPurple,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            widget.cat,
                            style: GoogleFonts.lexend(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text("RM " + getTotal(expenses), style: GoogleFonts.lexend(fontSize :15)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }});


  }
}
