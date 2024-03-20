import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/components/showdialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text(
          "Sign In",
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 20,
          ),
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
            icon: const Icon(Icons.info_outline_rounded, size: 22),
          ),
        ],
      ),
      backgroundColor: backgroundWhite,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //spacing at the top
              const SizedBox(height: 40),

              Text("Hi everyone"),

              //picture container
              Container(
                height: 200,
                child: Image.asset('lib/images/3dpuppy.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
