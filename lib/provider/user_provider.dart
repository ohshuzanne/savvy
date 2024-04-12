import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  static String _userId = "KamWcLVnU6zZip7TYXGg";

  String get userId => _userId;

  double _budget = 3000;

  double get budget => _budget;

  double _balance = 0;

  double get balance => _balance;

  void setBalance(double balance, var isAdd){
    if(isAdd == true){
      _balance += balance;
    }
    else if (isAdd == null){
      _balance = balance;
    }
    else{
      _balance -= balance;
    }

    notifyListeners();
  }

  double _income = 0;

  double get income => _income;

  void setIncome(double income){
    _income = income;
    print(income.toString());
    notifyListeners();
  }

  double _total = 0;

  double get total => _total;

  void setTotal(double total){
    _total = total;
  }


}