import 'package:flutter/material.dart';
import 'package:savvy/components/gradient_background.dart';
import 'package:savvy/utils/colors.dart';

class FullDebtOverviewPage extends StatefulWidget {
  const FullDebtOverviewPage({super.key});

  @override
  State<FullDebtOverviewPage> createState() => _FullDebtOverviewPageState();
}

class _FullDebtOverviewPageState extends State<FullDebtOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 240,
                      decoration: BoxDecoration(
                        color: darkBlue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      //settings icon
                      child: Stack(
                        children: [
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.02,
                            left: MediaQuery.of(context).size.width * 0.85,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                height: 30,
                                width: 30,
                                color: darkGrey.withOpacity(0.1),
                                child: Icon(Icons.settings_rounded,
                                    size: 20, color: Colors.white),
                              ),
                            ),
                          ),

                          //greeting
                          Column(
                            children: [
                              Text(
                                "DMP DEBT\nREPAYMENT\nPLAN",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Lexend',
                                  color: Colors.white,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
