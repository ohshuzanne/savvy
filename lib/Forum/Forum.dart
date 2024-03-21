import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:savvy/dummyData.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'ForumSinglePostWidget.dart';

class Forum extends StatefulWidget {
  Forum({super.key});

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  int postNumber = 10;
  bool searchStatus = false;

  DummyData dummyData = DummyData();
  late List<String> name ;
  late List<DateTime> publishedDate ;
  late List<String> content ;
  late List<int> numLikes ;
  late List<int> numComments ;
  late List<int> numShare ;
  late List<String> profilePicUrl ;

  List<String> nameFilterList = [];
  List<String> contentFilterList = [];
  List<DateTime> publishedDateFilterList = [] ;
  List<int> numLikesFilterList = [] ;
  List<int> numCommentsFilterList = [];
  List<int> numShareFilterList = [];
  List<String> profilePicUrlFilterList = [];

  @override
  Widget build(BuildContext context) {

    final _searchTextController = TextEditingController();

    MediaQueryData media = MediaQuery.of(context);
    return SizedBox(
      height: media.size.height,
      child: ListView(
        children: [

          //搜索栏
          //searchTab(name,content,filterList),
      Builder(
        builder: (BuildContext context) {return
          SizedBox(
            width: media.size.width,
            height: media.size.height * 0.09, //搜索栏主要高度定型
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                searchStatus == true
                    ?
                // 输入文本框
                Padding(
                  padding: EdgeInsets.only(left: media.size.width * 0.05,
                      right: media.size.width * 0.05),
                  child: SizedBox(
                    width: media.size.width * 0.7,
                    height: media.size.height * 0.05,
                    child: TextField(
                      onSubmitted: (text) {
                        nameFilterList=[];
                        contentFilterList=[];
                        publishedDateFilterList=[];
                        numLikesFilterList=[];
                        numCommentsFilterList=[];
                        numShareFilterList=[];
                        profilePicUrlFilterList=[];
                        // TODO: 算法问题
                        int ctr = -1;
                                for (var nameItem in name) {
                                  ctr+=1;
                                  var contentItem = content[ctr];
                                    if (nameItem.contains( _searchTextController.text) || contentItem.contains(_searchTextController.text)) {
                                      nameFilterList.add(nameItem);
                                      contentFilterList.add(content[ctr]);
                                      publishedDateFilterList.add(publishedDate[ctr]);
                                      numLikesFilterList.add(numLikes[ctr]);
                                      numCommentsFilterList.add(numComments[ctr]);
                                      numShareFilterList.add(numShare[ctr]);
                                      profilePicUrlFilterList.add(profilePicUrl[ctr]);
                                    }

                                }
                                print("Print nameFilterList Below:");
                        print(nameFilterList);
                        print("End loop -- current text bar text = { ${_searchTextController.text} }");

                        //当输入的内容不是名字Nor内容， 给提示， 返回全部results
                        if(nameFilterList.isEmpty && contentFilterList.isEmpty){
                          showAlertDialog(context,_searchTextController);
                        }

                        print("Print contentFilterList Below:");
                        print(contentFilterList);
                        print("End loop -- current text bar text = { ${_searchTextController.text} }");

                        setState(() {

                        });

                      },
                              controller: _searchTextController,
                      // 搜索栏 Rounded Corner
                      decoration: InputDecoration(
                        labelText: "Search for User or Content",
                        filled: true,
                        // Set background color
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // Adjust corner radius as needed
                          borderSide: const BorderSide(
                              color: Colors.grey), // Optional border color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // Adjust corner radius as needed
                          borderSide: const BorderSide(
                              color: Colors
                                  .blue), // Optional focus border color
                        ),
                      ),
                    ),
                  ),
                )
                    :
                //未来可以放其他filter之类的按钮， if search off的时候看到的
                SizedBox(
                  width: media.size.width * 0.7,
                  height: media.size.height * 0.05,
                  child: const Text("Seach off"),
                ),

                //搜索按钮
                GestureDetector(
                    onTap: () {
                      if (searchStatus == true) {
                        // 如果文本框有字就搜索，没有的话就关闭
                        SearchOff();
                      } else {
                        SearchOn();
                      }
                    },
                    child: searchStatus
                        ? Icon(
                      Icons.close_rounded,
                      size: media.size.width * 0.1,
                    ).animate().fade().slide()
                        : Icon(
                      Icons.search,
                      size: media.size.width * 0.1,
                    ).animate().fade().slide()),

                //最右边的padding
                SizedBox(
                  width: media.size.width * 0.05,
                ),
              ],
            ),
          );}
          ),



          // TODO: 结束---


          //内容
          ListView.builder(
              itemCount: nameFilterList.isEmpty? name.length:nameFilterList.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int ctr) {
                return ForumSinglePostWidget(
                  currentctr: ctr,
                  name: nameFilterList.isEmpty?                   name[ctr]:            nameFilterList[ctr],
                  publishedDate: publishedDateFilterList.isEmpty? publishedDate[ctr]:   publishedDateFilterList[ctr],
                  content: contentFilterList.isEmpty?             content[ctr]:         contentFilterList[ctr],
                  numLikes: numLikesFilterList.isEmpty?           numLikes[ctr]:        numLikesFilterList[ctr],
                  numComments: numCommentsFilterList.isEmpty?     numComments[ctr]:     numCommentsFilterList[ctr],
                  profilePicUrl: profilePicUrlFilterList.isEmpty? profilePicUrl[ctr]:   profilePicUrlFilterList[ctr],
                  numShare: numShareFilterList.isEmpty?           numShare[ctr]:        numShareFilterList[ctr],
                );
              }),
        ],
      ),
    );
  }

  void SearchOff() {
    setState(() {
      searchStatus = false;
      print("Search off");

      nameFilterList=[];
      contentFilterList=[];
      publishedDateFilterList=[];
      numLikesFilterList=[];
      numCommentsFilterList=[];
      numShareFilterList=[];
      profilePicUrlFilterList=[];
    });
  }

  void SearchOn() {
    setState(() {
      searchStatus = true;
      print("Search on");
    });
  }

  @override
  void initState() {
    searchStatus = true;
     name = dummyData.name;
     publishedDate = dummyData.publishedDate;
     content = dummyData.content;
     numLikes = dummyData.numLikes;
     numComments = dummyData.numComments;
     numShare = dummyData.numShare;
     profilePicUrl = dummyData.profilePicUrl;
    print("init");
  }
}
/*

class searchTab extends StatefulWidget {
  List<String> nameList;
  List<String> contentList;
  List<String> filterList;

  searchTab(this.nameList, this.contentList, this.filterList, {super.key});

  @override
  State<searchTab> createState() => _searchTabState();
}

class _searchTabState extends State<searchTab> {
  bool searchStatus = false;
  final _searchTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    return SizedBox(
      width: media.size.width,
      height: media.size.height * 0.09, //搜索栏主要高度定型
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          searchStatus == true
              ?
              // 输入文本框
              Padding(
                padding: EdgeInsets.only(left:  media.size.width * 0.05, right: media.size.width * 0.05),
                child: SizedBox(
                  width: media.size.width * 0.7,
                  height: media.size.height * 0.05,
                  child: TextField(
                    onChanged: (text)
                        {
                          widget.nameList.forEach((nameItem) {
                            if(nameItem.contains(_searchTextController.text)){
                              print(nameItem);



                            }});
                          widget.nameList.forEach((contentItem) => {
                          });
                        },
                    controller: _searchTextController,
                    // 搜索栏 Rounded Corner
                    decoration: InputDecoration(
                      labelText: "Search for User or Content",
                      filled: true, // Set background color
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        // Adjust corner radius as needed
                        borderSide: const BorderSide(
                            color: Colors.grey), // Optional border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        // Adjust corner radius as needed
                        borderSide: const BorderSide(
                            color: Colors
                                .blue), // Optional focus border color
                      ),
                    ),
                  ),
                ),
              )
              :
              //未来可以放其他filter之类的按钮， if search off的时候看到的
              SizedBox(
                  width: media.size.width * 0.7,
                  height: media.size.height * 0.05,
                  child: const Text("Seach off"),
                ),

          //搜索按钮
          GestureDetector(
              onTap: () {
                if (searchStatus == true) {
                  // 如果文本框有字就搜索，没有的话就关闭
                  SearchOff();
                } else {
                  SearchOn();
                }
              },
              child: searchStatus
                  ? Icon(
                      Icons.close_rounded,
                      size: media.size.width * 0.1,
                    ).animate().fade().slide()
                  : Icon(
                      Icons.search,
                      size: media.size.width * 0.1,
                    ).animate().fade().slide()),

          //最右边的padding
          SizedBox(
            width: media.size.width * 0.05,
          ),
        ],
      ),
    );
  }

  void SearchOff() {
    setState(() {
      searchStatus = false;
      print("Search off");
    });
  }

  void SearchOn() {
    setState(() {
      searchStatus = true;
      print("Search on");
    });
  }

  @override
  void initState() {
    searchStatus = true;
    print("init");
  }
}
*/


void showAlertDialog(BuildContext context,_textController) {

  String title = "Search Result";
  String content = "No result for ${_textController.text}";
  List<Widget> actions = [
    TextButton(
      onPressed: () => Navigator.pop(context), // Close the dialog
      child: Text('Ok'),
    ),
  ];

  // Show the dialog
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: actions,
        );
      });
}

// void showAutoDismissAlert(BuildContext context, String message, {int duration = 3}) {
//   // Create alert content
//   String content = message;
//
//   // Show the dialog with a timer
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Text(content),
//         );
//       }).then((_) => Future.delayed(
//       Duration(seconds: duration), // Adjust duration as needed
//           () => Navigator.pop(context))); // Close the dialog after delay
// }
