import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/components/showdialog.dart';
import 'package:savvy/view/fulldebtoverviewpage.dart';
import 'package:savvy/view/virtualpetpage.dart';

class DebtManagerPage extends StatefulWidget {
  const DebtManagerPage({super.key});

  @override
  State<DebtManagerPage> createState() => _DebtManagerPageState();
}

class _DebtManagerPageState extends State<DebtManagerPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            onPressed: () {
              CustomAlertDialog.showAlertDialog(
                context,
                "This page is used for registered users to sign in. Please return to the previous page if you are not a registered user.",
                "Info",
                textColor: darkGrey,
              );
            },
            icon: const Icon(Icons.info_outline_rounded,
                size: 22, color: Colors.white),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Virtual Pet'),
            Tab(text: 'Debt Overview'),
          ],
          labelColor: primaryPurple,
          unselectedLabelColor: darkGrey,
          indicatorColor: primaryPurple,
          labelStyle: TextStyle(
            fontFamily: 'Lexend',
          ),
        ),
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
      body: TabBarView(
        controller: _tabController,
        children: [
          VirtualPetPage(),
          FullDebtOverviewPage(),
        ],
      ),
    );
  }
}
