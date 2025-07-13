import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:voic_assistant/secrets.dart';
class OpenAiService {
  final List<Map<String, String>> messages = [];
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
      messages.add({
        'role': 'user',
        'content': prompt // Need to store for future prompts reference
      });
      try{
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIKey'
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages,
        })
      );
      print(res.body);
      if(res.statusCode == 200){
        String content = jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim(); //for spaces removal

        messages.add({
          'role': 'assistant',
          "content": content,
        });
        return content;
      }
      return 'An Internal Error Occured!';
    }
    catch (e){
      return e.toString();
    }
  }

  Future<String> dallEApi(String prompt)async{
        messages.add({
        'role': 'user',
        'content': prompt // Need to store for future prompts reference
      });
      try{
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/images/generations'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIKey'
        },
        body: jsonEncode({
          'prompt': prompt, //generating only 1 image at a time
          'n': 1,
        })
      );
      print(res.body);
      if(res.statusCode == 200){
        String imageUrl = jsonDecode(res.body)['data'][0]['url'];
        imageUrl = imageUrl.trim(); //for spaces removal

        messages.add({
          'role': 'assistant',
          "content": imageUrl,
        });
        return imageUrl;
      }
      return 'An Internal Error Occured!';
    }
    catch (e){
      return e.toString();
    }
  }
}