import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/view/financialliteracyhub.dart';
import '../screen/expenses_dashboard_screen.dart';
import 'communityexchangepage.dart';
import 'debtmanagerpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DebtManagerPage(),
    ExpensesDashboard(),
    FinancialLiteracyHub(),
    CommunityExchangePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundWhite,
      body: Stack(
        children: [
          Positioned.fill(
            child: _pages[_selectedIndex],
          ),
          Positioned(
            left: 30,
            right: 30,
            bottom: 30,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: lightPurple,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: darkGrey.withOpacity(0.40),
                    offset: Offset(0, 6),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.payment_rounded, 0),
                  _buildNavItem(Icons.money_rounded, 1),
                  _buildNavItem(Icons.school_rounded, 2),
                  _buildNavItem(Icons.forum_rounded, 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //adding comment here
  //add comment

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected
              ? backgroundWhite.withOpacity(0.55)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(
          icon,
          color: isSelected ? primaryPurple : darkGrey,
        ),
      ),
    );
  }
}
