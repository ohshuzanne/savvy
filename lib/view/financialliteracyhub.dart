import 'package:flutter/material.dart';
import 'package:savvy/components/InteractedWidget/ProfilePicWidget.dart';
import '../CRUD/create.dart';
import '../CRUD/read.dart';
import '../components/Hub/ArticleFull.dart';
import '../components/InteractedWidget/BookmarkIcon.dart';
import '../dummyData.dart';
import '../utils/colors.dart';
import 'package:savvy/components/showdialog.dart';

class FinancialLiteracyHub extends StatelessWidget {
  const FinancialLiteracyHub({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Classifications.values.length,
      child: Scaffold(
        //TODO: 测试Firebase而已的FLOATINGACTIONBUTTON,if上传完了可以清
        floatingActionButton: FloatingActionButton(
            onPressed: () => initialDataToFirebase()),
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
            isScrollable: true,
            // Optional for many tabs
            tabs: [
              Tab(
                icon: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text("For you",
                      style: TextStyle(
                        fontFamily: 'Lexend',
                      )),
                ),
              ),
              Tab(
                icon: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text("Following",
                      style: TextStyle(
                        fontFamily: 'Lexend',
                      )),
                ),
              ),
              Tab(
                icon: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text("Debt Management Strategies",
                      style: TextStyle(
                        fontFamily: 'Lexend',
                      )),
                ),
              ),
              Tab(
                icon: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text("Financial Planning",
                      style: TextStyle(
                        fontFamily: 'Lexend',
                      )),
                ),
              ),
              Tab(
                icon: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text("financial Products And Services",
                      style: TextStyle(
                        fontFamily: 'Lexend',
                      )),
                ),
              ),
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
          children: [
            Center(
                child: ArticlesListView(
              classification: Classifications.forYou,
            )), //forYou,followong,debtManageStractegies,financialPlanning
            Center(
                child: ArticlesListView(
              classification: Classifications.followong,
            )),
            Center(
                child: ArticlesListView(
              classification: Classifications.debtManageStractegies,
            )),
            Center(
                child: ArticlesListView(
              classification: Classifications.financialPlanning,
            )),
            Center(
                child: ArticlesListView(
              classification: Classifications.financialProductsAndServices,
            )),
          ],
        ),
      ),
    );
  }
}

class ArticlesListView extends StatelessWidget {
  final classification;

  ArticlesListView({
    super.key,
    this.classification,
  });

  late List authorNameList = [];
  late List authorProfilePicList = [];
  late List publishedDateList = [];
  late List titleList = [];
  late List contentList = [];
  late List hashtagList = [];
  late List picList = [];

  @override
  Widget build(BuildContext context) {
    // DummyArticle dummyArticle = DummyArticle();
    // dummyArticle.getData(classification);


    MediaQueryData media = MediaQuery.of(context);

    return SizedBox(
        height: media.size.height,
        child: FutureBuilder(
          future: getArticlesByCategorie(classification),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              for (var doc in snapshot.data){
            authorNameList.add(doc["authorName"]);
            publishedDateList.add(doc["publishedDate"]);
            contentList.add(doc["title"]);
            titleList.add(doc["publishedDate"]);
            hashtagList.add(doc["hashtag"]);
            picList.add(doc["pic"]);
            authorProfilePicList.add(doc["authorProfilePic"]);
              }
              return ListView(
                children: [
                  ListView.builder(
                    itemCount: authorNameList.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int ctr) {
                      return ArticleOverview(
                        authorName: authorNameList[ctr],
                        authorProfilePic: authorProfilePicList[ctr],
                        publishedDate: publishedDateList[ctr],
                        title: titleList[ctr],
                        content: contentList[ctr],
                        hashtag: hashtagList[ctr],
                        pic: picList[ctr],
                      );
                    },
                  )
                ],
              );
            }
            // else if (!snapshot.hasData) {
            //   return Padding(
            //         padding: EdgeInsets.only(top: media.size.height * 0.35),
            //         child: const Center(
            //
            //             child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Text(
            //               "Currently No Data here.\nExplore other classification\nor follow some other authors",
            //               style: TextStyle(
            //                 fontFamily: 'Lexend',
            //                 fontSize: 14,
            //               ),
            //               textAlign: TextAlign.center,
            //             ),
            //             Icon(Icons.mobiledata_off_rounded),
            //           ],
            //         )),
            //       );
            // }

            else if (snapshot.hasError) {
              print("HAS ERROR");
              return const Text("Has Error");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

class ArticleOverview extends StatelessWidget {
  var authorName;
  var authorProfilePic;
  var publishedDate;
  var title;
  var content;
  var hashtag;
  var pic;

  ArticleOverview(
      {super.key,
      required this.authorName,
      required this.authorProfilePic,
      required this.publishedDate,
      required this.title,
      required this.content,
      required this.hashtag,
      required this.pic});

  static const double left_padding = 0.07;
  static const double right_padding = 0.0;
  static const double content_Ratio = 0.8;
  static const double image_Ratio = 0.115;
  static const double padding_between_content_and_image = 0.017;

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    return InkWell(
      hoverColor: lighterBlue, // Color on hover
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Articlefull(
                authorName: authorName,
                publishedDate: publishedDate,
                content: content,
                title: title,
                hashtag: hashtag,
                pic: pic,
                authorProfilePic: authorProfilePic)),
      ),
      child: MouseRegion(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                  height: 200, //Fixed Height as Medium
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //文章and 其他
                      SizedBox(
                        width: media.size.width * content_Ratio,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: media.size.width * left_padding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //头像 \t 名字 \t 日期
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ProfilePicture(
                                    picUrl: authorProfilePic,
                                    width: media.size.width * 0.075,
                                    height: media.size.width * 0.075,
                                  ),
                                  SizedBox(
                                    width: media.size.width * 0.02,
                                  ),
                                  Text(
                                    authorName,
                                    style: const TextStyle(
                                        fontFamily: 'Lexend',
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: media.size.width * 0.02,
                                  ),
                                  Text(
                                    publishedDate,
                                    style: const TextStyle(
                                        fontFamily: 'Lexend',
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),

                              // 标题 \H1
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 4.0,
                                  bottom: 4.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: media.size.width *
                                          (content_Ratio - left_padding),
                                      child: Text(
                                        title,
                                        maxLines: 2, // Limit to 2 lines
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //文章 \p1
                              Text(
                                truncateString(content),
                                style: const TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                              ),

                              // #tag 标签 ... more 按钮
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //标签 大类
                                  Text("#$hashtag",
                                      style: const TextStyle(
                                          fontFamily: 'Lexend',
                                          color: darkGrey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.italic)),

                                  //按钮 大类
                                  BookmarkIcon(
                                    numBookmarked: 1,
                                  ),
                                ],
                              ),

                              //padding and 下滑线
                            ],
                          ),
                        ),
                      ),

                      //Padding between 内容和照片
                      SizedBox(
                        width: media.size.width *
                            padding_between_content_and_image,
                      ),

                      //照片 最右边padding
                      SizedBox(
                        width: media.size.width * (image_Ratio + right_padding),
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: media.size.width * right_padding,
                          ),
                          child: Image.network(pic),
                        ),
                      ),
                    ],
                  )),
            ),
            //下划线
            Container(
                color: Colors.black12,
                child: SizedBox(
                  height: 0.5,
                  width: media.size.width * 0.9,
                )),
          ],
        ),
      ),
    );
  }
}

String truncateString(String text, {int maxLength = 200}) {
  if (text.length <= maxLength) return "$text\n";
  return "${text.substring(0, maxLength)}...";
}
