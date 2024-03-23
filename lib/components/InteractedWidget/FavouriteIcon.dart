import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';

class FavouritedIcon extends StatefulWidget {
  late int numLikes;

  FavouritedIcon({super.key, required this.numLikes});

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
    });
  }

  unlike() {
    setState(() {
      liked = false;
      widget.numLikes -= 1;
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

    /*
    return StreamBuilder(  //持续聆听User里面的likes[]，搜索有没有增加or减少post的id
      stream: FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        // likes.add(Set.from(snapshot.data?["likes"]));
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {}
        return const Text("data");

      },
    );
*/
  }
}
