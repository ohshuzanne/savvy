import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/components/InteractedWidget/ProfilePicWidget.dart';
import 'package:savvy/utils/colors.dart';

import '../CRUD/create.dart';

class AddPost extends StatelessWidget {
  AddPost({super.key});

  final _testController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Post",
          style: GoogleFonts.lexend(color: Colors.black),
        ),
        centerTitle: true,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {pushCommentToFirebase(_testController.text);}, icon: const Icon(Icons.send_rounded,color: darkBlue,))),
          )
        ],
      ),
      body: SizedBox(
        height: media.size.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Left padding
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8),
                  child: ProfilePicture(
                      picUrl:
                          "https://static.vecteezy.com/system/resources/thumbnails/019/900/322/small_2x/happy-young-cute-illustration-face-profile-png.png",
                      width: 30,
                      height: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: SizedBox(
                    height: media.size.height*0.95,
                    width: 2,
                    child: Container(
                      color: Colors.black12,
                    ),
                  ),
                ),
              ],
            ),

            //text field
            SizedBox(
              height: media.size.height,
              width: media.size.width * 0.9 - 36,
              child: ListView(children: [
                SizedBox(
                    width: media.size.width * 0.9 - 36,
                    height: media.size.height,
                    child: TextField(
                      decoration: const InputDecoration(hintText: "What would you like to post today..."),
                      maxLines: 100,
                      controller: _testController,
                    ))
              ]),
            ),
            //right padding
          ],
        ),
      ),
    );
  }
}
