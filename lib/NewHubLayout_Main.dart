import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:savvy/utils/colors.dart';

class NewHub extends StatelessWidget {
  const NewHub({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    const container_height_ratio = 0.2;
    const container_focus_weight_ratio = 0.5;
    const container_unfocus_weight_ratio = 0.15;
    const padding_between_container = 0.1;
    const padding_screen_left_right = 0.1;

    const padding_between_container_indicator = 0.02;

    const indicator_focus_length_ratio = 0.1;
    const indicator_unfocus_length_ratio = 0.025;
    const padding_between_indicator = 0.01;

    const searchBar_weight_ratio = 0.8;

    return MaterialApp(
      home: Scaffold(

          // TODO: 汉堡包menu ， LearnUp , 头像
          appBar: AppBar(),

          // 🟢 主内容
          body: Padding(
            padding: EdgeInsets.only(
                left: media.size.width * padding_screen_left_right,
                right: padding_screen_left_right),
            child: Column(
              children: [
                // 🟢 名字
                const Text("Hello, Suzanne"),

                // 🟢 Streak & Point Widget
                const Row(
                  children: [
                    Text("Current learning streak:"),
                    Text("7 days!",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: primaryPurple)),
                    pointWidget(),
                  ],
                ),

                //🟢 两个格子 Beginner_Guide & Continue_Learning
                Row(
                  children: [
                    //TODO 绿色格子
                    Container(
                      height: media.size.height * container_height_ratio,
                      width: media.size.width * container_focus_weight_ratio,
                      decoration: BoxDecoration(
                        color: lightGreen,
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                            colors: [
                              lightGreen,
                              lightBlue
                            ]),
                      ),

                      //🟢绿色格子内部
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: SizedBox(
                              width: (media.size.width *
                                      container_focus_weight_ratio) *
                                  0.3,
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt1NNc9EKb0hZfCUOAL2d2KgnYsrIZ07YiuA&s",
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                      child:
                                          CircularProgressIndicator()); // Display a progress indicator while loading
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Text(
                                      "Fail to load"); // Display error message on failure
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: (media.size.width *
                                        container_focus_weight_ratio) *
                                    0.7 -
                                30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Course learning",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11),
                                ),
                                SizedBox(
                                    width: ((media.size.width *
                                            container_focus_weight_ratio) *
                                        0.7),
                                    child: const Text(
                                      "A Beginner's\nGuide to\nMicrosoft Excel",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    //Padding Between 2 Container
                    Padding(
                        padding: EdgeInsets.only(
                            left:
                                media.size.width * padding_between_container)),

                    // 🟢
                    //TODO 蓝色格子
                    Container(
                      height: media.size.height * container_height_ratio,
                      width: media.size.width * container_unfocus_weight_ratio,
                      decoration: BoxDecoration(
                        color: lightGreen,
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                            colors: [
                              darkBlue,
                              lightPurple
                            ]),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book_outlined,
                            size: (media.size.width *
                                container_unfocus_weight_ratio *
                                0.5),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          const Text("Continue Learning",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 11,
                                  fontStyle: FontStyle.italic)),
                        ],
                      ),
                    )
                  ],
                ),

                Padding(
                    padding: EdgeInsets.only(
                        top: media.size.height *
                            padding_between_container_indicator)),

                //TODO 。。。。 Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //对焦的
                    Padding(
                      padding: EdgeInsets.only(
                          left: media.size.width * padding_between_indicator,
                          right: media.size.width * padding_between_indicator),
                      child: SizedBox(
                        height: 4,
                        width: media.size.width * indicator_focus_length_ratio,
                        child: Container(
                          height: media.size.height * container_height_ratio,
                          width:
                              media.size.width * container_unfocus_weight_ratio,
                          decoration: BoxDecoration(
                            color: lightGreen,
                            // shape: BoxShape.circle,
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomRight,
                                colors: [
                                  darkBlue,
                                  lightPurple
                                ]),
                          ),
                        ),
                      ),
                    ),

                    //没有对焦的

                    const Unfocus_Indicator(
                      container_unfocus_weight_ratio:
                          container_unfocus_weight_ratio,
                      indicator_focus_length_ratio:
                          indicator_focus_length_ratio,
                      container_height_ratio: container_height_ratio,
                      container_focus_weight_ratio:
                          container_focus_weight_ratio,
                      indicator_unfocus_length_ratio:
                          indicator_unfocus_length_ratio,
                      padding_between_indicator: padding_between_indicator,
                    ),
                    const Unfocus_Indicator(
                      container_unfocus_weight_ratio:
                          container_unfocus_weight_ratio,
                      indicator_focus_length_ratio:
                          indicator_focus_length_ratio,
                      container_height_ratio: container_height_ratio,
                      container_focus_weight_ratio:
                          container_focus_weight_ratio,
                      indicator_unfocus_length_ratio:
                          indicator_unfocus_length_ratio,
                      padding_between_indicator: padding_between_indicator,
                    ),
                    const Unfocus_Indicator(
                      container_unfocus_weight_ratio:
                          container_unfocus_weight_ratio,
                      indicator_focus_length_ratio:
                          indicator_focus_length_ratio,
                      container_height_ratio: container_height_ratio,
                      container_focus_weight_ratio:
                          container_focus_weight_ratio,
                      indicator_unfocus_length_ratio:
                          indicator_unfocus_length_ratio,
                      padding_between_indicator: padding_between_indicator,
                    ),
                  ],
                ),

                Padding(
                    padding: EdgeInsets.only(
                        top: media.size.height *
                            padding_between_container_indicator)),

                //TODO Search_Bar_Widget
                Container(
                  height: media.size.height * container_height_ratio,
                  width: media.size.width * searchBar_weight_ratio,
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        primaryPurple,
                        darkBlue,
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.menu_book,
                        size: media.size.width * searchBar_weight_ratio * 0.25,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("What do you want to learn",style: TextStyle(fontSize: 12,fontStyle: FontStyle.italic),),
                          SizedBox(
                              height: media.size.width *
                                  searchBar_weight_ratio *
                                  0.1,
                              width: media.size.width *
                                  searchBar_weight_ratio *
                                  0.5,
                              child: TextField(
                                style: const TextStyle(fontSize: 11),
                                decoration: InputDecoration(
                                  hintStyle:const TextStyle(fontSize: 1),
                                  hintText: "What do you want to learn",
                                  label: const Icon(Icons.search),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  filled: true,
                                  // Set background color
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    // Adjust corner radius as needed
                                    borderSide: const BorderSide(
                                        color: Colors
                                            .grey), // Optional border color
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    // Adjust corner radius as needed
                                    borderSide: const BorderSide(
                                        color: Colors
                                            .blue), // Optional focus border color
                                  ),
                                ),
                              )),

                          // Popular Search
                          SizedBox(
                            width: media.size.width *
                                searchBar_weight_ratio *
                                0.5,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PopularSearch(text: "xxx",),
                                PopularSearch(text: "yyy",),
                                PopularSearch(text: "zzz",),

                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                //🟢 What would you like to do
                const Text("What would you like to do?"),

                //TODO Statistics
                //TODO Track_Application
                //TODO Certification
              ],
            ),
          )),
    );
  }
}

class PopularSearch extends StatelessWidget {
  final text;

  const PopularSearch ({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding: const EdgeInsets.only(left: 3,right: 3,top: 5),
      child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black,width: 1)) ,child: Padding(
        padding: const EdgeInsets.only(left: 6,right: 6),
        child: Text(text),
        )),
    );
  }
}


class pointWidget extends StatelessWidget {
  const pointWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("");
  }
}

class Unfocus_Indicator extends StatelessWidget {
  final container_height_ratio;
  final container_focus_weight_ratio;
  final container_unfocus_weight_ratio;
  final indicator_focus_length_ratio;
  final indicator_unfocus_length_ratio;
  final padding_between_indicator;

  const Unfocus_Indicator(
      {super.key,
      required this.container_unfocus_weight_ratio,
      required this.indicator_focus_length_ratio,
      required this.container_height_ratio,
      required this.container_focus_weight_ratio,
      required this.indicator_unfocus_length_ratio,
      required this.padding_between_indicator});

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
          left: media.size.width * padding_between_indicator,
          right: media.size.width * padding_between_indicator),
      child: SizedBox(
        height: 4,
        width: media.size.width * indicator_unfocus_length_ratio,
        child: Container(
          height: media.size.height * container_height_ratio,
          width: media.size.width * container_unfocus_weight_ratio,
          decoration: BoxDecoration(
            color: lightGreen,
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [darkBlue, lightPurple]),
          ),
        ),
      ),
    );
  }
}
