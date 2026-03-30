

import 'dart:convert';
import 'package:http/http.dart' as http;

class ClaudeService {
  static const String _apiKey = '';
  static const String _url = 'https://api.anthropic.com/v1/messages';

  static Future<String> summarizeArticle(String content) async {
    try {
      final response = await http.post(
        Uri.parse(_url),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': _apiKey,
          'anthropic-version': '2023-06-01',
        },
        body: jsonEncode({
          "model": "claude-haiku-4-5-20251001",
          "max_tokens": 300,
          "messages": [
            {
              "role": "user",
              "content": "Summarize this news article in 3-4 simple sentences:\n\n$content"
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['content'][0]['text'];
      } else {
        print('Status Code: ${response.statusCode}');
        print('Error: ${response.body}');
        return 'Summary load nahi ho saka.';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}