import 'package:flutter/material.dart';
import 'package:savvy/components/gradient_background.dart';

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
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Debt Overview Page",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
