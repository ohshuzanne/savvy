import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/widget/pie_chart.dart';
import 'package:savvy/widget/transaction_log.dart';

class TransactionOverview extends StatelessWidget {
  const TransactionOverview({super.key});



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
                  child: PieChartWidget(),
                ),
                ]),

            ],
          )),
        ),
      ),
    );
  }
}
