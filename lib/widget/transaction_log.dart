import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:savvy/CRUD/expenses.dart';
import 'package:savvy/utils/categories.dart';
import 'package:savvy/utils/color.dart';

class TransactionLog extends StatefulWidget {
  final bool isLatest;
  final String isCat;
  final List date;

  TransactionLog({
    super.key,
    this.isLatest = false,
    this.isCat = "false",
    List? selectedDate,
  }) : date = selectedDate ?? [];

  @override
  State<TransactionLog> createState() => _TransactionLogState();
}

class _TransactionLogState extends State<TransactionLog> {
  String previousDate = "";
  bool isSameDay = false;

  Padding getLog(Expenses transaction) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(

              onPressed: (context) {},
              icon: Icons.edit,
              backgroundColor: subPurple,
            ),
            SlidableAction(
              onPressed: (context) {},
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            )
          ],
        ),
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
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      getIcons(transaction.category),
                      color: Color(0xff7A7D79),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.title,
                            style: GoogleFonts.lexend(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(DateFormat('d MMM y')
                                .format(transaction.timestamp)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Text("RM " + transaction.amount.toStringAsFixed(2)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // List<Map> transactionLog = new List<Map>.from(expenseList);
    // if (widget.isCat != "false") {
    //   List<Map> catList = [];
    //   for (Map i in expenseList) {
    //     if (i['categories'] == widget.isCat) {
    //       catList.add(i);
    //     }
    //   }
    //   transactionLog = catList;
    // } else if (widget.date.isNotEmpty) {
    //   List date = widget.date;
    //   List<Map> budgetList = [];
    //   for (DateTime j in date) {
    //     for (Map i in expenseList) {
    //       if (j.day == DateTime.parse(i['date']).day &&
    //           j.month == DateTime.parse(i['date']).month &&
    //           j.year == DateTime.parse(i['date']).year) {
    //         budgetList.add(i);
    //       }
    //     }
    //   }
    //   transactionLog = budgetList;
    // }
    return StreamBuilder(
        stream: ExpensesController().expensesCollection.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var expenses = snapshot.data!.docs.map((doc) {
              return Expenses.expensesFromSnap(doc);
            }).toList();

            expenses.sort((a, b) => (b!.timestamp).compareTo(a!.timestamp));


            return (expenses.isEmpty)
                ? const Center(child: Text("No record is available!"))
                : ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.isLatest? 10: expenses.length,
              itemBuilder: (context, index) {
                Expenses transaction = expenses[index];
                Key tileKey = Key(snapshot.data!.docs[index].id);
                return widget.isLatest
                        ? getLog(transaction)
                        : isSameDay
                            ? getLog(transaction)
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                                    child: Text(
                                      DateFormat('d MMM y')
                                          .format(transaction.timestamp),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: darkColor),
                                    ),
                                  ),
                                  getLog(transaction)
                                ],
                              );
              },
            );
          }
        });

    // return ListView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   itemCount: widget.isLatest ? 10 : transactionLog.length,
    //   itemBuilder: (context, index) {
    //     transactionLog.sort((a, b) => (DateTime.parse(b['date'].toString()))
    //         .compareTo(DateTime.parse(a['date'].toString())));
    //     var transaction = transactionLog[index];
    //     isSameDay = previousDate == transaction['date'];
    //     previousDate = transaction['date'];
    //     return widget.isLatest
    //         ? getLog(transaction)
    //         : isSameDay
    //             ? getLog(transaction)
    //             : Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(top: 20.0, bottom: 5),
    //                     child: Text(
    //                       DateFormat('d MMM y')
    //                           .format(DateTime.parse(transaction['date'])),
    //                       style: TextStyle(
    //                           fontSize: 15,
    //                           fontWeight: FontWeight.w500,
    //                           color: darkColor),
    //                     ),
    //                   ),
    //                   getLog(transaction)
    //                 ],
    //               );
    //   },
    // );
  }
}
