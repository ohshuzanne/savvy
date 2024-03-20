import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/components/goalcontainer.dart';

class VirtualPetPage extends StatefulWidget {
  const VirtualPetPage({super.key});

  @override
  State<VirtualPetPage> createState() => _VirtualPetPageState();
}

class _VirtualPetPageState extends State<VirtualPetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //spacing
                const SizedBox(height: 20),

                //pet image
                Center(
                  child: Container(
                    width: 320,
                    child: Image.asset('lib/images/3droomwithcat.png'),
                  ),
                ),

                //heading for text
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    35,
                    20,
                    35,
                    10,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        size: 20,
                      ),
                      Text(
                        " Goals in progress",
                        style: TextStyle(
                          color: darkGrey,
                          fontSize: 16,
                          fontFamily: 'Lexend',
                        ),
                      ),
                    ],
                  ),
                ),

                //container for main goals
                MainGoalCard(
                    iconImagePath: 'lib/images/3dbiggoal.png',
                    goalName: "Complete DMP plan",
                    reward: 5000),
                MainGoalCard(
                  iconImagePath: 'lib/images/3dbiggoal.png',
                  goalName: "Pay off car loan",
                  reward: 5000,
                ),

                //container for personal goals
                PersonalGoalCard(
                  iconImagePath: 'lib/images/3dpersonalgoal.png',
                  goalName: "Pay back RM200 to Dalton",
                  reward: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
