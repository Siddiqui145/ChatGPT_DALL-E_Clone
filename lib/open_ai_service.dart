import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:voic_assistant/secrets.dart';
class OpenAiService {
  Future<String> isArtPromptAPI(String prompt) async{
    try{
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIKey'
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              'role': 'user',
              'content':
                'Does this message wants to generate an AI picture, image, art or anything similar? $prompt. Answer with a yes or no.'
            }
          ]
        })
      );
      print(res.body);
      if(res.statusCode == 200){
        String content = jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim(); //for spaces removal

        switch(content){
          case 'Yes':
          case 'yes':
          case 'Yes.':
          case 'yes.':
          final res = await dallEApi(prompt);
          return res;

          default:
          final res = await chatGPTAPI(prompt);
          return res;
        }
      }
      return 'An Internal Error Occured!';
    }
    catch (e){
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async{
    return 'CHATGPT';
  }

  Future<String> dallEApi(String prompt)async{
    return 'DALL-E';
  }
}