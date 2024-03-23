import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:savvy/dummy.dart';
import 'package:savvy/utils/categories.dart';
import 'package:savvy/utils/color.dart';

class TransactionLog extends StatefulWidget {
  final bool isLatest;
  final String isCat;
  final List date;
  TransactionLog({super.key, this.isLatest = false, this.isCat = "false", List? selectedDate,}) : date = selectedDate ?? [];

  @override
  State<TransactionLog> createState() => _TransactionLogState();
}

class _TransactionLogState extends State<TransactionLog> {
  String previousDate = "";
  bool isSameDay = false;
  
  Container getLog(var transaction){
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(getIcons(transaction['categories']), color: Color(0xff7A7D79),),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transaction['description'], style: GoogleFonts.lexend(color: Colors.black, fontWeight:FontWeight.w500),),

                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(DateFormat('d MMM y')
                            .format(DateTime.parse(transaction['date']))) ,
                      )
                    ],
                  ),
                ),

              ],
            ),Text("RM " + transaction['amount'].toStringAsFixed(2)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map> transactionLog = new List<Map>.from(expenseList);
    if (widget.isCat != "false"){
      List<Map> catList = [];
      for (Map i in expenseList) {
        if (i['categories'] == widget.isCat) {
          catList.add(i);
        }
      }
      transactionLog = catList;
    } else if (widget.date.isNotEmpty){
      List date = widget.date;
      List<Map> budgetList = [];
      for (DateTime j in date){
        for (Map i in expenseList) {
          if (j.day == DateTime.parse(i['date']).day &&
              j.month == DateTime.parse(i['date']).month &&
              j.year == DateTime.parse(i['date']).year) {
            budgetList.add(i);
          }
        }
      }
      transactionLog = budgetList;
    }


    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.isLatest? 10 : transactionLog.length,
      itemBuilder: (context, index) {

        transactionLog.sort((a, b) => (DateTime.parse(b['date'].toString()))
            .compareTo(DateTime.parse(a['date'].toString())));
        var transaction = transactionLog[index];
        isSameDay = previousDate == transaction['date'];
        previousDate = transaction['date'];
        return widget.isLatest? getLog(transaction) : isSameDay? getLog(transaction): Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(DateFormat('d MMM y')
                  .format(DateTime.parse(transaction['date'])), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: darkColor),),
            ),
            getLog(transaction)
          ],
        );
      },
    );

  }
}
