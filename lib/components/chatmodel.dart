class Message {
  final String sender;
  final String text;

  Message({
    required this.sender,
    required this.text,
  });
}

List<Message> messages = [
  Message(
    sender: "Pet",
    text:
        "Hey there, that sounds rough.  Don't worry, I'm here to help!  Feeling down happens to the best of us.  Would you like to chat about it, or are you more in the mood for a distraction?  We could grab a cup of your favorite tea and brainstorm some ways to brighten your day.  Or maybe a funny movie marathon to chase away the blues?  Just let me know how I can be your personal meowleader!",
  ),
  Message(
    sender: "User",
    text: "I've been feeling a bit down in the dumps lately, to be honest.",
  ),
  Message(
    sender: "Pet",
    text: "Good Meowning! I'm great, thanks for asking, meow! How are you?",
  ),
  Message(
    sender: "User",
    text: "Hello, how are you today?",
  ),
];
