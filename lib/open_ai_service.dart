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
        print("yayyy");
      }
      return 'Ai';
    }
    catch (e){
      return e.toString();
    }
  }
}