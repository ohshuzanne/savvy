import 'dart:math';

import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/components/showdialog.dart';
import '../InteractedWidget/BookmarkIcon.dart';
import '../InteractedWidget/FavouriteIcon.dart';
import '../InteractedWidget/ProfilePicWidget.dart';
import '../InteractedWidget/ShareIcon.dart';
import '../InteractedWidget/YoutubeIcon.dart';

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
                      Text(
//                           """
// Debt can feel like a heavy weight on your shoulders, but it doesn't have to control your life. Debt management is the process of taking charge of your outstanding balances and developing a plan to pay them off. By implementing effective strategies and maintaining discipline, you can achieve financial freedom and peace of mind.
//
// The first step to successful debt management is understanding your financial situation. Create a comprehensive list of all your debts, including the amount owed, interest rates, and minimum payments. This will give you a clear picture of your financial obligations and help you prioritize your repayment efforts.
//
// Once you have a grasp of your debt situation, you can explore various debt management strategies. Popular methods include the snowball and avalanche methods. The snowball method focuses on paying off the smallest debts first, regardless of interest rate, to gain momentum and achieve quick wins. The avalanche method prioritizes paying off debts with the highest interest rates first to minimize the total amount of interest paid over time.
//                 """
                          content,
                          style: TextStyle(fontFamily: 'Lexend'),
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
