import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:savvy/components/InteractedWidget/FavouriteIcon.dart';
import 'package:savvy/components/textfield.dart';
import 'package:savvy/utils/colors.dart';
import 'dart:math' as math;

import '../../dummyData.dart';
import '../../utils/color.dart';
import '../InteractedWidget/ProfilePicWidget.dart';
import 'ForumSinglePostWidget.dart';

class commentPage extends StatefulWidget {
  final currentctr;

  const commentPage(this.currentctr, {super.key});

  @override
  _commentPageState createState() => _commentPageState();
}

class _commentPageState extends State<commentPage> {
  final TextEditingController _textController = TextEditingController();
  int numComment = 10; //newdata will be 11

  DummyData dummyData = DummyData();
  late List<String> name = dummyData.name;
  late List<DateTime> publishedDate = dummyData.publishedDate;
  late List<String> content = dummyData.content;
  late List<int> numLikes = dummyData.numLikes;
  late List<int> numComments = dummyData.numComments;
  late List<int> numShare = dummyData.numShare;
  late List<String> profilePicUrl = dummyData.profilePicUrl;

  DummyComments dummyComments = DummyComments();
  late List<String> commentName = dummyComments.name;
  late List<DateTime> commentPublishedDate = dummyComments.publishedDate;
  late List<String> commentContent = dummyComments.debtManagementComments;
  late List<int> commentnumLikes = dummyComments.numLikes;
  late List<String> commentprofilePicUrl = dummyComments.profilePicUrl;

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    return Scaffold(
      body: Stack(children: <Widget>[
        Column(
          children: [
            Expanded(
              child: ListView(children: <Widget>[
                AppBar(
                  leading: const BackButton(),
                  title: const Text(
                    'CommentPage',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: const Color(0x00cde0ff),
                ),

                //背景墙
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Container background color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        // Shadow color (with transparency)
                        offset: const Offset(2.0, 2.0),
                        // Shadow offset (x, y)
                        blurRadius: 5.0,
                        // Shadow blur radius
                        spreadRadius: 1.0, // Shadow spread radius (optional)
                      ),
                    ],
                  ),

                  //主帖子
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ForumSinglePostWidget(
                      currentctr: widget.currentctr,
                      name: name[widget.currentctr],
                      publishedDate: publishedDate[widget.currentctr],
                      content: content[widget.currentctr],
                      numLikes: numLikes[widget.currentctr],
                      numComments: numComments[widget.currentctr],
                      profilePicUrl: profilePicUrl[widget.currentctr],
                      numShare: numShare[widget.currentctr],
                    ),
                  ),
                ),

                //留言区
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: numComment,
                    itemBuilder: (BuildContext context, int ctr) {
                      return CommentPostWidget(
                        name: commentName[ctr],
                        profilePicUrl: commentprofilePicUrl[ctr],
                        publishedDate: commentPublishedDate[ctr],
                        content: commentContent[ctr],
                        numLikes: commentnumLikes[ctr],
                      );
                    }),
                SizedBox(
                  height: media.size.height * 0.1,
                ),
              ]),
            ),
          ],
        ),

        //输入区
        Positioned(
          bottom: 0,
          // Position at the bottom
          left: 0.0,
          // Position at the left (adjust for centering if needed)
          right: 0.0,
          // Span the entire width

          child: Container(
            decoration: BoxDecoration(
              color: darkBlue.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            height: 80,
            // Optional background color for the row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  child: PrimaryTextField(
                      controller: _textController,
                      hintText: "Enter your comment...",
                      obscureText: false),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundWhite,
                    shape: const CircleBorder(),
                    padding: EdgeInsets.zero, // Remove default padding
                  ),
                  onPressed: () {
                    // Access the entered text using the controller
                    String enteredText = _textController.text;
                    reRender();
                    print('Entered Text: $enteredText');
                  },
                  child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..rotateZ(-45.0 * math.pi / 180.0),
                      child: const Icon(Icons.send, color: darkBlue)),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    _textController
        .dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    name = dummyData.name;
    dummyData.publishedDate;
    content = dummyData.content;
    numLikes = dummyData.numLikes;
    numComments = dummyData.numComments;
    numShare = dummyData.numShare;
    profilePicUrl = dummyData.profilePicUrl;

    commentName = dummyComments.name;
    commentPublishedDate = dummyComments.publishedDate;
    commentContent = dummyComments.debtManagementComments;
    commentnumLikes = dummyComments.numLikes;
    commentprofilePicUrl = dummyComments.profilePicUrl;
  }

  void reRender() {
    setState(() {
      numComment += 1;
      commentName.add("NewCommentName");
      commentprofilePicUrl.add(
          "https://static.vecteezy.com/system/resources/thumbnails/019/900/322/small_2x/happy-young-cute-illustration-face-profile-png.png");
      commentPublishedDate.add(DateTime.now());
      commentContent.add(_textController.text);
      commentnumLikes.add(0);
      _textController.text = "";
      print("Re-rendered");
    });
  }
}

class CommentPostWidget extends StatelessWidget {
  const CommentPostWidget(
      {super.key,
      this.name,
      this.publishedDate,
      this.content,
      this.numLikes,
      this.numComments,
      this.profilePicUrl});

  final name;
  final publishedDate;
  final content;
  final numLikes;
  final numComments;
  final profilePicUrl;

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    double profilePicRatioSize = 0.11; //13 -> 11
    double screenLeftPaddingRatio = 0.10;
    double spaceBetweenProfileAndContent = 0.03;
    double contentRatioSize = 0.6;
    double contentRatioSizeAndLikes = contentRatioSize + 0.12;

    double contentFontSize = 12;
    double nameAndTimeFontSize = 12;

    return Padding(
      padding: EdgeInsets.only(
        top: media.size.height * 0.01,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0), // Adjust corner radius
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2.0, // Adjust shadow spread
              blurRadius: 4.0, // Adjust shadow blur
              offset: Offset(0.0, 4.0), // Adjust shadow offset
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top:media.size.height * 0.015)),
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //最左边的padding
                  SizedBox(
                    width: media.size.width * screenLeftPaddingRatio,
                  ),

                  //头像
                  SizedBox(
                      child: ProfilePicture(
                    picUrl: profilePicUrl,
                    width: media.size.width * profilePicRatioSize,
                    height: media.size.width * profilePicRatioSize,
                  )),

                  //Space between Profile and content
                  SizedBox(
                    width: media.size.width * spaceBetweenProfileAndContent,
                  ),

                  //名字&内容
                  Column(
                    children: [
                      //名字&Post Date
                      SizedBox(
                          width: media.size.width * contentRatioSizeAndLikes,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "$name",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: nameAndTimeFontSize),
                              ),
                              publishedDate.month == DateTime.now().month &&
                                      publishedDate.day == DateTime.now().day
                                  ? Text(
                                      "${publishedDate.hour}h ${publishedDate.minute}m ago",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.italic,
                                        fontSize: nameAndTimeFontSize,
                                      ))
                                  : Text(
                                      "${publishedDate.year}/${publishedDate.month}/${publishedDate.day}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.italic,
                                        fontSize: nameAndTimeFontSize,
                                      ),
                                    ),
                            ],
                          )),

                      // Like and Comment
                      SizedBox(
                        width: media.size.width * contentRatioSizeAndLikes,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                //无限内容
                                width: media.size.width * contentRatioSize,
                                child: Text(
                                  "$content",
                                  style: TextStyle(
                                    fontSize: contentFontSize,
                                  ),
                                )),
                            FavouritedIcon(
                              numLikes: numLikes,
                            ),
                          ],
                        ),
                      ),

                      Padding(
                          padding: EdgeInsets.only(
                        top: media.size.height * 0.03,
                      )),
                    ],
                  )
                ],
              ),
            ),
            //下划线
            Center(
              child: SizedBox(
                width: media.size.width*0.7, // Adjust width as needed
                height: 1.0, // Set height for a thin line
                child: const ColoredBox(
                  color: Colors.white12, // Set line color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class bottomInputBar extends StatefulWidget {
  final textController;

  const bottomInputBar({super.key, this.textController});

  @override
  State<bottomInputBar> createState() => _bottomInputBarState();
}

class _bottomInputBarState extends State<bottomInputBar> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimaryTextField(
            controller: widget.textController,
            hintText: "Enter your comment...",
            obscureText: false),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: EdgeInsets.zero, // Remove default padding
          ),
          onPressed: () {
            // Access the entered text using the controller
            String enteredText = widget.textController.text;

            print('Entered Text: $enteredText');
          },
          child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateZ(-45.0 * math.pi / 180.0),
              child: const Icon(Icons.send)),
        ),
      ],
    );
  }
}