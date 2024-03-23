import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:savvy/dummy.dart';
import 'package:savvy/utils/color.dart';
import 'package:savvy/widget/transaction_log.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({super.key});

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  double max = 0;
  String selectedMonth = DateFormat("MMM y").format(DateTime.now());
  List<DateTime> selectedDay = [];
  List<Map> data = [];
  List<DateTime> availableDay = [];

  void getList() {
    for (Map i in expenseList) {
      for (DateTime j in selectedDay) {
        if (j.day == DateTime.parse(i['date']).day &&
            j.month == DateTime.parse(i['date']).month &&
            j.year == DateTime.parse(i['date']).year) {
          DateTime temp = DateTime.parse(i['date']);
          temp = DateTime(temp.year, temp.month, temp.day);
          availableDay.add(temp);
          data.add(
              {'date': temp, 'amount': double.parse(i['amount'].toString())});
          if (double.parse(i['amount'].toString()) > max) {
            max = double.parse(i['amount'].toString());
          }
        }
      }
    }
    if (max < 100) {
      max = 100;
    } else if (max < 250) {
      max = 250;
    } else if (max < 500) {
      max = 500;
    } else if (max < 750) {
      max = 750;
    } else if (max < 1000) {
      max = 1000;
    } else {
      max = ((max - (max % 1000)) + 1) * 1000;
    }
    print("selectedDay $selectedDay");
    print("availableDay$availableDay");
    print("data$data");
  }

  DateTime getFirstDay(bool isNext) {
    DateTime day = selectedDay.isEmpty
        ? DateTime.now()
        : isNext
            ? DateTime(selectedDay[0].year, selectedDay[0].month,
                selectedDay[0].day + 1)
            : DateTime(selectedDay[0].year, selectedDay[0].month,
                selectedDay[0].day - 1);
    DateTime monday = DateTime(day.year, day.month, day.day);
    while (true) {
      if (day.weekday == 1) {
        monday = DateTime(day.year, day.month, day.day);
        break;
      } else {
        day = DateTime(day.year, day.month, day.day - 1);
      }
    }
    selectedDay.clear();
    for (int n = 0; n < 7; n++) {
      day = DateTime(monday.year, monday.month, monday.day + n);
      selectedDay.add(day);
    }
    return monday;
  }

  @override
  Widget build(BuildContext context) {
    getFirstDay(false);
    getList();
    return Column(
      children: [
        AspectRatio(
            aspectRatio: 1.3,
            child: BarChart(BarChartData(
              barTouchData: BarTouchData(touchTooltipData: BarTouchTooltipData(tooltipBgColor: subPurple.withOpacity(0.5))),
                gridData: FlGridData(
                    drawVerticalLine: false,
                    horizontalInterval: budget / 30,
                    checkToShowHorizontalLine: (value) => value == budget / 30),
                titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                            interval: (max / 2),
                            reservedSize: 40,
                            showTitles: true)),
                    rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                      interval: budget / 30,
                      reservedSize: 50,
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value == budget / 30) {
                          // Show title only at 74
                          return Text(
                            "Daily \nBudget",
                            style: GoogleFonts.lexend(fontSize: 12),
                          );
                        } else {
                          return const Text(''); // Empty text for other values
                        }
                      },
                    )),
                    topTitles: AxisTitles(
                        sideTitles:
                            SideTitles(reservedSize: 40, showTitles: false)),
                    bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                            interval: 7, reservedSize: 40, showTitles: true))),
                borderData: FlBorderData(show: false),
                minY: 0,
                maxY: max > budget / 30 ? max : budget / 30,
                barGroups: List.generate(
                    7,
                    (index) => selectedDay == []
                        ? BarChartGroupData(x: 0)
                        : BarChartGroupData(
                            x: int.parse(DateFormat("dd").format(
                                DateTime.parse(selectedDay[index].toString()))),
                            barRods: [
                                BarChartRodData(
                                    backDrawRodData: BackgroundBarChartRodData(
                                        show: true, toY: max, color: subPurple),
                                    borderRadius: BorderRadius.circular(4),
                                    width: 20,
                                    color: mainPurple,
                                    toY: (availableDay
                                            .contains(selectedDay[index])
                                        ? data
                                            .where((element) =>
                                                element['date'] ==
                                                selectedDay[index])
                                            .toList()[0]['amount']
                                        : 0))
                              ]))))),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back_ios_new_rounded),
            SizedBox(
              width: 5,
            ),
            Text(
              "${DateFormat('d MMM').format(selectedDay[0])} - ${DateFormat('d MMM').format(selectedDay[6])}",
              style: GoogleFonts.lexend(),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
        SizedBox(height: 15,),
        TransactionLog(selectedDate: selectedDay,)
      ],

    );
  }
}
