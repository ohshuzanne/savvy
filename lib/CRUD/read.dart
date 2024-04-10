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

Future getForYouCategories(Classifications classification) async {

  CollectionReference collectionRef = firestore.collection('literacyHub');
  late String category;

  switch (classification){
    case Classifications.forYou:
      category="ForYou";
    case Classifications.followong:
      category="Followong";
    case Classifications.debtManageStractegies:
      category="DebtManageStractegies";
    case Classifications.financialPlanning:
      category="FinancialPlanning";
    case Classifications.financialProductsAndServices:
      category="FinancialProductsAndServices";
  }

  QuerySnapshot querySnapshot = await collectionRef
      .where('category', isEqualTo: category)
      .get();

  if (querySnapshot.docs.isEmpty) {
    print('No documents found with $category category');
    return null;
  }

  print(querySnapshot.docs);
  return querySnapshot.docs;
}