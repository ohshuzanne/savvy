import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

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

Future<void> writeDataToHub(String title, String content) async {
  // Create a map to store the data
  Map<String, dynamic> data = {
    'title': title,
    'content': content,
    // You can add more key-value pairs for additional data
  };

  await firestore.collection('hub').add(data);
  print('Data written to Firebase');
}


Future<dynamic> fetchData() async {
  // Get a reference to the "hub" collection
  CollectionReference collectionRef = firestore.collection('hub');

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