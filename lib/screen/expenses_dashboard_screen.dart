import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/dummy.dart';
import 'package:savvy/screen/create_expenses_screen.dart';
import 'package:savvy/screen/transaction_overview_screen.dart';
import 'package:savvy/utils/categories.dart';
import 'package:savvy/utils/color.dart';
import 'package:savvy/widget/categories_widget.dart';
import 'package:savvy/widget/create_button.dart';
import 'package:savvy/widget/total_expenses.dart';
import 'package:savvy/widget/transaction_log.dart';

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
                    Text("Balance",style: GoogleFonts.lexend(color: Colors.black)),
                    Text("\$ ${balance}")
                  ],
                ),
              ), ListTile(title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Monthly Income",style: GoogleFonts.lexend(color: Colors.black)),
                  Text("\$ ${income}"),
                  Row(children: [Text("Edit Monthly Income",style: GoogleFonts.lexend(color: Colors.black)),Icon(Icons.edit_rounded, color: Colors.grey,)],)

                ],
              ),),
              ListTile(title: Row(
                children: [

                ],
              ),)
            ],
          ),
        ),
      ),
      floatingActionButton: CreateButton(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
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
                          color: mainPurple,
                        ),
                      ),
                    );
                  })
                ],
                toolbarHeight: 80,
                title: Text(
                  "Record your expenses today!",
                  style: GoogleFonts.lexend(color: Colors.black, fontSize : 18),
                  
                ),
              ),
              TotalExpenses(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5, left: 10),
                child: Text(
                  "Categories",
                  style: GoogleFonts.lexend(color: Colors.black, fontSize:17),
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
                      style: GoogleFonts.lexend(color: Colors.black, fontSize:17),
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
                            style: GoogleFonts.lexend(color: mainPurple.withOpacity(0.7)),
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
              )
            ],
          ),
        ),
      )),
    );
  }
}
