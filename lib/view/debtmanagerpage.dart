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
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 16,
          ),
        ),
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
            icon: const Icon(Icons.info_outline_rounded, size: 22),
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
