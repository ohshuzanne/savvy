import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:road_to_15k/NewHubLayout_Main.dart';

import 'Hub/LiteracyHub.dart';
import 'Forum/Forum.dart';

void main() {
  runApp(MyApp());

  //Test LHub
  // runApp(const LiteracyHub());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<BottomNavigationBarItem> bottomNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined,color: Colors.black,),
      label: "Hub",
      backgroundColor: Colors.white,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.school_outlined,color: Colors.black,),
      label: "Hub",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.work_outline,color: Colors.black,),
      label: "Hub",

    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.bell,color: Colors.black,),
      label: "Hub",

    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline,color: Colors.black,),
      label: "Hub",

    ),
    // Add more items as needed
  ];

  final List<Widget> body = [
    const NewHub(),
    Forum(),
    const LiteracyHub(), //旧的，换去新的
    Icon(CupertinoIcons.bell,color: Colors.black,),
    Icon(Icons.person_outline,color: Colors.black,),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'WenHan_Forum_&_Hub',
        home: DefaultTabController(
          length: body.length,
          child: Scaffold(
            body:body[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                onTap: (int newIndex){
                  setState(() {
                    _currentIndex = newIndex;
                  });
                },
                items: bottomNavItems,
            currentIndex: _currentIndex,),),
        )
    );
  }
}
