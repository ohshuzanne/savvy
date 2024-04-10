import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:savvy/CRUD/expenses.dart';
import 'package:savvy/utils/color.dart';

class LineChartWidget extends StatefulWidget {
  final String cat;

  const LineChartWidget({super.key, required this.cat});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  double max = 0;
  List<FlSpot> points = [];
  DateTime selectedMonth = DateTime.now();

  double getLastDay() {
    int lastDay = DateTime(selectedMonth.year, selectedMonth.month + 1, 0).day;
    return lastDay.toDouble();
  }

  Map<int, double> getList(List expenseList) {
    Map<int,double> catList = {};
    List<int> temp = [];
    for (Expenses i in expenseList) {
      if (i.category == widget.cat) {
        if(temp.contains(i.timestamp.day)){
          catList[i.timestamp.day] = (catList[i.timestamp.day]!+i.amount)!;
        }else{
          catList[i.timestamp.day] = i.amount;
          temp.add(i.timestamp.day);
        }
        if (i.amount > max) {
          max = i.amount;
        }
      }
    }
    if (max <= 100) {
      max = 100;
    } else if (max <= 250) {
      max = 250;
    } else if (max <= 500) {
      max = 500;
    } else if (max <= 750) {
      max = 750;
    } else if (max <= 1000) {
      max = 1000;
    }
    return catList;
  }

  @override
  Widget build(BuildContext context) {

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
            Map catList = getList(expenses);
            return Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.3,
                  child: LineChart(LineChartData(lineTouchData: LineTouchData(touchTooltipData: LineTouchTooltipData(tooltipBgColor: subPurple)),
                      backgroundColor: subPurple.withOpacity(0.3),
                      borderData: FlBorderData(border: Border.all(color: subPurple)),
                      gridData: FlGridData(
                          horizontalInterval: max /2, drawVerticalLine: false),
                      titlesData: FlTitlesData(
                          show: true,
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  interval: (max/2),
                                  reservedSize: 40,
                                  showTitles: true)),
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(reservedSize: 40, showTitles: false)),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(reservedSize: 40, showTitles: false)),
                          bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  interval: 7, reservedSize: 40, showTitles: true))),
                      maxY: max.toDouble(),
                      minY: 0,
                      minX: 0,
                      maxX: getLastDay(),
                      lineBarsData: [
                        LineChartBarData(
                            barWidth: 1.0,
                            color: mainPurple,
                            spots: List.generate(
                                catList.length,
                                    (index) => FlSpot(
                                        catList.keys.elementAt(index).toDouble(),
                                    catList[catList.keys.elementAt(index)])))
                      ])),
                ),
                SizedBox(height: 5,),
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
                      width: 150,
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
                )
              ],
            );
          }});

  }
}
