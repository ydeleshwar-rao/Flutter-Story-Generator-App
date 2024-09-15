import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/app_constants.dart';

class OpenAIService {
  Future<String> generateStory(String prompt) async {
    final url = Uri.parse('https://api.openai.com/v1/chat/completions');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${AppConstants.openAIKey}',
        },
        body: json.encode({
          "model": "gpt-3.5-turbo",
          'messages': [
            {
              'role': 'system',
              'content': 'You are a helpful assistant that generates creative stories based on user input.'
            },
            {
              'role': 'user',
              'content': prompt
            },
          ],
          "max_tokens": 150,
          "temperature": 0.7,
        }),
      );
      
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['choices'][0]['message']['content'].toString().trim();
      } else {
        throw Exception('Failed to generate story');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to generate story');
    }
  }
}
