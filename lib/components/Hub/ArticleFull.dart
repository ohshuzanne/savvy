import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/components/showdialog.dart';
import '../InteractedWidget/BookmarkIcon.dart';
import '../InteractedWidget/FavouriteIcon.dart';
import '../InteractedWidget/ProfilePicWidget.dart';
import '../InteractedWidget/ShareIcon.dart';
import '../InteractedWidget/YoutubeIcon.dart';
import 'articleSummuryAI.dart';

class Articlefull extends StatelessWidget {
  final String authorName;
  final String authorProfilePic;
  final String publishedDate;
  final String title;
  final String content;
  final String hashtag;
  final String pic;

  const Articlefull({
    required this.authorName,
    required this.publishedDate,
    required this.content,
    required this.title,
    required this.hashtag,
    required this.pic,
    required this.authorProfilePic,
    super.key,
  });

  static const left_Padding = 0.075;
  static const right_Padding = 0.075;
  static const context_lect_right_Padding = 0.025;
  static const profilePix_Ratio = 0.13;

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    return Scaffold(
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
            icon: const Icon(Icons.info_outline_rounded,
                size: 22, color: Colors.white),
          ),
        ],
      ),
      body: Row(
        children: [
          //左Indent
          SizedBox(
            width: media.size.width * left_Padding,
          ),

          //主要内容
          Expanded(
            child: ListView(
              children: [
                //标题
                Center(
                    child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend'),
                )),

                const Padding(padding: EdgeInsets.only(bottom: 35)),

                //头像 名字 发布时间
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfilePicture(
                      picUrl: authorProfilePic,
                      //头像
                      width: media.size.width * profilePix_Ratio,
                      height: media.size.width * profilePix_Ratio,
                    ),

                    //space between profile pic and name/time
                    const SizedBox(
                      width: 10,
                      height: 0,
                    ),

                    //名字和时间
                    SizedBox(
                      height: media.size.width * profilePix_Ratio,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            authorName,
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lexend'),
                          ),
                          Text(
                            publishedDate,
                            style: const TextStyle(
                                fontSize: 13,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //--------------
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 5),
                  child: Container(
                      color: Colors.black12,
                      child: SizedBox(
                        height: 0.5,
                        width: media.size.width * 0.8,
                      )),
                ),

                //按钮
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      YoutubeIcon(
                        link: "https://www.youtube.com/watch?v=hsvdDrksp-s",
                      ),
                      FavouritedIcon(numLikes: 100),
                      BookmarkIcon(numBookmarked: 10),
                      ShareIcon(numShare: 2),
                    ],
                  ),
                ),

                //-------------
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 25),
                  child: Container(
                      color: Colors.black12,
                      child: SizedBox(
                        height: 0.5,
                        width: media.size.width * 0.8,
                      )),
                ),

                //TODO: GENERATIVE AI

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: lightBlue.withOpacity(0.5),
                        // Shadow color (adjustable)
                        blurRadius: 1.0,
                        // Adjust shadow blur
                        spreadRadius: -3.0,
                        // Negative spread for inner shadow effect
                        offset: const Offset(
                            -1.0, -1.0), // No offset for centered shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder(
                      future:
                          getResponeFromGemini(contentToBeSummarized: content),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var jsonResponse = jsonDecode(snapshot.data);
                          int responseLength = jsonResponse.length;
                          print("Genimi respone : $jsonResponse");
                          print("Genimi respone : ${jsonResponse.length}");
                          return ListView.builder(
                            itemCount: responseLength,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int ctr) {
                              print("Genimi respone in list view : ${jsonResponse[ctr]['title']},");
                              return Padding(
                                padding: const EdgeInsets.only(left: 5, right: 5),
                                child: Column(children: [
                                  Text(
                                    "${jsonResponse[ctr]['title']}",
                                    style: const TextStyle(
                                        fontFamily: 'Legend', fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                  Text("${jsonResponse[ctr]['content']}",textAlign: TextAlign.justify, style: const TextStyle(
                                      fontFamily: 'Lexend', fontSize: 12),),
                                  const Text('\n'),
                                ]),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          print(snapshot.error);
                          return const Text(
                              'Sorry, AI Function does not work at this moment, Try again later..', style: TextStyle(
                              fontFamily: 'Lexend', fontSize: 12),);
                        } else {
                          // return const CircularProgressIndicator();
                          return SizedBox(
                              width: 70,
                              height: 70,
                              child: Row(
                                children: [
                                  Image.asset(
                                    "lib/images/3dcat.png",
                                    width: 40,
                                    height: 40,
                                  ),
                                  const Text(
                                    "\t  Maomi is summarizing for you",
                                    style: TextStyle(
                                        fontFamily: 'Lexend', fontSize: 12),
                                  ),
                                  Lottie.asset('lib/images/typing_lottie.json'),
                                ],
                              ));
                        }
                      },
                    ),
                  ),
                ),

                //内容
                Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.network(pic)),

                Padding(
                  padding: EdgeInsets.only(
                      left: media.size.width * context_lect_right_Padding,
                      right: media.size.width * context_lect_right_Padding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Text(content,
                          style: const TextStyle(fontFamily: 'Lexend'),
                          textAlign: TextAlign.justify),

                      //总结
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10),
                        child: Text(
                          "Summary",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Lexend'),
                        ),
                      ),
                      const Text(
                          "list all your debts with amounts owed and interest rates. This will help you prioritize your repayment plan. There are different strategies, like the snowball method (pay off smallest debts first for quick wins) or the avalanche method (prioritize high-interest debts to save money).",
                          style: TextStyle(fontFamily: 'Lexend'),
                          textAlign: TextAlign.justify),
                    ],
                  ),
                ),

                //结束padding
                const Padding(padding: EdgeInsets.only(top: 50))
              ],
            ),
          ),

          //右Indent
          SizedBox(
            width: media.size.width * right_Padding,
          ),
        ],
      ),
    );
  }
}
