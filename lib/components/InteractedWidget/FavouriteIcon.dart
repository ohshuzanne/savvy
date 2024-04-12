import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';

import '../../CRUD/update.dart';

class FavouritedIcon extends StatefulWidget {
  late int numLikes;
  var commentDocID;
  var communityExchangeDocID;

  FavouritedIcon({super.key, required this.numLikes, this.commentDocID, this.communityExchangeDocID});

  @override
  State<FavouritedIcon> createState() => _FavouritedIconState();
}

class _FavouritedIconState extends State<FavouritedIcon> {
  Set<String> likes = {};
  late bool liked;

  @override
  void initState() {
    super.initState();
    liked = false;
  }

  like() {
    setState(() {
      liked = true;
      widget.numLikes += 1;
      modifyLikesNumber(widget.communityExchangeDocID,widget.commentDocID,'numLikes',widget.numLikes);
    });
  }



  unlike() {
    setState(() {
      liked = false;
      widget.numLikes -= 1;
      modifyLikesNumber(widget.communityExchangeDocID,widget.commentDocID,'numLikes',widget.numLikes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: liked ? unlike : like,
          child: liked
              ? const Icon(Icons.favorite_rounded, color: darkBlue)
              : const Icon(Icons.favorite_border_outlined, color: darkBlue),
        ),
        Text(
          widget.numLikes.toString(),
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
