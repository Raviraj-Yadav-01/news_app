
import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String _apiKey = '';
 
  static const String _url = 'https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash-latest:generateContent';

  static Future<String> summarizeArticle(String content, {required String mode}) async {
    try {
      final response = await http.post(
        Uri.parse('$_url?key=$_apiKey'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {
                  "text": "You are a news assistant. Summarize the following article in 4 bullet points. Keep it simple and highlight key facts:\n\n$content",
                }
              ]
            }
          ]
        }),
      );
      if (response.statusCode == 200) {

        final data = jsonDecode(response.body);
        return data['candidates'][0]['content']['parts'][0]['text'];

      } else {

        //return 'Summary load nahi ho saka. Try again.';
        print('Status Code: ${response.statusCode}');
        print('Error Body: ${response.body}');
        return 'Error: ${response.statusCode} - ${response.body}';

      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}