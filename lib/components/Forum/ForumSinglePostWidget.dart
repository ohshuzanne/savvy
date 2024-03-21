import 'package:flutter/material.dart';
import 'package:savvy/components/InteractedWidget/ProfilePicWidget.dart';


import '../InteractedWidget/FavouriteIcon.dart';
import '../InteractedWidget/ShareIcon.dart';
import 'commentPage.dart';

class ForumSinglePostWidget extends StatelessWidget {
  final name;
  final publishedDate;
  final content;
  final numLikes;
  final numComments;
  final currentctr;
  final numShare;
  final profilePicUrl;
  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    double profilePicRatioSize = 0.13;
    double screenLeftPaddingRatio = 0.02;
    double spaceBetweenProfileAndContent = 0.05;
    double contentRatioSize = 0.75;

    return SizedBox(
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //最左边的padding
          SizedBox(width:media.size.width * screenLeftPaddingRatio,),

          //头像
          SizedBox(
              child: ProfilePicture(
            picUrl: profilePicUrl,
            width: media.size.width * profilePicRatioSize,
            height: media.size.width * profilePicRatioSize,
          )),

          //Space between Profile and content
          SizedBox(width: media.size.width * contentRatioSize * spaceBetweenProfileAndContent,),


          //名字&内容
          Column(children: [
            //名字&Post Date
              SizedBox(
                  width: media.size.width * contentRatioSize,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$name",
                        textAlign: TextAlign.left,style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      publishedDate.month == DateTime.now().month && publishedDate.day == DateTime.now().day
                          ? Text(
                              "${publishedDate.hour}h ${publishedDate.minute}m ago",
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                              ))
                          : Text(
                              "${publishedDate.year}/${publishedDate.month}/${publishedDate.day}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                    ],
                  )),

              //无限内容
            SizedBox(width: media.size.width * contentRatioSize,
              child: Text("$content")),

            // Like and Comment
            SizedBox(
              width: media.size.width * contentRatioSize,
              height: 50, //padding between content and button
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                FavouritedIcon(numLikes: numLikes,),
                CommentIcon(numComments: numComments,currentctr:currentctr),
                ShareIcon(numShare: numShare),
                const SizedBox(),
              ],),
            ),
            Padding(padding:EdgeInsets.only(top: media.size.height * 0.03,))
          ],)
      ],),
    );
  }


  const ForumSinglePostWidget({super.key, this.currentctr, this.name,this.publishedDate,this.content,this.numLikes,this.numComments,this.numShare,this.profilePicUrl});
}


class CommentIcon extends StatelessWidget {
  late final numComments;
  late final currentctr;

  CommentIcon({super.key, required this.numComments, required this.currentctr});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(onTap:(){goCommentPage(context);} ,
        child: const Icon(Icons.mode_comment_outlined),),
        Text("$numComments",style: const TextStyle(fontSize: 10),),
      ],
    );
  }

  Future<void> goCommentPage(context) {
    //   Navigator.of(context).popUntil((route) => route.isFirst);
    //
    //   return Navigator.pushReplacement<void, void>(
    //     context,
    //     MaterialPageRoute<void>(
    //       builder: (BuildContext context) => commentPage(currentctr),
    //     ),
    //   );
    // }
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => commentPage(currentctr)),
    );
  }
}

