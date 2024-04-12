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

Future<GenerateContentResponse> getResponeFromGemini(
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
Respone only in Json in this given format {"title": title,"content":content}, stored multiple title and content is allowed.
Summarize the key points, Provide a concise summary directly, highlighting the main ideas and any important details of the following given article in 5 minutes, 
Response directly to summarized article without addition conversation.
Do not response in Markdown, neither contain *.
Given article: 
""";
  /*const prompt = '''
  summarize the key points of the following article in 5 minutes.
  Provide a concise summary directly, highlighting the main ideas and any important details.
  Response directly to summarized article without addition conversation.
  Do not response in Markdown, neither contain *.
  Given article: ''';*/
  final content = [Content.text("$newPrompt $contentToBeSummarized")];
  print("Sending respone to Gemini...");
  final response = await model.generateContent(content);
  print("response get : $response");
  return response;
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
