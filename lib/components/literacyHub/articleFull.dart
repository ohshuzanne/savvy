import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/components/showdialog.dart';
import '../InteractedWidget/BookmarkIcon.dart';
import '../InteractedWidget/FavouriteIcon.dart';
import '../InteractedWidget/ProfilePicWidget.dart';
import '../InteractedWidget/ShareIcon.dart';
import '../InteractedWidget/YoutubeIcon.dart';
import '../buttons.dart';
import 'articleSummaryAI.dart';

class articlefull extends StatefulWidget {
  final String authorName;
  final String authorProfilePic;
  final String publishedDate;
  final String title;
  final String content;
  final String hashtag;
  final String pic;

  articlefull({
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

  late bool summaryYes = false;

  @override
  State<articlefull> createState() => _articlefullState();
}

class _articlefullState extends State<articlefull> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.summaryYes = false;
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    widget.summaryYes = true;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
            const Text(
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
            width: media.size.width * articlefull.left_Padding,
          ),

          //主要内容
          Expanded(
            child: ListView(
              addAutomaticKeepAlives: true,
              children: [
                //标题
                Center(
                    child: Text(
                  widget.title,
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
                      picUrl: widget.authorProfilePic,
                      //头像
                      width: media.size.width * articlefull.profilePix_Ratio,
                      height: media.size.width * articlefull.profilePix_Ratio,
                    ),

                    //space between profile pic and name/time
                    const SizedBox(
                      width: 10,
                      height: 0,
                    ),

                    //名字和时间
                    SizedBox(
                      height: media.size.width * articlefull.profilePix_Ratio,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.authorName,
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lexend'),
                          ),
                          Text(
                            widget.publishedDate,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Container(
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
                      child: widget.summaryYes
                          ? SummuryArticle(content: widget.content)
                          : media.size.width > 500
                              ?

                              // Fixing Overflow

                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30.0,top: 30,bottom: 30
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "lib/images/3dcat.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                    FutureBuilder(
                                        future: fakeDelay(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot snapshot) {
                                          if (snapshot.hasData) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceEvenly,
                                              children: [
                                                const Text(
                                                  "\t  Meow..! Do You Want Maomi To \n\t  Summarise this article for you?",
                                                  style: TextStyle(
                                                      fontFamily: 'Lexend',
                                                      fontSize: 11),
                                                ),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.only(
                                                            left: 10)),
                                                PrimaryButton(
                                                  onTap: () {
                                                    setState(() {
                                                      widget.summaryYes =
                                                          true;
                                                    });
                                                  },
                                                  buttonText: 'Yes',
                                                  buttonColor: darkBlue,
                                                  borderColor:
                                                      primaryPurple,
                                                  textColor: lightBlue,
                                                  borderRadius: 4,
                                                  splashColor:
                                                      lighterYellow,
                                                ),
                                              ],
                                            );
                                          } else {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.only(
                                                      left: 5.0),
                                              child: SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: Lottie.asset(
                                                      "lib/images/chat.json")),
                                            );
                                          }
                                        })
                                  ],
                                ),
                              )
                              :


                              // Phone layout
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,bottom: 20
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "lib/images/3dcat.png",
                                          width: 40,
                                          height: 40,
                                        ),
                                        FutureBuilder(
                                            future: fakeDelay(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot snapshot) {
                                              if (snapshot.hasData) {
                                                return const Text(
                                                  "\t  Meow..! Do You Want Maomi To \n\t  Summarise this article for you?",
                                                  style: TextStyle(
                                                      fontFamily: 'Lexend',
                                                      fontSize: 11),
                                                );
                                              } else {
                                                return Lottie.asset(
                                                    "lib/images/chat.json",width: 40,height: 40);
                                              }

                                            })
                                      ],
                                    ),
                                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                                    PrimaryButton(
                                      onTap: () {
                                        setState(() {
                                          widget.summaryYes = true;
                                        });
                                      },
                                      buttonText: 'Yes',
                                      buttonColor: darkBlue,
                                      borderColor: primaryPurple,
                                      textColor: lightBlue,
                                      borderRadius: 40,
                                      splashColor: lighterYellow,
                                    ),
                                  ],
                                ),
                              )),
                ),

                //内容
                Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.network(widget.pic)),

                Padding(
                  padding: EdgeInsets.only(
                      left: media.size.width *
                          articlefull.context_lect_right_Padding,
                      right: media.size.width *
                          articlefull.context_lect_right_Padding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Text(widget.content,
                          style: const TextStyle(fontSize: 12,fontFamily: 'Lexend'),
                          textAlign: TextAlign.justify),

                      //总结
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10),
                        child: Text(
                          "Summary",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'Lexend'),
                        ),
                      ),
                      const Text(
                          "list all your debts with amounts owed and interest rates. This will help you prioritize your repayment plan. There are different strategies, like the snowball method (pay off smallest debts first for quick wins) or the avalanche method (prioritize high-interest debts to save money).",
                          style: TextStyle(fontFamily: 'Lexend',fontSize: 12),
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
            width: media.size.width * articlefull.right_Padding,
          ),
        ],
      ),
    );
  }

  Future fakeDelay() async {
    await Future.delayed(const Duration(milliseconds: 1800));
    return true;
  }

  @override
  bool get wantKeepAlive => true;
}
