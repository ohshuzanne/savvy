import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../provider/user_provider.dart';

class Expenses {
  String title;
  String category;
  double amount;
  DateTime timestamp;

  Expenses(
      {required this.title,
      required this.category,
      required this.amount,
      required this.timestamp});

  Expenses.empty({
    this.title = "",
    this.category = "",
    this.amount = 0,
    DateTime? dateTime
  }) : timestamp = dateTime ?? DateTime.now()
  ;

  static Expenses expensesFromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Expenses(
        title: snapshot['title'],
        category: snapshot['category'],
        amount: snapshot['amount'],
        timestamp: snapshot['timestamp']);
  }
}

class ExpensesController{
  static String userId = UserProvider().userId;
  final CollectionReference expensesCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('transactions');

  Future<void> createExpenses(Expenses expenses) async {
    var uuid = const Uuid();
    String newUuid = uuid.v4();
    await expensesCollection.doc(newUuid).set({

      'title': expenses.title,
      'category': expenses.category,
      'amount': expenses.amount,
      'timestamp': expenses.timestamp
    });
  }

  Future<void> deleteExpenses(String expensesID) async {
    await expensesCollection.doc(expensesID).delete();
  }

  Future<void> editExpenses(Expenses expenses, String expensesID) async {
    await expensesCollection.doc(expensesID).set({
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
