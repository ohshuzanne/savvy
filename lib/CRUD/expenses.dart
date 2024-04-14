import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../provider/user_provider.dart';

class Expenses {
  String id;
  String title;
  String category;
  double amount;
  DateTime timestamp;

  Expenses({
    this.id = "", required this.title,
    required this.category,
    required this.amount,
    required this.timestamp});

  Expenses.empty({
    this.id = "",
    this.title = "",
    this.category = "",
    this.amount = 0,
    DateTime? dateTime
  }) : timestamp = dateTime ?? DateTime.now()
  ;

  static Expenses expensesFromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Expenses(
        id: snapshot['id'],
        title: snapshot['title'],
        category: snapshot['category'],
        amount: snapshot['amount'],
        timestamp: snapshot['timestamp'].toDate());
  }
}

class ExpensesController {
  static String userId = UserProvider().userId;
  final CollectionReference expensesCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('transactions');

  Future<void> createExpenses(Expenses expenses) async {
    var uuid = const Uuid();
    String newUuid = uuid.v4();
    await expensesCollection.doc(newUuid).set({
      'id':newUuid,
      'title': expenses.title,
      'category': expenses.category,
      'amount': expenses.amount,
      'timestamp': expenses.timestamp
    });
  }

  Future<void> deleteExpenses(Expenses expenses) async {
    await expensesCollection.doc(expenses.id).delete();
  }

  Future<void> editExpenses(Expenses expenses) async {
    await expensesCollection.doc(expenses.id).set({
      'id':expenses.id,
      'title': expenses.title,
      'category': expenses.category,
      'amount': expenses.amount,
      'timestamp': expenses.timestamp
    });
  }

  Stream<QuerySnapshot> getTransactions() {
    return expensesCollection.snapshots();
  }
}
