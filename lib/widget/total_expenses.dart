import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:savvy/CRUD/expenses.dart';
import 'package:savvy/provider/user_provider.dart';
import 'package:savvy/screen/budget_screen.dart';
import 'package:savvy/utils/color.dart';

class TotalExpenses extends StatefulWidget {
  const TotalExpenses({super.key});

  @override
  State<TotalExpenses> createState() => _TotalExpensesState();
}

class _TotalExpensesState extends State<TotalExpenses> {
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    getBudget();
  }


  void getBudget() async {
    setState(() {
      _isLoading = true;
    });
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(Provider.of<UserProvider>(context, listen: false).userId)
        .get();

    setState(() {
      _isLoading = false;
      Provider.of<UserProvider>(context, listen: false).setBalance((snap.data() as Map<String, dynamic>)['balance'],null);
      Provider.of<UserProvider>(context, listen: false).setIncome((snap.data() as Map<String, dynamic>)['monthlyIncome'].toDouble());

    });
  }


  String getTotal(List expensesList) {
    double total = 0;
    for (Expenses i in expensesList) {
      if (i.timestamp.month == DateTime.now().month) {
        total += i.amount;
      }
    }
    Provider.of<UserProvider>(context, listen: false).setTotal(total);
    return (total).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ExpensesController()
            .expensesCollection
            .where('timestamp',
                isGreaterThanOrEqualTo:
                    DateTime(DateTime.now().year, DateTime.now().month, 1),
                isLessThanOrEqualTo:
                    DateTime(DateTime.now().year, DateTime.now().month+1, 0))
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
                builder: (BuildContext context) => BudgetScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 25, left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Total Expenses",
                                style: GoogleFonts.lexend(color: Colors.black)),
                            Text("/Budget",
                                style: GoogleFonts.lexend(
                                    color: Colors.black, fontSize: 8))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "RM ${getTotal(expenses)}",
                              style: GoogleFonts.lexend(fontSize :25),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7.0),
                              child: Consumer<UserProvider>(builder: (context,data,child) {
                                return Text(
                                  "/RM ${data.budget}",
                                  style: GoogleFonts.lexend(fontSize :12),
                                );

                              },),
                            ),
                          ],
                        ),

                        ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top:10, bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Consumer<UserProvider>(builder: (context,data,child) {
                    return LinearPercentIndicator(barRadius: Radius.circular(10),backgroundColor: subPurple,lineHeight: 20,progressColor: mainPurple,percent: (double.parse(getTotal(expenses))/data.budget),);

                  }

                  ),
                ),
              )],
          ),
        ),
      ),
    );
        }});}}




    //   GestureDetector(
    //   onTap: () {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute<void>(
    //             builder: (BuildContext context) => BudgetScreen()));
    //   },
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
    //     child: Container(
    //       width: double.infinity,
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(16),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.grey.withOpacity(0.2),
    //             spreadRadius: 3,
    //             blurRadius: 2,
    //             offset: Offset(0, 3), // changes position of shadow
    //           ),
    //         ],
    //       ),
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Row(
    //                   children: [
    //                     Text("Total Expenses",
    //                         style: GoogleFonts.lexend(color: Colors.black)),
    //                     Text("/Budget",
    //                         style: GoogleFonts.lexend(
    //                             color: Colors.black, fontSize: 8))
    //                   ],
    //                 ),
    //                 SizedBox(
    //                   height: 5,
    //                 ),
    //                 Row(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: [
    //                     Text(
    //                       "RM ${getTotal()}",
    //                       style: TextStyle(fontSize: 25),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(bottom: 7.0),
    //                       child: Text(
    //                         "/RM $budget",
    //                         style: TextStyle(fontSize: 12),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
