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




Future getForYouCategories() async {

  CollectionReference collectionRef = firestore.collection('LiteracyHub');

  // Query documents where 'category' field is "ForYou" (case-sensitive)
  QuerySnapshot querySnapshot = await collectionRef
      .where('category', isEqualTo: 'ForYou')
      .get();

  // Check if any documents were found
  if (querySnapshot.docs.isEmpty) {
    print('No documents found with "ForYou" category');
    return "no data";
  }

  // // Loop through matching documents
  // for (var doc in querySnapshot.docs) {
  //   String category = doc['category'];
  //   print('Found category: $category');
  // }

  print(querySnapshot.docs);
  return querySnapshot.docs;
}