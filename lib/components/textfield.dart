import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savvy/utils/colors.dart';

class PrimaryTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const PrimaryTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.obscureText})
      : super(key: key);

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  bool _isFilled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          onChanged: (value) {
            setState(() {
              _isFilled = value.isNotEmpty;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field is required';
            }
            return null;
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: backgroundWhite,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: darkBlue),
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: Colors.grey[200],
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            labelText: _isFilled ? null : widget.hintText,
            labelStyle: TextStyle(
              color: darkGrey.withOpacity(0.4),
              fontWeight: FontWeight.w300,
              fontSize: 14,
              fontFamily: 'Lexend',
            ),
          ),
        ),
      ),
    );
  }
}

class LongPrimaryTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const LongPrimaryTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.obscureText})
      : super(key: key);

  @override
  State<LongPrimaryTextField> createState() => _LongPrimaryTextFieldState();
}

class _LongPrimaryTextFieldState extends State<LongPrimaryTextField> {
  bool _isFilled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 80,
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          onChanged: (value) {
            setState(() {
              _isFilled = value.isNotEmpty;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field is required';
            }
            return null;
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: backgroundWhite,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: darkBlue),
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: Colors.grey[200],
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            labelText: _isFilled ? null : widget.hintText,
            labelStyle: TextStyle(
              color: darkGrey.withOpacity(0.4),
              fontWeight: FontWeight.w300,
              fontSize: 14,
              fontFamily: 'Lexend',
            ),
          ),
        ),
      ),
    );
  }
}
