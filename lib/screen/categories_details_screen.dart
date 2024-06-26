import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/widget/line_chart.dart';
import 'package:savvy/widget/transaction_log.dart';

class CategoriesDetails extends StatefulWidget {
  final String cat;
  const CategoriesDetails({super.key, required this.cat});

  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.cat}",
          style: TextStyle(fontFamily: 'Lexend', fontSize: 18, color: darkGrey),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 20.0, left: 20, bottom: 20, top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, bottom: 10),
                  child: LineChartWidget(
                                       cat: widget.cat,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
