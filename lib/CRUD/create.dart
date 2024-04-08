import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> pushDataToFirebase(
    {
      required String category,
      required String authorName,
      required String authorProfilePic,
      required String publishedDate,
      required String title,
      required String content,
      required String hashtag,
      required String pic,}
    ) async {
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
  await firestore.collection('LiteracyHub').add(data);
  print('Data written to Firebase');
}