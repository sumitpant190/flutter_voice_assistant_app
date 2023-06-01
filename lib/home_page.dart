import 'package:flutter/material.dart';
import 'package:flutter_voice_assistant_app/features_box.dart';
import 'package:flutter_voice_assistant_app/pallete.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  String lastWords = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    //print('listening');
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    speechToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Optimus'),
        leading: const Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //virtual assistant picture
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Pallete.assistantCircleColor,
                        shape: BoxShape.circle),
                  ),
                ),
                Container(
                  height: 123,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/virtualAssistant.png'))),
                )
              ],
            ),
            //chat bubble
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              margin:
                  const EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Pallete.borderColor,
                  ),
                  borderRadius:
                      BorderRadius.circular(20).copyWith(topLeft: Radius.zero)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Hey, what can i do for you?',
                  style: TextStyle(
                      color: Pallete.mainFontColor,
                      fontSize: 20,
                      fontFamily: 'Cera Pro'),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10, left: 22),
              child: const Text(
                'Here are few features',
                style: TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Pallete.mainFontColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //features list
            Column(
              children: [
                FeaturesBox(
                  color: Pallete.firstSuggestionBoxColor,
                  descriptionText:
                      'A smarter way to stay organized powered by ChatGPT',
                  headerText: 'ChatGPT',
                ),
                FeaturesBox(
                    headerText: 'Dall-E',
                    color: Pallete.secondSuggestionBoxColor,
                    descriptionText:
                        'Get inspired and stay creative with your personal assistant powered by Dall-E'),
                FeaturesBox(
                    headerText: 'Smart Voice Assistant',
                    color: Pallete.thirdSuggestionBoxColor,
                    descriptionText:
                        'Get the best of both worlds with voice assistant powered by ChatGPT and Dall-E'),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();
            print('startlistening ');
          } else if (speechToText.isListening) {
            await stopListening();
            print('stop listening');
            print(lastWords);
          } else {
            await initSpeechToText();
            print('initspeech');
          }
        },
        child: Icon(Icons.mic),
      ),
    );
  }
}
