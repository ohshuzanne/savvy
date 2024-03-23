import 'package:flutter/material.dart';


List<String> cats = ["Food", "Transportation", "Shopping", "Other"];

IconData getIcons(String cat){
  if (cat == "Food"){
    return Icons.fastfood_rounded;
  }
  else if (cat == "Transportation"){
    return Icons.train_rounded;
  }
  else if (cat == "Shopping"){
    return Icons.shopping_cart;
  }
  else{
    return Icons.widgets_rounded;
  }
}