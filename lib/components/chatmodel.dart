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
    text: "I'm great, thanks for asking!",
  ),
  Message(
    sender: "User",
    text: "Hello, how are you today?",
  ),
];
