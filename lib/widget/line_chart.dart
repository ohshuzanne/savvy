import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:savvy/dummy.dart';
import 'package:savvy/utils/color.dart';

class LineChartWidget extends StatefulWidget {
  final String month;
  final String cat;

  const LineChartWidget({super.key, required this.month, required this.cat});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  double max = 0;
  List<FlSpot> points = [];

  double getLastDay() {
    DateTime day = DateFormat("d MMM y").parse("01 ${widget.month}");
    int lastDay = DateTime(day.year, day.month + 1, 0).day;
    return lastDay.toDouble();
  }

  List<Map> getList() {
    List<Map> catList = [];
    for (Map i in expenseList) {
      if (i['categories'] == widget.cat) {
        catList.add(i);
        if (double.parse(i['amount'].toString()) > max) {
          max = double.parse(i['amount'].toString());
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
    }
    return catList;
  }

  @override
  Widget build(BuildContext context) {
    List<Map> catList = getList();
    return AspectRatio(
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
                        double.parse(DateFormat('d').format(
                            DateTime.parse(catList[index]['date'].toString()))),
                        double.parse(catList[index]['amount'].toString()))))
          ])),
    );
  }
}
