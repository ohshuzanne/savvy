import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/utils/colors.dart';

const mainPurple = Color(0xff6101FA);
const darkColor = Color(0xff272839);
const brightWhite = Color(0xffFCFBFB);
const subPurple = Color(0xffDED5F1);

void showBackDialog(String confirmation, context) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure?'),
        content: Text(
          confirmation,
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme
                  .of(context)
                  .textTheme
                  .labelLarge,
            ),
            child: const Text('Nevermind'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme
                  .of(context)
                  .textTheme
                  .labelLarge,
            ),
            child: const Text('Leave'),
            onPressed: () {
              if (confirmation == 'Are you sure you want to leave the app?') {
                SystemNavigator.pop();
              } else {
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
          ),
        ],
      );
    },
  );
}

showSnackBar(String message, context) {
  final snackbar = SnackBar(
    content: Text(message, style: GoogleFonts.lexend(),),
    duration: Duration(seconds: 1),
    backgroundColor: darkBlue,
  );
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}