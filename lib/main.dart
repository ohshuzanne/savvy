import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/view/chatwithpetpage.dart';
import 'package:savvy/view/debtmanagerpage.dart';
import 'package:savvy/view/homepage.dart';
import 'package:savvy/view/onboardingpage.dart';
import 'package:savvy/view/registerpage.dart';
import 'package:savvy/view/signinpage.dart';
import 'package:savvy/view/pagenotfound.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
        colorScheme: ColorScheme.fromSeed(seedColor: primaryPurple),
        useMaterial3: true,
      ),
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
          case '/debtmanagerpage':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const DebtManagerPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          case '/onboardingpage':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const OnboardingPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            );
          case '/chatwithpetpage':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const ChatWithPetPage(),
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
