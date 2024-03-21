import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//还没开始用
// String createUuid(){return const Uuid().toString();}

var db = FirebaseFirestore.instance;
CollectionReference userCollection = db.collection("user");



class User {

 late List posts;
 late String? userID = FirebaseAuth.instance.currentUser?.uid;
 late String? displayName = FirebaseAuth.instance.currentUser?.displayName;
 late String profilePicURL;
 late List likes;


 void getUserData() async {
   await userCollection.doc(userID).snapshots().forEach((element) {
     posts = element.get("posts");
     profilePicURL = element.get("profilePicURL");
   });
 }



 void addPost(post){

   userCollection.doc(userID).update({"posts":FieldValue.arrayUnion(post)});
   Post(username: displayName, content: "Textfield 拿", profilePicURL: profilePicURL, postDate: DateTime.now().toString());

 }

}


class Post {
  late String postID;
  String? username;
  String content;
  String profilePicURL;
  String postDate;
  List likes = [];
  List comments = [];

  Post({
    required this.username,
    required this.content ,
    required this.profilePicURL ,
    required this.postDate ,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'content': content,
      'profilePicURL': profilePicURL,
      'postDate': postDate,
      'likes': likes,
      'comments': comments,
    }; // DocumentReference newUserRef = userRef.doc(tPNumberEmail);
    // newUserRef.collection("PersonalInformation").doc().set(user.toMap());
  }

}
