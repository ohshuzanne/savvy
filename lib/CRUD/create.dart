import 'dart:html';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savvy/dummyData.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> pushArticleToFirebase({
  required String category,
  required String authorName,
  required String authorProfilePic,
  required String publishedDate,
  required String title,
  required String content,
  required String hashtag,
  required String pic,
}) async {
  // Create a map to store the data
  Map<String, dynamic> data = {
    'category': category,
    'authorName': authorName,
    'authorProfilePic': authorProfilePic,
    'publishedDate': publishedDate,
    'title': title,
    'content': content,
    'hashtag': hashtag,
    'pic': pic,
  };

  // Add data to the "hub" collection with a randomly generated document ID
  await firestore.collection('literacyHub').add(data);
  print('Data written to Firebase');
}

Future<void> initialDataToFirebase() async {
  DummyArticle dummyArticle = DummyArticle();

  late String category;

  for (var classification in Classifications.values) {
    switch (classification) {
      case Classifications.forYou:
        category = "ForYou";
      case Classifications.followong:
        category = "Followong";
      case Classifications.debtManageStractegies:
        category = "DebtManageStractegies";
      case Classifications.financialPlanning:
        category = "FinancialPlanning";
      case Classifications.financialProductsAndServices:
        category = "FinancialProductsAndServices";
    }

    dummyArticle.getData(classification);

    for (int i = 0; i < dummyArticle.title.length; i++) {
      await pushArticleToFirebase(
          category: category,
          authorName: dummyArticle.authorName[i],
          authorProfilePic: dummyArticle.authorProfilePic[i],
          publishedDate: dummyArticle.publishedDate[i],
          title: dummyArticle.title[i],
          content: dummyArticle.content[i],
          hashtag: dummyArticle.hashtag[i],
          pic: dummyArticle.pic[i]);
    }
  }
}



Future<void> pushCommentToFirebase() async {

  DummyData dummyData = DummyData();

  try {
    for (int i = 0; i < dummyData.name.length; i++) {
      // Create a map to store the data for each forum post
      Map<String, dynamic> data = {
        'name': dummyData.name[i],
        'publishedDate': dummyData.publishedDate[i],
        'content': dummyData.content[i],
        'numLikes': dummyData.numLikes[i],
        'numComments': dummyData.numComments[i],
        'numShare': dummyData.numShare[i],
        'profilePicUrl': dummyData.profilePicUrl[i],
      };

      // Add the data to the "Forum" collection with a randomly generated document ID
      await firestore.collection('communityExchange').add(data);
      print('Post ${i + 1} added to Firebase');
    }
  } catch (error) {
    print('Error adding posts to Firebase: $error');
  }
}
