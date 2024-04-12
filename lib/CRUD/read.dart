import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savvy/dummyData.dart';

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

Future getArticlesByCategorie(Classifications classification) async {
  CollectionReference collectionRef = firestore.collection('literacyHub');
  late String category;

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

  QuerySnapshot querySnapshot =
      await collectionRef.where('category', isEqualTo: category).get();

  if (querySnapshot.docs.isEmpty) {
    print('No documents found with $category category');
    return null;
  }

  print(querySnapshot.docs);
  return querySnapshot.docs;
}

getCommunityExchangePost() {
  CollectionReference communityExchangeCollection =
      firestore.collection('communityExchange');

  try {
    return communityExchangeCollection.snapshots();
  } catch (error) {print(error);}
}

Future fetchComments({required String documentId}) async {
  try {
    // Reference to the specific document
    DocumentReference documentRef = firestore
        .collection('communityExchange')
        .doc(documentId);

    // Get the comments subcollection
    CollectionReference commentsCollection = documentRef.collection('comments');

    // Get all documents in the subcollection
    QuerySnapshot querySnapshot = await commentsCollection.get();

    return querySnapshot.docs;
  } catch (error) {
    print('Error fetching comments: $error');
    return []; // Return empty list on error
  }
}

