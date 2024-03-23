import 'package:flutter/material.dart';

class FinancialLiteracyHub extends StatefulWidget {
  const FinancialLiteracyHub({super.key});

  @override
  State<FinancialLiteracyHub> createState() => _FinancialLiteracyHubState();
}

class _FinancialLiteracyHubState extends State<FinancialLiteracyHub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Financial Literacy Hub",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
