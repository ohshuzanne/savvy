import 'package:cloud_firestore/cloud_firestore.dart';


/*
Widget build(BuildContext context) {
  return FutureBuilder(
    future: fetchData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text('User name: ${snapshot.data}');
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return CircularProgressIndicator();
      }
    },
  );
}*/


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




Future<dynamic> fetchData() async {
  // Get a reference to the "hub" collection
  CollectionReference collectionRef = firestore.collection('LiteracyHub');

  // Get all documents in the collection
  QuerySnapshot querySnapshot = await collectionRef.get();

  // Process each document
  // for (var doc in querySnapshot.docs) {
  //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //   String title = data['title'];
  //   String content = data['content'];
  //
  //   print('Title: $title, Content: $content');
  // }
  return querySnapshot;

}