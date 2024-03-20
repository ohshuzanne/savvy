import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:savvy/components/textfield.dart';
import 'package:savvy/components/buttons.dart';

class RegisterPanelWidget extends StatelessWidget {
  final ScrollController controller;
  final Color dragHandleColor;
  final PanelController panelController;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final Function()? onSaveRegistration;

  RegisterPanelWidget({
    Key? key,
    required this.controller,
    required this.dragHandleColor,
    required this.panelController,
    required this.usernameController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.emailController,
    required this.onSaveRegistration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.all(10),
        controller: controller,
        children: <Widget>[
          SizedBox(height: 36),
          buildDragHandle(),
          SizedBox(height: 36),
          buildAboutText(),
          SizedBox(height: 24),
        ],
      );
  Widget buildDragHandle() => GestureDetector(
        child: Center(
          child: Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: dragHandleColor,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
        ),
        onTap: togglePanel,
      );

  void togglePanel() => panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();

  Widget buildAboutText() => Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //username text field
            PrimaryTextField(
              controller: usernameController,
              hintText: "Username",
              obscureText: false,
            ),

            //email text field
            PrimaryTextField(
              controller: emailController,
              hintText: "E-mail",
              obscureText: false,
            ),

            //password text field
            PrimaryTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            //confirm password text field
            PrimaryTextField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),

            //save button
            PrimaryButton(
              onTap: onSaveRegistration,
              buttonText: "Register Now",
              buttonColor: backgroundWhite,
              borderColor: backgroundWhite,
              textColor: darkGrey,
              borderRadius: 25,
              splashColor: lightPink,
            ),
          ],
        ),
      );
}
