import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';

class ShadowButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;
  final double borderRadius;

  const ShadowButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
    required this.buttonColor,
    required this.borderColor,
    required this.textColor,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 128, 51, 191).withOpacity(0.3),
                offset: Offset(0, 3),
                blurRadius: 10,
              ),
            ],
          ),
          child: Container(
              padding: const EdgeInsets.fromLTRB(
                5,
                10,
                5,
                10,
              ),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(
                  borderRadius,
                ),
                border: Border.all(
                  color: borderColor,
                  width: 1,
                ),
              ),
              child: Center(
                  child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Lexend',
                  fontSize: 14,
                ),
              ))),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;
  final double borderRadius;
  final Color splashColor;

  const PrimaryButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
    required this.buttonColor,
    required this.borderColor,
    required this.textColor,
    required this.borderRadius,
    required this.splashColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: splashColor, // Set the splashColor here
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          width: 120,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: darkBlue.withOpacity(0.6),
                blurRadius: 5,
                offset: Offset(
                  0,
                  1,
                ),
              ),
            ],
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontFamily: 'Lexend',
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  final Color color;
  final Color splashColor;
  final double borderRadius;
  const CircularButton({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.color,
    required this.splashColor,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
            decoration: BoxDecoration(
              color: color.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(borderRadius),
              onTap: onTap,
              splashColor: splashColor,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Icon(
                  icon,
                  color: darkGrey,
                  size: 30,
                ),
              ),
            )),
      ),
    );
  }
}
