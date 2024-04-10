import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:savvy/components/gradient_background.dart';
import 'package:savvy/screen/create_expenses_screen.dart';
import 'package:savvy/screen/transaction_overview_screen.dart';
import 'package:savvy/utils/categories.dart';
import 'package:savvy/utils/color.dart';
import 'package:savvy/widget/categories_widget.dart';
import 'package:savvy/widget/create_button.dart';
import 'package:savvy/widget/total_expenses.dart';
import 'package:savvy/widget/transaction_log.dart';

import '../provider/user_provider.dart';
import '../utils/colors.dart';

class ExpensesDashboard extends StatelessWidget {
  const ExpensesDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: ListView(
            children: [
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Balance",
                        style: GoogleFonts.lexend(color: Colors.black)),
                    Consumer<UserProvider>(builder: (context,data,child) {
                      return Text(data.balance.toString());

                    },),
                  ],
                ),
              ),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Monthly Income",
                        style: GoogleFonts.lexend(color: Colors.black)),
                    Consumer<UserProvider>(builder: (context,data,child) {
                     return Text(data.income.toString());

                    },),
                    Row(
                      children: [
                        Text("Edit Monthly Income",
                            style: GoogleFonts.lexend(color: Colors.black)),
                        Icon(
                          Icons.edit_rounded,
                          color: darkGrey,
                        )
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: [],
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: darkGrey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 23,
              child: Image.asset('lib/images/savvylogo.png'),
            ),
            Text(
              "avvy",
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline_rounded,
                size: 22, color: Colors.white),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(color: backgroundWhite),
          child: ListView(
            children: [
              DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    20,
                    0,
                    20,
                  ),
                  child: Image.asset('lib/images/savvylogowithpets.png'),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: Icon(
                  Icons.person_2_rounded,
                  size: 20,
                  color: darkBlue,
                ),
                title: Text(
                  "Profile Page",
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: darkGrey.withOpacity(
                      0.8,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.people_rounded,
                  size: 20,
                  color: darkBlue,
                ),
                title: Text(
                  "About Savvy",
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: darkGrey.withOpacity(
                      0.8,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.privacy_tip_rounded,
                  size: 20,
                  color: darkBlue,
                ),
                title: Text(
                  "Privay Policy",
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: darkGrey.withOpacity(
                      0.8,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings_rounded,
                  size: 20,
                  color: darkBlue,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: darkGrey.withOpacity(
                      0.8,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  size: 20,
                  color: darkBlue,
                ),
                title: Text(
                  "Log Out",
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: darkGrey.withOpacity(
                      0.8,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/onboardingpage');
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 70),
        child: CreateButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Stack(
        children: <Widget>[
          SecondPurpleBackgroundShapesState(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      automaticallyImplyLeading: false,
                      actions: [
                        Builder(builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(
                                Icons.list,
                                color: primaryPurple,
                              ),
                            ),
                          );
                        })
                      ],
                      toolbarHeight: 80,
                      title: Text(
                        "Record your expenses today!",
                        style: GoogleFonts.lexend(
                            color: Colors.black, fontSize: 18),
                      ),
                    ),
                    TotalExpenses(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15.0, bottom: 5, left: 10),
                      child: Text(
                        "Categories",
                        style: GoogleFonts.lexend(
                            color: Colors.black, fontSize: 17),
                      ),
                    ),
                    GridView.count(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        primary: false,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 0.92,
                        children: List.generate(cats.length,
                            (index) => CategoriesWidget(cat: cats[index]))),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 5, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Latest Transaction",
                            style: GoogleFonts.lexend(
                                color: Colors.black, fontSize: 17),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          TransactionOverview()));
                            },
                            child: Row(
                              children: [
                                Text(
                                  "View All",
                                  style: GoogleFonts.lexend(
                                      color: mainPurple.withOpacity(0.7)),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 14,
                                  color: mainPurple.withOpacity(0.7),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    TransactionLog(
                      isLatest: true,
                    ),
                    const SizedBox(height: 140),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
