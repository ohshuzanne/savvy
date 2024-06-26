import 'package:flutter/material.dart';
import 'package:savvy/components/buttons.dart';
import 'package:savvy/components/gradient_background.dart';
import 'package:savvy/components/textfield.dart';
import 'package:savvy/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';

class FullDebtOverviewPage extends StatefulWidget {
  const FullDebtOverviewPage({Key? key}) : super(key: key);

  @override
  State<FullDebtOverviewPage> createState() => _FullDebtOverviewPageState();
}

class _FullDebtOverviewPageState extends State<FullDebtOverviewPage> {
  int _touchedIndex = -1;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _icNRICController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  void _showLoanTypeChoice(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: backgroundWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 30,
                    child: Image.asset('lib/images/3dloancoin.png'),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Select Loan Type',
                    style: TextStyle(
                        fontSize: 18, fontFamily: 'Lexend', color: darkGrey),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    PrimaryButton(
                      onTap: () {
                        Navigator.pop(context);
                        _showSettingsModalSheet(context);
                      },
                      buttonText: "DMP loan",
                      buttonColor: backgroundWhite,
                      borderColor: backgroundWhite,
                      textColor: darkGrey,
                      borderRadius: 25,
                      splashColor: lightBlue,
                    ),
                    const SizedBox(height: 16),
                    PrimaryButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      buttonText: "Other loan type",
                      buttonColor: backgroundWhite,
                      borderColor: backgroundWhite,
                      textColor: darkGrey,
                      borderRadius: 25,
                      splashColor: lightBlue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSettingsModalSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: backgroundWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.8,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    child: Image.asset('lib/images/AKPK_logo.png'),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    'DMP loan application',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lexend',
                      color: darkGrey,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    "No loan exists under your IC currently.\nPlease fill in the form below to\nstart your application today.",
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 14,
                      color: darkGrey.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Personal Information",
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      color: darkGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 3),
                  child: Text(
                    "Full Name",
                    style: TextStyle(fontFamily: 'Lexend', color: darkGrey),
                  ),
                ),
                PrimaryTextField(
                  controller: _fullNameController,
                  hintText: "Full Government Name",
                  obscureText: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 3),
                  child: Text(
                    "NRIC",
                    style: TextStyle(fontFamily: 'Lexend', color: darkGrey),
                  ),
                ),
                PrimaryTextField(
                  controller: _icNRICController,
                  hintText: "NRIC as per IC",
                  obscureText: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 3),
                  child: Text(
                    "E-mail",
                    style: TextStyle(fontFamily: 'Lexend', color: darkGrey),
                  ),
                ),
                PrimaryTextField(
                  controller: _emailController,
                  hintText: "E-mail",
                  obscureText: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 3),
                  child: Text(
                    "Phone Number",
                    style: TextStyle(fontFamily: 'Lexend', color: darkGrey),
                  ),
                ),
                PrimaryTextField(
                  controller: _phoneNumberController,
                  hintText: "Phone Number",
                  obscureText: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            PurpleBackgroundShapesState(),
            Column(
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
                  //add icon
                  child: Stack(
                    children: [
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.04,
                        left: MediaQuery.of(context).size.width * 0.85,
                        child: GestureDetector(
                          onTap: () {
                            _showLoanTypeChoice(context);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              height: 30,
                              width: 30,
                              color: darkGrey.withOpacity(0.1),
                              child: Icon(Icons.add_rounded,
                                  size: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      //greeting
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good evening',
                              style: TextStyle(
                                fontFamily: 'K2D',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                height: 1,
                                color: backgroundWhite.withOpacity(0.8),
                              ),
                            ),
                            Text(
                              'Suzanne Lai',
                              style: TextStyle(
                                  fontFamily: 'K2D',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  height: 1,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //card visualization
            Positioned(
              top: 75,
              left: 20,
              child: Container(
                height: 230,
                width: 320,
                decoration: BoxDecoration(
                  color: secondaryPurple,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: primaryPurple.withOpacity(0.30),
                      offset: Offset(0, 3),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        20,
                        20,
                        0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 36,
                                child: Image.asset('lib/images/3dcard.png'),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Car Loan Total",
                                style: TextStyle(
                                  fontFamily: 'K2D',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.more_horiz_rounded, color: Colors.white),
                        ],
                      ),
                    ),
                    //spacing
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            'RM64,890',
                            style: TextStyle(
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    //car loan paid and unpaid
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        10,
                        20,
                        0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor:
                                        backgroundWhite.withOpacity(0.2),
                                    child: Icon(
                                      Icons.arrow_downward_rounded,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Amount paid",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Lexend',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              //Amount
                              Text(
                                "RM14,424.00",
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  color: Colors.white,
                                  fontSize: 18,
                                  height: 2,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor:
                                        backgroundWhite.withOpacity(0.2),
                                    child: Icon(
                                      Icons.arrow_upward_rounded,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Outstanding",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Lexend',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              //Amount
                              Text(
                                "RM50,466.00",
                                style: TextStyle(
                                  fontFamily: 'Lexend',
                                  color: Colors.white,
                                  fontSize: 18,
                                  height: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:8.0,),
                      child: Text(
                        "Autopay is enabled, next payment 5/5/24",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontFamily: 'Lexend',
                            fontSize: 13,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Text("60 installments left",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontFamily: 'Lexend',
                          fontSize: 13,
                         ),)
                  ],
                ),
              ),
            ),
            Positioned(
              top: 335,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Debt Payment Overview",
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 16,
                      color: darkGrey,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 200,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              setState(() {
                                if (!event.isInterestedForInteractions ||
                                    pieTouchResponse == null ||
                                    pieTouchResponse.touchedSection == null) {
                                  _touchedIndex = -1;
                                  return;
                                }
                                _touchedIndex = pieTouchResponse
                                    .touchedSection!.touchedSectionIndex;
                              });
                            },
                          ),
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 2,
                          centerSpaceRadius: 40,
                          sections: showingSections(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    double paidAmount = 14424.00; // Example amount paid
    double unpaidAmount = 50466.00; // Example outstanding amount
    double total = paidAmount + unpaidAmount;

    return List.generate(2, (i) {
      final isTouched = i == _touchedIndex;
      final fontSize = isTouched ? 18.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: lightGreen,
            value: (paidAmount / total) * 100,
            title: '${((paidAmount / total) * 100).toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lexend',
                color: primaryPurple),
          );
        case 1:
          return PieChartSectionData(
            color: primaryPurple,
            value: (unpaidAmount / total) * 100,
            title: '${((unpaidAmount / total) * 100).toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lexend',
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
