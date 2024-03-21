import 'package:flutter/material.dart';
import 'package:savvy/view/homepage.dart';
import 'package:savvy/view/onboardingpage.dart';
import 'package:savvy/view/registerpage.dart';
import 'package:savvy/view/signinpage.dart';
import 'package:savvy/view/pagenotfound.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/signinpage':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const SignInPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          case '/homepage':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const HomePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          case '/registerpage':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const RegisterPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          default:
            return MaterialPageRoute(
                builder: (context) => UndefinedPage(name: settings.name));
        }
      },
    );
  }
}
