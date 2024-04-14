import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

//Jialing
final String? geminiAPIKey = dotenv.env['GeminiAPIKey'];

GenerationConfig _generationConfig = GenerationConfig(
  temperature: 0.9,
  topK: 1,
  topP: 1,
  maxOutputTokens: 2048,
);

List<SafetySetting> _safetySettings = [
  SafetySetting(
    HarmCategory.harassment,
    HarmBlockThreshold.medium,
  ),
  SafetySetting(
    HarmCategory.hateSpeech,
    HarmBlockThreshold.medium,
  ),
  SafetySetting(
    HarmCategory.sexuallyExplicit,
    HarmBlockThreshold.medium,
  ),
  SafetySetting(
    HarmCategory.dangerousContent,
    HarmBlockThreshold.medium,
  ),
];

Future getResponeFromGemini(
    {required contentToBeSummarized}) async {
  print("Started Connecting to Gemini");

  final model = GenerativeModel(
    model: "gemini-pro",
    apiKey: geminiAPIKey!,
    generationConfig: _generationConfig,
    safetySettings: _safetySettings,
  );

  print("Gemeni Model Connected");

  const newPrompt = """
Respone only in Json in this given format [{"title":title,"content":content},{"title":title,"content":content},...], multiple title and content is allowed in jsonArray format.
Summarize the key points, Provide a concise summary directly, highlighting the main ideas and any important details of the following given article in 5 minutes, 
Response directly to summarized article without addition conversation.
Do not response in Markdown, neither contain *.
use only English as your Language.
Given article: 
""";

  final content = [Content.text("$newPrompt $contentToBeSummarized")];
  print("Sending respone to Gemini...");
  final response = await model.generateContent(content);
  // print("response get : ${response}");
  // print("response get candidates: ${response.candidates}");
  // print("response get candidates first: ${response.candidates.first}");
  // print("response get promptfeedback: ${response.promptFeedback}");
  print("response get TEXT : ${response.text}");
  // print("response get toJSBox: ${response.toJSBox}");

  var jsonResponse = jsonDecode(response.text!);
  print("jsonResponse get : ${jsonResponse}");
  print("jsonResponse get : ${jsonResponse[0]}");
  print("jsonResponse get : ${jsonResponse[0]['title']}");
  print("jsonResponse get length: ${jsonResponse.length}");


  return response.text;
}

String? applyMarkdownBold(String? text) {
  final boldRegex = RegExp(r'\*\*(.*?)\*\*'); // Regex for matching bold text
  return text?.replaceAllMapped(
      boldRegex, (match) => '<b>${match.group(1)}</b>');
}

parseMarkdownBold(String text) {
  final boldRegex =
      RegExp(r'\*\*(.*?)\*\*'); // Matches bold text within asterisks

  var children = [];
  var currentText = '';

  Map<String, dynamic> user = {
    'name': 'Alice',
    'age': 30,
    'hobbies': ['reading', 'coding'],
  };


  print("before allMatches");
  boldRegex.allMatches(text).forEach((match) {
    Map<String,dynamic> matches = {'start':match.start,'end':match.end};

    children.add(matches);
  });

  print(children);


  return children;
}
