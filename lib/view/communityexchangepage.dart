import 'package:flutter/material.dart';

class CommunityExchangePage extends StatefulWidget {
  const CommunityExchangePage({super.key});

  @override
  State<CommunityExchangePage> createState() => _CommunityExchangePageState();
}

class _CommunityExchangePageState extends State<CommunityExchangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Community Exchange",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
