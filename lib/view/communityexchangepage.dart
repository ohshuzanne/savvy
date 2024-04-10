import 'package:flutter/material.dart';
import 'package:savvy/CRUD/read.dart';
import 'package:savvy/components/gradient_background.dart';
import 'package:savvy/components/showdialog.dart';
import 'package:savvy/dummyData.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../components/Forum/ForumSinglePostWidget.dart';
import '../utils/colors.dart';
import 'addpostcommunityexchangepage.dart';

class CommunityExchangePage extends StatefulWidget {
  CommunityExchangePage({super.key});

  @override
  State<CommunityExchangePage> createState() => _CommunityExchangePageState();
}

class _CommunityExchangePageState extends State<CommunityExchangePage> {
  int postNumber = 10;
  bool searchStatus = false;
  bool initializeIsDone = false;

  late List<String> name = [];
  late List<String> docID = [];
  late List<DateTime> publishedDate = [];
  late List<String> content = [];
  late List<int> numLikes = [];
  late List<int> numComments = [];
  late List<int> numShare = [];
  late List<String> profilePicUrl = [];

  List<String> nameFilterList = [];
  List<String> contentFilterList = [];
  List<DateTime> publishedDateFilterList = [];

  List<int> numLikesFilterList = [];

  List<int> numCommentsFilterList = [];
  List<int> numShareFilterList = [];
  List<String> profilePicUrlFilterList = [];

  @override
  Widget build(BuildContext context) {
    final _searchTextController = TextEditingController();

    MediaQueryData media = MediaQuery.of(context);
    return Scaffold(
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
            icon: const Icon(
              Icons.info_outline_rounded,
              size: 22,
              color: Colors.white,
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: FloatingActionButton(
          shape: CircleBorder(),
          child: Icon(Icons.add_outlined),
          onPressed: () {
            goAddPostPage(context);
          },),
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
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: media.size.height,
            child: ListView(
              children: [
                //搜索栏
                //searchTab(name,content,filterList),
                Builder(builder: (BuildContext context) {
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
                                padding: EdgeInsets.only(
                                    left: media.size.width * 0.05,
                                    right: media.size.width * 0.05),
                                child: SizedBox(
                                  width: media.size.width * 0.7,
                                  height: media.size.height * 0.05,
                                  child: TextField(
                                    onSubmitted: (text) {
                                      nameFilterList = [];
                                      contentFilterList = [];
                                      publishedDateFilterList = [];
                                      numLikesFilterList = [];
                                      numCommentsFilterList = [];
                                      numShareFilterList = [];
                                      profilePicUrlFilterList = [];

                                      int ctr = -1;
                                      for (var nameItem in name) {
                                        ctr += 1;
                                        var contentItem = content[ctr];
                                        if (nameItem.contains(_searchTextController.text) ||contentItem.contains(_searchTextController.text)) {
                                          nameFilterList.add(nameItem);
                                          contentFilterList.add(content[ctr]);
                                          publishedDateFilterList.add(publishedDate[ctr]);
                                          numLikesFilterList.add(numLikes[ctr]);
                                          numCommentsFilterList.add(numComments[ctr]);
                                          numShareFilterList.add(numShare[ctr]);
                                          profilePicUrlFilterList.add(profilePicUrl[ctr]);
                                        }
                                      }

                                      //当输入的内容不是名字Nor内容， 给提示， 返回全部results
                                      if (nameFilterList.isEmpty &&
                                          contentFilterList.isEmpty) {
                                        showAlertDialog(
                                            context, _searchTextController);
                                      }

                                      setState(() {});
                                    },
                                    controller: _searchTextController,
                                    // 搜索栏 Rounded Corner
                                    decoration: InputDecoration(
                                      labelText: "Search for User or Content",
                                      filled: true,
                                      // Set background color
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        // Adjust corner radius as needed
                                        borderSide: const BorderSide(
                                            color: Colors
                                                .grey), // Optional border color
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                // child: Extra function
                              ),

                        //搜索按钮
                        GestureDetector(
                            onTap: () {
                              if (searchStatus == true) {
                                SearchOff();
                              } else {
                                SearchOn();
                              }
                            },
                            child: searchStatus
                                ? Icon(
                                    Icons.close_rounded,
                                    size: media.size.width * 0.06,
                                  ).animate().fade().slide()
                                : Icon(
                                    Icons.search,
                                    size: media.size.width * 0.06,
                                  ).animate().fade().slide()),

                        //最右边的padding
                        SizedBox(
                          width: media.size.width * 0.05,
                        ),
                      ],
                    ),
                  );
                }),

                //内容
                StreamBuilder(
                  stream:firestore.collection('communityExchange').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final comments = snapshot.data?.docs;
                      if (comments!.isNotEmpty) {
                      for (var comment in comments) {
                          docID.add(comment.id);
                          name.add(comment['name']);
                          publishedDate.add(comment['publishedDate'].toDate());
                          content.add(comment['content']);
                          numLikes.add(comment['numLikes']);
                          numComments.add(comment['numComments']);
                          numShare.add(comment['numShare']);
                          profilePicUrl.add(comment['profilePicUrl']);
                      }
                      return ListView.builder(
                          itemCount: nameFilterList.isEmpty
                              ? name.length
                              : nameFilterList.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (BuildContext context, int ctr) {
                            return ForumSinglePostWidget(
                              communityExchangeDocID: docID,
                              name: nameFilterList.isEmpty
                                  ? name[ctr]
                                  : nameFilterList[ctr],
                              publishedDate: publishedDateFilterList.isEmpty
                                  ? publishedDate[ctr]
                                  : publishedDateFilterList[ctr],
                              content: contentFilterList.isEmpty
                                  ? content[ctr]
                                  : contentFilterList[ctr],
                              numLikes: numLikesFilterList.isEmpty
                                  ? numLikes[ctr]
                                  : numLikesFilterList[ctr],
                              numComments: numCommentsFilterList.isEmpty
                                  ? numComments[ctr]
                                  : numCommentsFilterList[ctr],
                              profilePicUrl: profilePicUrlFilterList.isEmpty
                                  ? profilePicUrl[ctr]
                                  : profilePicUrlFilterList[ctr],
                              numShare: numShareFilterList.isEmpty
                                  ? numShare[ctr]
                                  : numShareFilterList[ctr],
                            );
                          });

                      }
                      else{
                        print('Done Loading but no data');
                        return Center(child: Text('Done Loading but no data'));
                      }
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error fetching comments'));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void SearchOff() {
    setState(() {
      searchStatus = false;

      nameFilterList = [];
      contentFilterList = [];
      publishedDateFilterList = [];
      numLikesFilterList = [];
      numCommentsFilterList = [];
      numShareFilterList = [];
      profilePicUrlFilterList = [];
    });
  }

  void SearchOn() {
    setState(() {
      searchStatus = true;
    });
  }

  @override
  void initState() {
    searchStatus = false;
  }
}

goAddPostPage(context) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddPost(),
  ));
}

void showAlertDialog(BuildContext context, _textController) {
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
