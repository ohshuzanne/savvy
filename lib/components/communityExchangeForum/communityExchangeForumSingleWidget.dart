import 'package:flutter/material.dart';
import 'package:savvy/components/InteractedWidget/ProfilePicWidget.dart';
import 'package:savvy/utils/colors.dart';

import '../InteractedWidget/FavouriteIcon.dart';
import '../InteractedWidget/ShareIcon.dart';
import 'commentPage.dart';

class ForumSinglePostWidget extends StatelessWidget {
  final name;
  final publishedDate;
  final content;
  final numLikes;
  final numComments;
  final communityExchangeDocID;
  final numShare;
  final profilePicUrl;

  const ForumSinglePostWidget(
      {super.key,
        this.communityExchangeDocID,
        this.name,
        this.publishedDate,
        this.content,
        this.numLikes,
        this.numComments,
        this.numShare,
        this.profilePicUrl});

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    double profilePicRatioSize = 0.10;
    double screenLeftPaddingRatio = 0.07;
    double spaceBetweenProfileAndContent = 0.03;
    double contentRatioSize = 0.75;

    return SizedBox(
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
            width: media.size.width *
                contentRatioSize *
                spaceBetweenProfileAndContent,
          ),

          //名字&内容
          Column(
            children: [
              //名字&Post Date
              SizedBox(
                  width: media.size.width * contentRatioSize,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$name",
                        textAlign: TextAlign.left,
                        style: const  TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                      publishedDate.month == DateTime.now().month &&
                              publishedDate.day == DateTime.now().day
                          ? Text(
                              "${publishedDate.hour}h ${publishedDate.minute}m ago",
                              style: const TextStyle(
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                              ))
                          : Text(
                              "${publishedDate.year}/${publishedDate.month}/${publishedDate.day}",
                              style: const TextStyle(
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                    ],
                  )),

              //无限内容
              SizedBox(
                  width: media.size.width * contentRatioSize,
                  child: Text("$content",style: const TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 11),)),

              // Like, Comment and share
              SizedBox(
                width: media.size.width * contentRatioSize,
                height: 50, //padding between content and button
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FavouritedIcon(
                      numLikes: numLikes,
                    ),
                    CommentIcon(
                        numComments: numComments, communityExchangeDocID: communityExchangeDocID, name: name, publishedDate: publishedDate, content: content, numLikes: numLikes, numShare: numShare, profilePicUrl: profilePicUrl,),
                    ShareIcon(numShare: numShare),
                    const SizedBox(),
                  ],
                ),
              ),

              //padding & 下划线
              Padding(
                  padding: EdgeInsets.only(
                top: media.size.height * 0.01,
              )),
              Container(
                  color: Colors.black12,
                  child: SizedBox(
                    height: 0.5,
                    width: media.size.width * 0.5,
                  )),
              // Padding(
              //     padding: EdgeInsets.only(
              //   top: media.size.height * 0.02,
              // )),
            ],
          )
        ],
      ),
    );
  }


}

class CommentIcon extends StatelessWidget {
  final name;
  final publishedDate;
  final content;
  final numLikes;
  final numComments;
  final numShare;
  final communityExchangeDocID;
  final profilePicUrl;

  const CommentIcon({super.key, required this.name, required this.publishedDate, required this.content, required this.numLikes, required this.numShare, required this.profilePicUrl, required this.numComments, required this.communityExchangeDocID});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            goCommentPage(context);
          },
          child: const Icon(Icons.mode_comment_outlined, color: darkBlue),
        ),
        Text(
          "$numComments",
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }


  Future<void> goCommentPage(context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => commentPage(communityExchangeDocID,name,publishedDate,content,numLikes,numComments,numShare,profilePicUrl)),
    );
  }
}
