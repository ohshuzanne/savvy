import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:savvy/components/gradient_background.dart';
import 'package:savvy/components/textfield.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/components/goalcontainer.dart';
import 'package:savvy/components/showdialog.dart';

class VirtualPetPage extends StatefulWidget {
  const VirtualPetPage({super.key});

  @override
  State<VirtualPetPage> createState() => _VirtualPetPageState();
}

class _VirtualPetPageState extends State<VirtualPetPage> {
  int totalCoins = 0;
  List<Widget> _personalGoals = [];
  bool hasPurchasedCat = false;
  String roomImagePath = 'lib/images/3droomwithcat.png';

  void _increaseTotalCoins(int reward) {
    setState(() {
      totalCoins += reward;
    });
  }

  void _showPurchaseDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Purchase Cat',
            style:
                TextStyle(fontFamily: 'Lexend', fontSize: 16, color: darkGrey),
          ),
          content: Text('Do you want to purchase this cat for 200 coins?',
              style: TextStyle(fontFamily: 'Lexend', color: darkGrey)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Decline',
                style: TextStyle(fontFamily: 'Lexend', color: darkGrey),
              ),
            ),
            TextButton(
              onPressed: () {
                if (totalCoins >= 200) {
                  setState(() {
                    totalCoins -= 200;
                    hasPurchasedCat = true;
                  });
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pop();
                  _showDeclinedPurchaseDialog();
                }
              },
              child: Text(
                'Accept',
                style: TextStyle(fontFamily: 'Lexend', color: darkGrey),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeclinedPurchaseDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Purchase Declined',
            style:
                TextStyle(fontFamily: 'Lexend', fontSize: 16, color: darkGrey),
          ),
          content: Text(
            'You do not have enough coins to make this purchase.',
            style: TextStyle(fontFamily: 'Lexend', color: darkGrey),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(fontFamily: 'Lexend', color: darkGrey),
              ),
            ),
          ],
        );
      },
    );
  }

  void _addNewGoal(String goalName, int reward) {
    var newGoal = Dismissible(
      key: Key(goalName),
      background: Container(color: Colors.red),
      onDismissed: (direction) {
        _removeGoal(goalName);
      },
      child: PersonalGoalCard(
        iconImagePath: 'lib/images/3dpersonalgoal.png',
        goalName: goalName,
        reward: reward,
        onCompleted: () => _increaseTotalCoins(reward),
      ),
    );

    setState(() {
      _personalGoals.add(newGoal);
    });
  }

  void _removeGoal(String goalName) {
    setState(() {
      _personalGoals.removeWhere(
          (widget) => (widget as Dismissible).key.toString() == goalName);
    });
  }

  void _showAddGoalDialog() {
    TextEditingController goalNameController = TextEditingController();
    int reward = 200;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Add a New Personal Goal",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: darkGrey,
                fontFamily: 'Lexend',
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              LongPrimaryTextField(
                  controller: goalNameController,
                  hintText: "Goal Name",
                  obscureText: false),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "CANCEL",
                style: TextStyle(fontFamily: 'Lexend', color: darkGrey),
              ),
            ),
            TextButton(
              onPressed: () {
                if (goalNameController.text.isNotEmpty) {
                  _addNewGoal(goalNameController.text, reward);
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                "ADD",
                style: TextStyle(fontFamily: 'Lexend', color: darkGrey),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PurpleBackgroundShapesState(),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //spacing
                    const SizedBox(height: 20),

                    //coin tracker
                    Center(
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 20,
                              child: Image.asset('lib/images/3dcoin.png'),
                            ),
                            Text(totalCoins.toString())
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    //pet image
                    Center(
                      child: Container(
                        width: 320,
                        child: Image.asset(roomImagePath),
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
                    GestureDetector(
                      onTap: () {
                        CustomAlertDialog.showAlertDialog(
                          context,
                          "This goal cannot be self-completed and will automatically be completed for you upon the full repayment of your DMP payment plan. For more details, head to debt overview.",
                          textColor: darkGrey,
                          "Goal details",
                        );
                      },
                      child: MainGoalCard(
                        iconImagePath: 'lib/images/3dbiggoal.png',
                        goalName: "Pay off DMP plan",
                        reward: 5000,
                      ),
                    ),

                    //container for main goals
                    GestureDetector(
                      onTap: () {
                        CustomAlertDialog.showAlertDialog(
                          context,
                          "This goal cannot be self-completed and will automatically be completed for you upon the full repayment of your car loan payment plan. For more details, head to debt overview.",
                          textColor: darkGrey,
                          "Goal details",
                        );
                      },
                      child: MainGoalCard(
                        iconImagePath: 'lib/images/3dbiggoal.png',
                        goalName: "Pay off car loan",
                        reward: 5000,
                      ),
                    ),

                    //using spread to add the new personal goal card from the list
                    ..._personalGoals,

                    //add new goal container
                    GestureDetector(
                      onTap: () {
                        _showAddGoalDialog();
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: darkBlue,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Container(
                                    width: 35,
                                    child: Image.asset(
                                        'lib/images/3daddicon.png')),
                              ),
                              Text(
                                "Add a new personal goal",
                                style: TextStyle(
                                  color: backgroundWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Lexend',
                                ),
                              ),
                            ],
                          ),
                        ),
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
                            Icons.palette_rounded,
                            size: 20,
                          ),
                          Text(
                            " Cosmetics",
                            style: TextStyle(
                              color: darkGrey,
                              fontSize: 16,
                              fontFamily: 'Lexend',
                            ),
                          ),
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                            child: GestureDetector(
                              onTap: () {
                                if (!hasPurchasedCat) {
                                  _showPurchaseDialog();
                                } else {
                                  setState(() {
                                    roomImagePath =
                                        'lib/images/3dcat2inroom.png';
                                  });
                                }
                              },
                              child: Container(
                                // Container properties remain unchanged
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 7,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Image.asset('lib/images/3dcat2.png'),
                                    if (!hasPurchasedCat)
                                      Positioned.fill(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: Colors.grey.withOpacity(0.3),
                                          ),
                                          child: Center(
                                            child: Container(
                                              width: 100,
                                              height: 20,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 20,
                                                    child: Image.asset(
                                                        'lib/images/3dcoin.png'),
                                                  ),
                                                  Text(
                                                    " 200 coins",
                                                    style: TextStyle(
                                                      fontFamily: 'Lexend',
                                                      color: darkGrey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 25, 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  roomImagePath =
                                      'lib/images/3droomwithcat.png';
                                });
                              },
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 7,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Image.asset('lib/images/3doricat.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
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
