import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/components/showdialog.dart';
import 'package:savvy/components/textfield.dart';
import 'package:savvy/components/buttons.dart';
import 'package:savvy/view/homepage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final List<String> imagePaths = [
    'lib/images/3dpuppy.png',
    'lib/images/3dcat.png',
    'lib/images/3daxolotl.png',
    'lib/images/3dowl.png',
    'lib/images/3dfox.png',
    'lib/images/3ddeer.png',
  ];
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void navigateToHomePage() {
    Navigator.pushNamed(context, '/homepage');
  }

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
      backgroundColor: lighterBlue,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 25),

                  //image scroll
                  Container(
                    height: 200,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PageView.builder(
                          controller: _pageController,
                          itemCount: imagePaths.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              imagePaths[index],
                              fit: BoxFit.contain,
                            );
                          },
                        ),
                        //left right buttons
                        Positioned(
                          left: 24,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: backgroundWhite,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: darkBlue.withOpacity(0.6),
                                  offset: const Offset(0, 1),
                                  blurRadius: 7,
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_rounded,
                                color: darkBlue,
                                size: 18,
                              ),
                              onPressed: () {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          right: 24,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: backgroundWhite,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: darkBlue.withOpacity(0.6),
                                  offset: const Offset(0, 1),
                                  blurRadius: 7,
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: darkBlue,
                                size: 18,
                              ),
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.54,
                decoration: BoxDecoration(
                  color: backgroundWhite.withOpacity(0.9),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: darkBlue.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 15,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Sign In",
                        style: TextStyle(
                          color: darkGrey,
                          fontSize: 24,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "We're so happy to see you again!",
                        style: TextStyle(
                          color: darkGrey,
                          fontFamily: 'Lexend',
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),

                      //username textfield
                      PrimaryTextField(
                        controller: _usernameController,
                        hintText: "Username",
                        obscureText: false,
                      ),

                      const SizedBox(height: 15),

                      //password text field
                      PrimaryTextField(
                        controller: _passwordController,
                        hintText: "Password",
                        obscureText: true,
                      ),

                      const SizedBox(height: 30),

                      //button
                      PrimaryButton(
                        onTap: navigateToHomePage,
                        buttonText: "Sign In",
                        buttonColor: backgroundWhite,
                        borderColor: backgroundWhite,
                        textColor: darkGrey,
                        borderRadius: 25,
                        splashColor: lightBlue,
                      ),

                      const SizedBox(height: 30),

                      Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 13,
                          color: darkGrey.withOpacity(0.7),
                          decoration: TextDecoration.underline,
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
