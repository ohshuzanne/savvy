import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> modifyCommentField(
{required String communityExchangeDocumentId,required String commentDocumentId,required String fieldToUpdate,required newValue}) async {
  try {
    // Reference to the specific document in the subcollection
    DocumentReference documentRef = firestore
        .collection('communityExchange')
        .doc(communityExchangeDocumentId)
        .collection('comments')
        .doc(commentDocumentId);

    // Update the specific field with the new value
    await documentRef.update({fieldToUpdate: newValue});

    print('Comment field updated successfully!');
  } catch (error) {
    print('Error updating comment: $error');
  }
}


Future<void> modifyLikesNumber(
    String communityExchangeDocumentId, String commentDocumentId, String fieldToUpdate, newValue) async {
  try {
    DocumentReference documentRef = firestore
        .collection('communityExchange')
        .doc(communityExchangeDocumentId)
        .collection('comments')
        .doc(commentDocumentId);

    await documentRef.update({fieldToUpdate: newValue});

    print('Likes Number updated successfully!');
  } catch (error) {
    print('Error updating likes umber: $error');
  }
}