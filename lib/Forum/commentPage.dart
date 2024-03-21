import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

import '../InteractedWidget/FavouriteIcon.dart';
import 'ForumSinglePostWidget.dart';
import '../InteractedWidget/ProfilePicWidget.dart';
import '../dummyData.dart'; // Import for using math.pi

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
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic),
                  ),
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
                SizedBox(height: media.size.height*0.1,),
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
              color: Colors.grey[200],
              // Optional background color for the row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: media.size.width * 0.65,
                    child: TextField(
                      controller: _textController, // Assign the controller
                      decoration: InputDecoration(
                        hintText: 'Enter some text...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
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
                        transform: Matrix4.identity()..rotateZ(-45.0 * math.pi / 180.0),
                        child: const Icon(Icons.send)),
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
      commentprofilePicUrl.add("https://static.vecteezy.com/system/resources/thumbnails/019/900/322/small_2x/happy-young-cute-illustration-face-profile-png.png");
      commentPublishedDate.add(DateTime.now());
      commentContent.add(_textController.text);
      commentnumLikes.add(0);
      _textController.text="";
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
        top: media.size.height * 0.025,
      ),
      child: Column(
        children: [
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //最左边的padding
                SizedBox(
                  width: media.size.width * screenLeftPaddingRatio ,

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
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: nameAndTimeFontSize),
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
                              child: Text("$content",style: TextStyle(fontSize: contentFontSize,),)),
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
          SizedBox(
            width: media.size.width, // Adjust width as needed
            height: 1.0, // Set height for a thin line
            child: const ColoredBox(
              color: Colors.grey, // Set line color
            ),
          ),
        ],
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
        SizedBox(
          width: media.size.width * 0.65,
          child: TextField(
            controller: widget.textController, // Assign the controller
            decoration: InputDecoration(
              hintText: 'Enter some text...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
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


//帖子留言的Straight Line
/*
class MinimalistLinePainter extends CustomPainter {
  final double thickness;
  final Color color;
  final context;
  final screenLeftPaddingRatio;

  MinimalistLinePainter({required this.thickness, required this.color, required this.context, required this.screenLeftPaddingRatio });

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke; // Ensure stroke for a line

    var media = MediaQuery.of(context);

    canvas.drawLine(
      Offset((media.size.width * screenLeftPaddingRatio)/ 2, 0), // Start at middle minus half-width
      Offset((media.size.width * screenLeftPaddingRatio)/ 2 , size.height), // End at middle minus half-width
      linePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
*/

