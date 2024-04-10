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

  print(querySnapshot.docs);
  return querySnapshot.docs;
}