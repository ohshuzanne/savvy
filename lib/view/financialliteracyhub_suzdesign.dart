import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:savvy/components/InteractedWidget/ProfilePicWidget.dart';
import 'package:savvy/utils/colors.dart';

import 'FinancialLiteracyHub.dart';

class FinancialLiteracyHub_SuzDesign extends StatefulWidget {
  const FinancialLiteracyHub_SuzDesign({super.key});

  @override
  State<FinancialLiteracyHub_SuzDesign> createState() =>
      _FinancialLiteracyHub_SuzDesignState();
}

class _FinancialLiteracyHub_SuzDesignState
    extends State<FinancialLiteracyHub_SuzDesign> {
  @override
  void initState() {
    language = 'en';
    super.initState();
  }

  void ChangeLanguageToBm() {
    setState(() {
      language = 'bm';
    });
  }

  void ChangeLanguageToEn() {
    setState(() {
      language = 'en';
    });
  }

  late String language;

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
    const appbar_font_size = 13.0;

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
        centerTitle: true,
        title: Column(children: [
          const Text(
            "Savvy",style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 20,
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: language == 'en'?
                const Text('En',style: TextStyle(fontSize: appbar_font_size+1,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),):
                const Text('En',style: TextStyle(fontSize: appbar_font_size,fontStyle: FontStyle.italic),),
                onTap: () {
                  ChangeLanguageToEn();
                },
              ),
              const Text("/",style: TextStyle(fontSize: appbar_font_size,fontStyle: FontStyle.italic),),
              GestureDetector(
                child: language == 'bm'?
                const Text('Bm',style: TextStyle(fontSize: appbar_font_size+1,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),):
                const Text('Bm',style: TextStyle(fontSize: appbar_font_size,fontStyle: FontStyle.italic),),
                onTap: () {
                  ChangeLanguageToBm();
                },
              ),
            ],
          )
        ]),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline_rounded, size: 22),
          ),
        ],
      ),

      //  汉堡包menu ， Savvy , 头像
      /*appBar: AppBar(

            //汉堡包menu
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open the drawer
                },
              ),
            ),

            //Savvy
            centerTitle: true,
            title: Column(children: [
              const Text(
                "Savvy",style: TextStyle(fontWeight: FontWeight.bold,color: primaryPurple,fontFamily: 'K2D'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: language == 'en'?
                    const Text('En',style: TextStyle(fontSize: appbar_font_size+1,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),):
                    const Text('En',style: TextStyle(fontSize: appbar_font_size,fontStyle: FontStyle.italic),),
                    onTap: () {
                      ChangeLanguageToEn();
                    },
                  ),
                  const Text("/",style: TextStyle(fontSize: appbar_font_size,fontStyle: FontStyle.italic),),
                  GestureDetector(
                    child: language == 'bm'?
                    const Text('Bm',style: TextStyle(fontSize: appbar_font_size+1,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),):
                    const Text('Bm',style: TextStyle(fontSize: appbar_font_size,fontStyle: FontStyle.italic),),
                    onTap: () {
                      ChangeLanguageToBm();
                    },
                  ),
                ],
              )
            ]),

            //ProfilePic
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfilePicture(
                    picUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfsGSXHrSxzPmhGYglb5TDOq9MwafY8J61xg&usqp=CAU",
                    width: media.size.width*0.1,
                    height: media.size.width*0.1),
              )
            ],
          ),
          drawer: Drawer(
            child: ListView(
              // Navigation drawer content
              children: [
                ListTile(
                  title: const Text('Option 1'),
                  onTap: () {
                    // Handle navigation on option selection
                  },
                ),
                ListTile(
                  title: const Text('Option 2'),
                  onTap: () {
                    // Handle navigation on option selection
                  },
                ),
              ],
            ),
          ),*/

      // 🟢 主内容
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: media.size.width * padding_screen_left_right,
              right: media.size.width * padding_screen_left_right),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🟢 名字
              Text(
                "Hello, Suzanne",
                style: TextStyle(
                    fontSize: media.size.width * 0.07,
                    fontWeight: FontWeight.bold),
              ),

              // 🟢 Streak & Point Widget
              Row(
                children: [
                  language == 'en'
                      ? const Text("Current learning streak:",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ))
                      : const Text("Rentak pembelajaran semasa:",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                  language == 'en'
                      ? const Padding(
                          padding: EdgeInsets.only(left: 3.0),
                          child: Text("7 days!",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: primaryPurple)),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(left: 3.0),
                          child: Text("7 hari!",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: primaryPurple)),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: pointWidget(
                      language: language,
                    ),
                  ),
                ],
              ),

              Padding(
                  padding: EdgeInsets.only(
                      top: media.size.height *
                          padding_between_container_indicator)),

              //🟢 两个格子 Beginner_Guide & Continue_Learning
              Row(
                children: [
                  // 🟢绿色格子
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
                          colors: [lightGreen, lightBlue]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )]
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
                              language == 'en'
                                  ? const Text(
                                      "Course learning",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11),
                                    )
                                  : const Text(
                                      "Pembelajaran kursus",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11),
                                    ),
                              SizedBox(
                                width: ((media.size.width *
                                        container_focus_weight_ratio) *
                                    0.7),
                                child: language == 'en'
                                    ? const Text(
                                        "A Beginner's\nGuide to\nMicrosoft Excel",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : const Text(
                                        "Panduan Pemula\nuntuk\nMicrosoft Excel",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  //Padding Between 2 Container
                  Padding(
                      padding: EdgeInsets.only(
                          left: media.size.width * padding_between_container)),

                  // 🟢 蓝色格子
                  InkWell(
                    hoverColor: lighterBlue,
                    onTap: () {
                      goFinancialLiteracyHubPage(context);
                    },
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
                          boxShadow: [
                      BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )]
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
                          language == 'en'
                              ? const Text("Continue Learning",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11,
                                      fontStyle: FontStyle.italic))
                              : const Text("Teruskan Belajar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11,
                                      fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              Padding(
                  padding: EdgeInsets.only(
                      top: media.size.height *
                          padding_between_container_indicator)),

              // 。。。。 Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //对焦的
                  SizedBox(
                    height: 4,
                    width: media.size.width * indicator_focus_length_ratio,
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

                  //没有对焦的

                  const Unfocus_Indicator(
                    container_unfocus_weight_ratio:
                        container_unfocus_weight_ratio,
                    indicator_focus_length_ratio: indicator_focus_length_ratio,
                    container_height_ratio: container_height_ratio,
                    container_focus_weight_ratio: container_focus_weight_ratio,
                    indicator_unfocus_length_ratio:
                        indicator_unfocus_length_ratio,
                    padding_between_indicator: padding_between_indicator,
                  ),
                  const Unfocus_Indicator(
                    container_unfocus_weight_ratio:
                        container_unfocus_weight_ratio,
                    indicator_focus_length_ratio: indicator_focus_length_ratio,
                    container_height_ratio: container_height_ratio,
                    container_focus_weight_ratio: container_focus_weight_ratio,
                    indicator_unfocus_length_ratio:
                        indicator_unfocus_length_ratio,
                    padding_between_indicator: padding_between_indicator,
                  ),
                  const Unfocus_Indicator(
                    container_unfocus_weight_ratio:
                        container_unfocus_weight_ratio,
                    indicator_focus_length_ratio: indicator_focus_length_ratio,
                    container_height_ratio: container_height_ratio,
                    container_focus_weight_ratio: container_focus_weight_ratio,
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

              //🟢 Search_Bar_Widget
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 7,
                        offset: Offset(1, 3),
                      )]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.menu_book,
                      size: media.size.height * container_height_ratio * 0.5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        language == 'en'
                            ? const Text(
                                "What do you want to learn",
                                style: TextStyle(
                                    fontSize: 12, fontStyle: FontStyle.italic),
                              )
                            : const Text(
                                "Apa yang anda mahu belajar",
                                style: TextStyle(
                                    fontSize: 12, fontStyle: FontStyle.italic),
                              ),
                        SizedBox(
                            height:
                                media.size.width * searchBar_weight_ratio * 0.1,
                            width:
                                media.size.width * searchBar_weight_ratio * 0.5,
                            child: TextField(
                              style: const TextStyle(fontSize: 11),
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(fontSize: 1),
                                hintText: "What do you want to learn",
                                label: const Icon(Icons.search),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                filled: true,
                                // Set background color
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  // Adjust corner radius as needed
                                  borderSide: const BorderSide(
                                      color:
                                          Colors.grey), // Optional border color
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
                          width:
                              media.size.width * searchBar_weight_ratio * 0.5,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PopularSearch(
                                text: "xxx",
                              ),
                              PopularSearch(
                                text: "yyy",
                              ),
                              PopularSearch(
                                text: "zzz",
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              //🟢 What would you like to do
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: language == 'en'
                    ? const Text(
                        "What would you like to do?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'K2D',
                        ),
                      )
                    : const Text(
                        "Apa yang anda ingin lakukan?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'K2D',
                        ),
                      ),
              ),

              //🟢 Statistics
              ListTileWidget(
                media: media,
                icon: Icons.query_stats,
                title: "Statistics",
                content: "Check your growth and compare them to your goals.",
                contentBm: "Perangkaan",
                titleBm:
                    "Semak pertumbuhan anda dan bandingkan dengan matlamat anda.",
                language: language,
              ),
              //🟢 Track_Application
              ListTileWidget(
                  media: media,
                  icon: Icons.document_scanner,
                  title: "Track Application",
                  content: "Manage your current and past job applications.",
                  contentBm: "Aplikasi Jejaki",
                  titleBm: "Uruskan permohonan kerja semasa dan lama anda.",
                  language: language),
              //🟢 Certification
              ListTileWidget(
                  media: media,
                  icon: Icons.cast_for_education_rounded,
                  title: "Certifications",
                  content:
                      "Export and manage your certifications from taking our courses.",
                  contentBm: "Pensijilan",
                  titleBm:
                      "Eksport dan uruskan pensijilan anda daripada mengikuti kursus kami.",
                  language: language),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularSearch extends StatelessWidget {
  final text;

  const PopularSearch({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3, top: 5),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1)),
          child: Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: Text(text),
          )),
    );
  }
}

class pointWidget extends StatelessWidget {
  final language;

  const pointWidget({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: primaryPurple),
          boxShadow: [
            const BoxShadow(
              color: darkBlue,
              blurRadius: 3,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: language == 'en'
            ? const Text("500 Point")
            : const Text("500 mata"));
  }
}

class ListTileWidget extends StatefulWidget {
  final media;
  final icon;
  final title;
  final content;
  final titleBm;
  final contentBm;
  final language;

  const ListTileWidget({
    super.key,
    required this.media,
    required this.icon,
    required this.title,
    required this.content,
    required this.titleBm,
    required this.contentBm,
    required this.language,
  });

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    var media = widget.media;
    var icon = widget.icon;
    var title = widget.title;
    var content = widget.content;
    var titleBm = widget.titleBm;
    var contentBm = widget.contentBm;
    var language = widget.language;
    const listTileWidget_weight_ratio = 0.8;
    const listTileWidget_height_ratio = 0.17;

    return Padding(
      padding: EdgeInsets.only(
          bottom: media.size.height * listTileWidget_height_ratio * 0.1),
      child: SizedBox(
        width: media.size.width * listTileWidget_weight_ratio,
        height: media.size.width * listTileWidget_height_ratio,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //照片
            SizedBox(
              width: media.size.width * listTileWidget_weight_ratio * 0.175,
              height: media.size.width * listTileWidget_weight_ratio * 0.175,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: primaryPurple),
                child: Icon(
                  icon,
                  size: media.size.height * listTileWidget_height_ratio * 0.3 >
                          media.size.width * listTileWidget_weight_ratio * 0.3
                      ? media.size.width * listTileWidget_weight_ratio * 0.35
                      : media.size.height * listTileWidget_height_ratio * 0.35,
                  color: lightBlue,
                ),
              ),
            ),

            Padding(
                padding: EdgeInsets.only(
                    left:
                        media.size.width * listTileWidget_weight_ratio * 0.03)),

            //content
            SizedBox(
              width: media.size.width * listTileWidget_weight_ratio * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    language == 'en' ? title : titleBm,
                    style: const TextStyle(
                        color: primaryPurple,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    language == 'en' ? content : contentBm,
                    style: const TextStyle(
                        color: primaryPurple, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),

            Padding(
                padding: EdgeInsets.only(
                    left: media.size.width *
                        listTileWidget_weight_ratio *
                        0.020)),

            //箭头
            SizedBox(
              width: media.size.width * listTileWidget_weight_ratio * 0.175,
              child: Icon(
                  color: primaryPurple,
                  Icons.arrow_forward_ios,
                  size: media.size.height * listTileWidget_height_ratio * 0.4),
            ),
          ],
        ),
      ),
    );
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

Future<void> goFinancialLiteracyHubPage(context) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FinancialLiteracyHub()),
  );
}
