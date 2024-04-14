import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:savvy/utils/categories.dart';
import 'package:savvy/utils/color.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/widget/transaction_log.dart';

import '../CRUD/expenses.dart';
import '../provider/user_provider.dart';

class PieChartWidget extends StatefulWidget {

  const PieChartWidget({super.key,});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  DateTime selectedMonth = DateTime.now();
  List<DateTime> selectedDate = [];
  double total = 0;

  double getCatTotal(String cat, List expenseList) {
    double total = 0;
    for (Expenses i in expenseList) {
      if (i.timestamp.month == selectedMonth.month &&
          i.category == cat) {
        total += i.amount.toDouble();
      }
    }
    return total;
  }

  void getTotal(List expenseList) {
    total = 0;
    for (Expenses i in expenseList) {
      if (i.timestamp.month == selectedMonth.month) {
        total += i.amount.toDouble();
      }
    }
  }

  List<Map> getPercentage(List expenseList) {
    List<Map> percentage = [];
    for (String i in cats) {
      double percent = getCatTotal(i,expenseList) / total * 100;
      if (!(percent > 0)){
        percent = 0;}
      percentage.add({'cat': i, 'percentage': percent.roundToDouble()});
    }
    int lastDay = DateTime(selectedMonth.year, selectedMonth.month+1, 0).day;
    selectedDate.clear();
    for (int n=1; n <= lastDay; n++){
      selectedDate.add(DateTime(selectedMonth.year, selectedMonth.month,n));
    }
    percentage.sort((a, b) => (b!['percentage']).compareTo(a!['percentage']));
    return percentage;
  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onS
      child: Consumer<UserProvider>(builder: (context,data,child) {
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
                getTotal(expenses);
                List<Map> percentage = getPercentage(expenses);
                return Column(
                  children: [
                    Stack(alignment: Alignment.center, children: [
                      Center(
                        child: Text(
                          "RM " + total.toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 1.3,
                        child: Stack(
                          children: [PieChart(PieChartData(
                              startDegreeOffset: 180,
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 2,
                              centerSpaceRadius: 40,
                              sections: List.generate(
                                  total ==0? 1:4,
                                      (index) => PieChartSectionData(
                                      titlePositionPercentageOffset: 1.3,
                                      titleStyle: TextStyle(fontWeight: FontWeight.w500),
                                      title: "${percentage[index]['percentage']} % ",
                                      badgeWidget: Icon(
                                        getIcons(percentage[index]['cat']),
                                        color: darkGrey.withOpacity(0.8),
                                        size: 18,
                                      ),
                                      radius: 80,
                                      color: darkBlue.withOpacity(0.2 * (cats.length - index)),
                                      value: total==0? 100:percentage[index]['percentage'])))),
                            total == 0? BackdropFilter(
                              filter: ImageFilter.blur(
                                  sigmaX: 10.0, sigmaY: 10.0),
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                              ),
                            ): SizedBox()]
                        ),
                      )
                    ]),
                    SizedBox(height: 40,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedMonth = DateTime(selectedMonth.year, selectedMonth.month-1);
                              });
                            },
                            child: Icon(Icons.arrow_back_ios_new_rounded)),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: 120,
                          child: Center(
                            child: Text(
                              "${DateFormat('MMM y').format(selectedMonth)}",
                              style: GoogleFonts.lexend(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedMonth = DateTime(selectedMonth.year, selectedMonth.month+1);
                              });
                            },
                            child: Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                    TransactionLog(selectedDate: selectedDate,)],
                );
              }});

      },),
    );

    // List<Map> percentage = getPercentage();
    // percentage.sort((a, b) => (a['percentage']).compareTo(b['percentage']));
    // return Stack(alignment: Alignment.center, children: [
    //   Center(
    //     child: Text(
    //       "RM " + widget.total.toStringAsFixed(2),
    //       style: TextStyle(fontSize: 12),
    //     ),
    //   ),
    //   AspectRatio(
    //     aspectRatio: 1.3,
    //     child: PieChart(PieChartData(
    //         startDegreeOffset: 180,
    //         borderData: FlBorderData(
    //           show: false,
    //         ),
    //         sectionsSpace: 2,
    //         centerSpaceRadius: 40,
    //         sections: List.generate(
    //             4,
    //             (index) => PieChartSectionData(
    //                 titlePositionPercentageOffset: 1.3,
    //                 titleStyle: TextStyle(fontWeight: FontWeight.w500),
    //                 title: "${percentage[index]['percentage']} % ",
    //                 badgeWidget: Icon(
    //                   getIcons(percentage[index]['cat']),
    //                   color: darkGrey.withOpacity(0.8),
    //                   size: 18,
    //                 ),
    //                 radius: 80,
    //                 color: darkBlue.withOpacity(0.2 * (cats.length - index)),
    //                 value: percentage[index]['percentage'])))),
    //   )
    // ]);
  }
}
