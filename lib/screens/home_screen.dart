import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voic_assistant/open_ai_service.dart';
import 'package:voic_assistant/pallete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //first we need to initialize it
  final speechToText = SpeechToText();
  String lastWords = '';  // This variable would actually store our words whatever we said
  final openAiService = OpenAiService();
  final flutterTts = FlutterTts();
  String? generatedContent;
  String? generatedImageUrl;

  @override
  void initState(){
    super.initState();
    initSpeechToText(); // for permissions we must be initializing it
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async{
    await flutterTts.setSharedInstance(true); //documentation
    setState(() {});
  }

  // Methods taken from documents
  Future<void> initSpeechToText() async{
    await speechToText.initialize();
    setState(() {});
  }
  
  Future<void> startListening() async {
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

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);  //this would speak the content generated
  }

  @override
  void dispose(){
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Allen"),
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(
          horizontal: 8
        ),
        child: Column(
          children: [
            Stack(
              children: [
                // The first part in the stack is always back, the next one is upper
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    margin: EdgeInsets.only(
                      top: 4
                    ),
                    decoration: BoxDecoration(
                      color: Pallete.assistantCircleColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  height: 125,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage("assets/images/virtualAssistant.png"))
                  ),
                )
              ],
            ),
            
            Visibility(
               visible: generatedContent == null && generatedImageUrl == null,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 40
                ).copyWith(
                  top: 30
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Pallete.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(20).copyWith(
                    topLeft: Radius.zero
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    generatedContent == null ?
                    "Good Morning, what task can i do for you?"
                    : generatedContent!,
                  style: TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Pallete.mainFontColor,
                    fontSize: generatedContent == null ? 22 : 18
                  ),),
                ),
              ),
            ),
            if(generatedImageUrl!= null)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(generatedImageUrl!)),
              ),
                Visibility(
                  visible: generatedContent == null && generatedImageUrl == null,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 10, left: 22),
                    child: Text("Here's a list of Features",
                    style: TextStyle(
                      fontFamily: 'Cera Pro',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Pallete.mainFontColor
                    ),),
                  ),
                ),
                Visibility(
                  visible: generatedContent == null && generatedImageUrl == null,
                  //visible only when content is not generated
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12
                          ),
                          decoration: BoxDecoration(
                            color: Pallete.firstSuggestionBoxColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ChatGPT",
                              style: TextStyle(
                                fontFamily: 'Cera Bold',
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),),
                              const SizedBox(height: 5,),
                              Text("A smarter way to stay organised and informed with chatGPT",
                              style: TextStyle(
                                fontFamily: 'Cera Pro',
                                fontSize: 16,
                              ),),
                            ],
                          ),
                        ),
                  
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 18),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12
                          ),
                          decoration: BoxDecoration(
                            color: Pallete.secondSuggestionBoxColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dall-E",
                              style: TextStyle(
                                fontFamily: 'Cera Bold',
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),),
                              const SizedBox(height: 5,),
                              Text("Get inspired and stay creative with your personal assistant powered by Dall-E",
                              style: TextStyle(
                                fontFamily: 'Cera Pro',
                                fontSize: 16,
                              ),),
                            ],
                          ),
                        ),
                  
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12
                          ),
                          decoration: BoxDecoration(
                            color: Pallete.thirdSuggestionBoxColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Smart Voice Assistant",
                              style: TextStyle(
                                fontFamily: 'Cera Bold',
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),),
                              const SizedBox(height: 5,),
                              Text("Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT",
                              style: TextStyle(
                                fontFamily: 'Cera Pro',
                                fontSize: 16,
                              ),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          ],
        ),),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () async{
        // Users clicks it will listen
        if(await speechToText.hasPermission && 
        speechToText.isNotListening){
          await startListening();
        }
        // If already listening then clicked means we need to stop
        else if(speechToText.isListening){
          final speech = await openAiService.isArtPromptAPI(lastWords); //whatever prompt was given we will check once user stops recording what user exactly needs
          if(speech.contains('https')){
            generatedImageUrl = speech; //coz for image we don't need speech
            generatedContent = null;
            setState(() {});
          }
          else{
            generatedImageUrl = null;
            generatedContent = speech;
            setState(() {});
            await systemSpeak(speech);
          }
          await stopListening();
        }
        // both cases fail, means we don't have permisson, so get permission
        else{
          initSpeechToText();
        }
      },
      backgroundColor: Pallete.firstSuggestionBoxColor,
      child: Icon(speechToText.isListening ? Icons.stop : Icons.mic),),
    );
  }
}