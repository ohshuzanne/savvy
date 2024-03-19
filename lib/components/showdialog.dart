import 'dart:ui'; // Import this for ImageFilter

import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';

class CustomAlertDialog {
  static void showAlertDialog(
      BuildContext context, String message, String title,
      {Color? textColor}) {
    Color dialogTitleTextColor = textColor ?? darkGrey;
    Color dialogContentTextColor = textColor ?? primaryPurple;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: Colors.black.withOpacity(0.0),
              ),
            ),
            AlertDialog(
              backgroundColor: backgroundWhite,
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Lexend',
                  color: dialogTitleTextColor,
                ),
                textAlign: TextAlign.start,
              ),
              content: Text(
                message,
                style: TextStyle(
                  color: dialogContentTextColor,
                  fontFamily: 'Lexend',
                  fontSize: 14,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "OK",
                    style: TextStyle(
                        color: dialogTitleTextColor, fontFamily: 'Lexend'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
      useRootNavigator: true,
      barrierColor: Colors.black.withOpacity(0.5),
    );
  }
}
