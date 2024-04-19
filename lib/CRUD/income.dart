import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../provider/user_provider.dart';

class Income {
  String id;
  String title;
  double amount;
  DateTime timestamp;

  Income({
    this.id = "", required this.title,
    required this.amount,
    required this.timestamp});

  Income.empty({
    this.id = "",
    this.title = "",
    this.amount = 0,
    DateTime? dateTime
  }) : timestamp = dateTime ?? DateTime.now()
  ;

  static Income incomeFromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Income(
        id: snapshot['id'],
        title: snapshot['title'],
        amount: snapshot['amount'],
        timestamp: snapshot['timestamp'].toDate());
  }
}

class IncomeController {
  static String userId = UserProvider().userId;
  final CollectionReference incomeCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('income');

  Future<void> createIncome(Income income) async {
    var uuid = const Uuid();
    String newUuid = uuid.v4();
    await incomeCollection.doc(newUuid).set({
      'id':newUuid,
      'title': income.title,
      'amount': income.amount,
      'timestamp': income.timestamp
    });
  }

  Future<void> deleteIncome(Income income) async {
    await incomeCollection.doc(income.id).delete();
  }

  Future<void> editIncome(Income income) async {
    await incomeCollection.doc(income.id).set({
      'id':income.id,
      'title': income.title,
      'amount': income.amount,
      'timestamp': income.timestamp
    });
  }

  Stream<QuerySnapshot> getIncome() {
    return incomeCollection.snapshots();
  }
}
