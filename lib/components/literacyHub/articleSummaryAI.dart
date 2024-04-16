import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:lottie/lottie.dart';

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

Future getResponeFromGemini({required contentToBeSummarized}) async {
  final model = GenerativeModel(
    model: "gemini-pro",
    apiKey: geminiAPIKey!,
    generationConfig: _generationConfig,
    safetySettings: _safetySettings,
  );

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
  return response.text;
}


class SummuryArticle extends StatelessWidget{
  final content;
  const SummuryArticle({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: getResponeFromGemini(contentToBeSummarized: content),
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
                      ctr == 0
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 13, bottom: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "lib/images/3dcat.png",
                                    width: 30,
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text("Summarized 5 Minutes Read.",
                                      style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            )
                          : const Text(""),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "${jsonResponse[ctr]['title']}",
                          style: const TextStyle(
                              fontFamily: 'Legend',
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "${jsonResponse[ctr]['content']}",
                        textAlign: TextAlign.justify,
                        style:
                            const TextStyle(fontFamily: 'Lexend', fontSize: 12),
                      ),
                      // const Text('\n'),
                    ]),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Text(
              'Sorry, AI Function does not work at this moment, Try again later..',
              style: TextStyle(fontFamily: 'Lexend', fontSize: 12),
            );
          } else {
            return media.size.width > 500
                ? SizedBox(
                    width: 70,
                    height: 95,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30,bottom: 30),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 30.0,
                            ),
                            child: Image.asset(
                              "lib/images/3dcat.png",
                              width: 40,
                              height: 40,
                            ),
                          ),
                          const Text(
                            "\t  Maomi is summarizing for you",
                            style: TextStyle(fontFamily: 'Lexend', fontSize: 12),
                          ),
                          Lottie.asset('lib/images/typing_lottie.json'),
                        ],
                      ),
                    ))
                : SizedBox(
                    width: 70,
                    height: 95,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 5),
                          child: Row(
                            children: [
                              Image.asset(
                                "lib/images/3dcat.png",
                                width: 40,
                                height: 40,
                              ),
                              const Text(
                                "\t  Maomi is summarizing for you",
                                style: TextStyle(
                                    fontFamily: 'Lexend', fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Lottie.asset('lib/images/typing_lottie.json',
                            width: 60, height: 50),
                      ],
                    ));
          }
        },
      ),
    );
  }
}
