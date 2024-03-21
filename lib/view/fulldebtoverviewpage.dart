import 'package:flutter/material.dart';

class FullDebtOverviewPage extends StatefulWidget {
  const FullDebtOverviewPage({super.key});

  @override
  State<FullDebtOverviewPage> createState() => _FullDebtOverviewPageState();
}

class _FullDebtOverviewPageState extends State<FullDebtOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Debt Overview Page"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
