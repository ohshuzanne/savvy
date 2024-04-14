import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:lottie/lottie.dart';

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


class summuryArticle extends StatelessWidget {

  final content;

  const summuryArticle({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future:
        getResponeFromGemini(contentToBeSummarized: content),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var jsonResponse = jsonDecode(snapshot.data);
            int responseLength = jsonResponse.length;

            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ListView.builder(
                itemCount: responseLength,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int ctr) {

                  return Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Column(children: [
                      ctr == 0 ? Padding(
                        padding: const EdgeInsets.only(top: 13, bottom: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Image.asset(
                          "lib/images/3dcat.png",
                          width: 30,
                          height: 30,
                        ), const SizedBox(width: 10,),
                            const Text("Summarized 5 Minutes Read.", style: TextStyle(
                        fontFamily: 'Lexend', fontSize: 12,fontWeight: FontWeight.bold))],),
                      ):const Text(""),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "${jsonResponse[ctr]['title']}",
                          style: const TextStyle(
                              fontFamily: 'Legend', fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text("${jsonResponse[ctr]['content']}",textAlign: TextAlign.justify, style: const TextStyle(
                          fontFamily: 'Lexend', fontSize: 12),),
                      // const Text('\n'),
                    ]),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Text(
              'Sorry, AI Function does not work at this moment, Try again later..', style: TextStyle(
                fontFamily: 'Lexend', fontSize: 12),);
          } else {
            return SizedBox(
                width: 70,
                height: 70,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,),
                      child: Image.asset(
                        "lib/images/3dcat.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const Text(
                      "\t  Maomi is summarizing for you",
                      style: TextStyle(
                          fontFamily: 'Lexend', fontSize: 12),
                    ),
                    Lottie.asset('lib/images/typing_lottie.json'),
                  ],
                ));
          }
        },
      ),
    );
  }
}
