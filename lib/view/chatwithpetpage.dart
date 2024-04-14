import 'package:flutter/material.dart';
import 'package:savvy/components/gradient_background.dart';
import 'package:savvy/components/chatmodel.dart';
import 'package:savvy/utils/colors.dart';
import 'package:savvy/components/showdialog.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ChatWithPetPage extends StatefulWidget {
  const ChatWithPetPage({Key? key}) : super(key: key);

  @override
  State<ChatWithPetPage> createState() => _ChatWithPetPageState();
}

class _ChatWithPetPageState extends State<ChatWithPetPage>
    with TickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  bool _isFilled = false;
  bool _isTyping = false;
  List<AnimationController> _animationControllers = [];

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: darkGrey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 23,
              child: Image.asset('lib/images/savvylogo.png'),
            ),
            const Text(
              "avvy",
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              CustomAlertDialog.showAlertDialog(
                context,
                "This page is used for registered users to sign in. Please return to the previous page if you are not a registered user.",
                "Info",
                textColor: darkGrey,
              );
            },
            icon: const Icon(Icons.info_outline_rounded,
                size: 22, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            const SecondPurpleBackgroundShapesState(),
            Column(
              children: <Widget>[
                //pet card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: backgroundWhite,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 7,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        0,
                        20,
                        0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            child: Image.asset('lib/images/3dcat.png'),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    25,
                                    18,
                                    10,
                                    0,
                                  ),
                                  child: Text(
                                    "You are now chatting with Maomi!",
                                    style: TextStyle(
                                      fontFamily: 'Lexend',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    25,
                                    5,
                                    10,
                                    0,
                                  ),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Status:  ",
                                        style: TextStyle(
                                          fontFamily: 'Lexend',
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Container(
                                        width: 18,
                                        height: 18,
                                        child: Image.asset(
                                            'lib/images/3dheart.png'),
                                      ),
                                      const Text(
                                        "  Besties!",
                                        style: TextStyle(
                                          fontFamily: 'Lexend',
                                          color: darkBlue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Expanded(
                  child: ListView.builder(
                    itemCount: messages.length + (_isTyping ? 1 : 0),
                    reverse: true,
                    itemBuilder: (context, index) {
                      if (_isTyping && index == 0) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: const Text("Maomi is thinking...",
                                  style:
                                      TextStyle(fontStyle: FontStyle.italic)),
                            ),
                          ),
                        );
                      }
                      final actualIndex = _isTyping ? index - 1 : index;
                      final msg = messages[actualIndex];
                      return Align(
                        alignment: msg.sender == "User"
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            msg.sender == "User" ? 40 : 10,
                            5,
                            msg.sender == "Pet" ? 40 : 10,
                            5,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              color: msg.sender == "User"
                                  ? darkBlue
                                  : backgroundWhite,
                              child: Text(msg.text,
                                  style: TextStyle(
                                      color: msg.sender == "User"
                                          ? Colors.white
                                          : darkGrey,
                                      fontSize: 14,
                                      fontFamily: 'Lexend')),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                //send message
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _messageController,
                            onChanged: (value) {
                              setState(() {
                                _isFilled = value.isNotEmpty;
                              });
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: backgroundWhite),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: darkBlue),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              fillColor: backgroundWhite,
                              filled: true,
                              hintText: 'Send a message',
                              hintStyle:
                                  const TextStyle(color: Colors.grey, fontSize: 14),
                              labelText: _isFilled ? null : 'Send a message',
                              labelStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                fontFamily: 'Lexend',
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send, color: darkBlue),
                          onPressed: _isFilled ? _sendMessage : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    final String messageText = _messageController.text;
    final Message newMessage = Message(sender: "User", text: messageText);
    setState(() {
      messages.insert(0, newMessage);
      _messageController.clear();
      _isFilled = false;
      _isTyping = true;
    });

    Timer(const Duration(seconds: 4), () {
      final Message petResponse = Message(
          sender: "Pet",
          text:
              "Meow! You're on the right track with saving after debts! Since risks aren't your purrfurrence, let's look at safe options.\n\nConsider a High-interest Savings Account (HISA) for easy access and decent returns. Shop around for the best rates!  Fixed Deposits (FDs) are good if you don't need the money for a while and want a guaranteed interest rate. The longer you commit, the higher the return.\n\nFor shariah-compliant saving, Amanah Savings Accounts (ASAs) are an option.  Remember, research is key even with safe investments! Check the Malaysian Securities Commission (https://www.sc.com.my/) to start.\n\nRM290 is a great start, but consider ways to grow your income over time to reach bigger goals!  Good luck!");
      setState(() {
        _isTyping = false;
        messages.insert(0, petResponse);
      });
    });
  }
}
