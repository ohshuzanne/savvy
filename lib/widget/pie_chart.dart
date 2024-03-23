import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:savvy/dummy.dart';
import 'package:savvy/utils/categories.dart';
import 'package:savvy/utils/color.dart';

class PieChartWidget extends StatefulWidget {
  final double total;

  const PieChartWidget({super.key, required this.total});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  double getCatTotal(String cat) {
    double total = 0;
    for (Map i in expenseList) {
      if (DateTime.parse(i['date']).month == DateTime.now().month &&
          i['categories'] == cat) {
        total += i['amount'].toDouble();
      }
    }
    return total;
  }

  List<Map> getPercentage() {
    List<Map> percentage = [];
    for (String i in cats) {
      double percent = getCatTotal(i) / widget.total * 100;
      percentage.add({'cat': i, 'percentage': percent.roundToDouble()});
    }
    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    List<Map> percentage = getPercentage();
    percentage.sort((a, b) => (a['percentage']).compareTo(b['percentage']));
    return Stack(alignment: Alignment.center, children: [
      Center(
        child: Text("RM " + widget.total.toStringAsFixed(2),style: TextStyle(fontSize: 12),),
      ),
      AspectRatio(
        aspectRatio: 1.3,
        child: PieChart(PieChartData(
            startDegreeOffset: 180,
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 1,
            centerSpaceRadius: 40,
            sections: List.generate(
                4,
                (index) => PieChartSectionData(
                    titlePositionPercentageOffset: 1.3,
                    titleStyle: TextStyle(fontWeight: FontWeight.w500),
                    title: "${percentage[index]['percentage']} % ",
                    badgeWidget: Icon(
                      getIcons(percentage[index]['cat']),
                      color: brightWhite,
                      size: 20,
                    ),
                    radius: 70,
                    color: mainPurple.withOpacity(0.2 * (cats.length - index)),
                    value: percentage[index]['percentage'])))),
      )
    ]);
  }
}
