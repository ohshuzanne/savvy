
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareIcon extends StatelessWidget {
  late final numShare;

  ShareIcon({super.key,required this.numShare});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap:share,
          child: const Icon(Icons.share_outlined),),
        Text("$numShare",style: const TextStyle(fontSize: 10),),

      ],
    );
  }

  void share() {
    try {
      Share.share('Check out this website: https://www.example.com');
    } catch (e) {
      print('Sharing failed: $e');
    }
  }

}