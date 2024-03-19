import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';

class UndefinedPage extends StatelessWidget {
  final String? name;

  const UndefinedPage({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryPurple,
        foregroundColor: Colors.white,
        title: const Text(
          'Page Not Found',
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 16,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Text(
              'Sorry, the page "$name" does not exist.',
              style: TextStyle(
                color: darkGrey,
                fontSize: 24,
                fontFamily: 'Lexend',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
