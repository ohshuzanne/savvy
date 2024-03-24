import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:savvy/dummy.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/widget/bar_chart.dart';
import 'package:savvy/widget/transaction_log.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Budget",
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Lexend',
            color: darkGrey,
          ),
        ),
        toolbarHeight: 80,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 20.0, left: 20, bottom: 20, top: 10),
          child: SingleChildScrollView(
              child: Column(
            children: [
              BarChartWidget(),
            ],
          )),
        ),
      ),
    );
  }
}
