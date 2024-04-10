import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  static String _userId = "KamWcLVnU6zZip7TYXGg";

  String get userId => _userId;

  double _budget = 0;

  double get budget => _budget;

  void setBudget(double budget){
    _budget=budget;
    notifyListeners();
  }

  double _balance = 0;

  double get balance => _balance;

  void setBalance(double balance){
    _balance = balance;
    notifyListeners();
  }

  double _income = 0;

  double get income => _income;

  void setIncome(double income){
    _income = income;
    notifyListeners();
  }


}