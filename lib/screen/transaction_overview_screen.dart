import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:savvy/dummy.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/widget/month_dropdown.dart';
import 'package:savvy/widget/pie_chart.dart';
import 'package:savvy/widget/transaction_log.dart';

class TransactionOverview extends StatelessWidget {
  const TransactionOverview({super.key});

  double getTotal() {
    double total = 0;
    for (Map i in expenseList) {
      if (DateTime.parse(i['date']).month == DateTime.now().month) {
        total += i['amount'].toDouble();
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Overview",
          style: TextStyle(
            fontFamily: 'Lexend',
            color: darkGrey,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                  child: PieChartWidget(total: getTotal()),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: MonthDropdown(),
                  ),
                )
              ]),
              TransactionLog()
            ],
          )),
        ),
      ),
    );
  }
}
