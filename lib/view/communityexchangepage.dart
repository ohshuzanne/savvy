import 'package:flutter/material.dart';
import 'package:savvy/Constants/Colors.dart';

import '../Hub/ArticleFull.dart';
import '../InteractedWidget/BookmarkIcon.dart';
import '../InteractedWidget/ProfilePicWidget.dart';
import '../dummyData.dart';
import '../utils/colors.dart';

class FinancialLiteracyHub extends StatelessWidget {
  const FinancialLiteracyHub({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
        length: 7, // Adjust the length based on your number of tabs
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true, // Optional for many tabs
              /*indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                // Set border radius for round tabs
                color: Colors.blue, // Customize indicator color
              ),*/
              tabs: const [
                Tab(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("For you"),
                  ),
                ),
                Tab(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("Following"),
                  ),
                ),
                Tab(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("Debt Management Strategies"),
                  ),
                ),
                Tab(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("Financial Planning"),
                  ),
                ),
                Tab(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("Building Your Financial Literacy"),
                  ),
                ),
                Tab(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("Financial Products and Services"),
                  ),
                ),
                Tab(
                  icon: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(Icons.explore)),
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
          body: const TabBarView(
            children: [
              Center(child: ArticlesListView(classification: Classifications.forYou,)), //forYou,followong,debtManageStractegies,financialPlanning
              Center(child: ArticlesListView(classification: Classifications.followong,)),
              Center(child: ArticlesListView(classification: Classifications.debtManageStractegies,)),
              Center(child: ArticlesListView(classification: Classifications.financialPlanning,)),
              Center(child: Text('Settings')),
              Center(child: Text('Settings')),
              Center(child: Text('Settings')),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticlesListView extends StatelessWidget {
  final classification;

  const ArticlesListView({
    super.key,
    this.classification,
  });

  @override
  Widget build(BuildContext context) {
    DummyArticle dummyArticle = DummyArticle();
    dummyArticle.getData(classification);

    late List authorName = dummyArticle.authorName;
    late List authorProfilePic = dummyArticle.authorProfilePic;
    late List publishedDate = dummyArticle.publishedDate;
    late List title = dummyArticle.title;
    late List content = dummyArticle.content;
    late List hashtag = dummyArticle.hashtag;
    late List pic = dummyArticle.pic;

    MediaQueryData media = MediaQuery.of(context);

    return SizedBox(
      height: media.size.height,
      child: ListView(
        children: [

          //检查是否有dummydata 并输出
          dummyArticle.authorName.isEmpty?
          Padding(
            padding: EdgeInsets.only(top:media.size.height*0.35),
            child: const Center(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Currently No Data here.\nExplore other classification or follow some other author",textAlign: TextAlign.center,),
                Icon(Icons.mobiledata_off_rounded),
              ],
            )),
          ):
          ListView.builder(
              itemCount: authorName.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int ctr) {
                return ArticleOverview(
                  authorName: authorName[ctr],
                  authorProfilePic: authorProfilePic[ctr],
                  publishedDate: publishedDate[ctr],
                  title: title[ctr],
                  content: content[ctr],
                  hashtag: hashtag[ctr],
                  pic: pic[ctr],
                );

                },),
        ],
      ),
    );
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
      hoverColor: ColorClass.lighterBlue, // Color on hover
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
                  height: 180, //Fixed Height as Medium
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //文章and 其他
                      SizedBox(
                        width: media.size.width * content_Ratio,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: media.size.width * left_padding),
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
                                        fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: media.size.width * 0.02,
                                  ),
                                  Text(
                                    publishedDate,
                                    style: const TextStyle(
                                        fontSize: 11, fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),

                              // 标题 \H1
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: media.size.width * (content_Ratio-left_padding),
                                      child: Text(
                                        title,
                                        style: const TextStyle(
                                            fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //文章 \p1
                              Text(
                                truncateString(content),
                                style: const TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w400),
                              ),

                              // #tag 标签 ... more 按钮
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //标签 大类
                                  Text("#$hashtag",
                                      style: const TextStyle(
                                          fontSize: 11,
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
                      SizedBox(width:media.size.width * padding_between_content_and_image,),


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
            Container(color: Colors.black12,child: SizedBox(height: 0.5,width: media.size.width*0.9,)),
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
