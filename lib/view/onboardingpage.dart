import 'package:flutter/material.dart';
import 'package:savvy/components/buttons.dart';
import 'package:savvy/components/gradient_background.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/view/signinpage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  void navigateToSignInPage() {
    Navigator.pushNamed(context, '/signinpage');
  }

  void navigateToRegisterPage() {
    Navigator.pushNamed(context, '/registerpage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BackgroundShapesState(),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  //logo
                  Container(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Image.asset('lib/images/savvylogo.png'),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    'Savvy',
                    style: TextStyle(
                      fontSize: 38.0,
                      fontFamily: 'K2D',
                      fontWeight: FontWeight.w700,
                      color: darkGrey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      0,
                      0,
                      40,
                    ),
                    child: Text(
                      'Achieve financial freedom with us',
                      style: TextStyle(
                        fontSize: 13.0,
                        height: 1,
                        fontFamily: "Lexend",
                        color: darkGrey.withOpacity(0.7),
                      ),
                    ),
                  ),

                  //picture
                  Container(
                    width: 330,
                    child: Center(
                      child: Image.asset('lib/images/purple_wallet.png'),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Spacer(), // Push everything above to the top and this spacer will take up any remaining space
                ],
              ),
            ),

            //details container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.33,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: darkBlue.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 15,
                      offset: Offset(
                        0,
                        -5,
                      ),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    30,
                    0,
                    30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //main title
                      Text(
                        "Get Started",
                        style: TextStyle(
                            color: darkGrey,
                            fontSize: 24,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w500),
                      ),

                      //description
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          50,
                          20,
                          50,
                          0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Let Savvy empower your journey to financial freedom starting today!",
                                style: TextStyle(
                                  color: darkGrey,
                                  fontFamily: 'Lexend',
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      //buttons
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PrimaryButton(
                              onTap: navigateToSignInPage,
                              buttonText: "Sign In",
                              buttonColor: Colors.white,
                              borderColor: Colors.white,
                              textColor: darkGrey,
                              borderRadius: 20,
                              splashColor: lightPink,
                            ),
                            PrimaryButton(
                              onTap: navigateToRegisterPage,
                              buttonText: "Register",
                              buttonColor: primaryPurple,
                              borderColor: primaryPurple,
                              textColor: Colors.white,
                              borderRadius: 20,
                              splashColor: lightBlue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
