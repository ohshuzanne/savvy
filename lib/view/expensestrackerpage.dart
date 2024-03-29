import 'package:flutter/material.dart';
import 'package:savvy/components/showdialog.dart';
import 'package:savvy/utils/colors.dart';

class ExpensesTrackerPage extends StatefulWidget {
  const ExpensesTrackerPage({super.key});

  @override
  State<ExpensesTrackerPage> createState() => _ExpensesTrackerPageState();
}

class _ExpensesTrackerPageState extends State<ExpensesTrackerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: darkGrey,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 16,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 23,
              child: Image.asset('lib/images/savvylogo.png'),
            ),
            Text(
              "avvy",
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              CustomAlertDialog.showAlertDialog(
                context,
                "This page is used for registered users to sign in. Please return to the previous page if you are not a registered user.",
                "Info",
                textColor: darkGrey,
              );
            },
            icon: const Icon(Icons.info_outline_rounded,
                size: 22, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Expenses Tracker Page",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
