import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  final String _apiKey = 'AIzaSyBKjAp8Xs9BFLxCx7g8NXA6GXnr5NIUD3k';

  Future<String> getReply(String userMessage) async {
    const url =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "contents": [
        {
          "role": "user",
          "parts": [
            {
              "text":
                  "You are HostelMate AI, a smart assistant for hostel-related queries. Your role is to help students with hostel rules, maintenance, check-in/out process, caretaker contacts, complaint tracking, lost and found, and other hostel services. Be short, friendly, confident, and do not mention that you are an AI language model.Answer smartly to all questions and maintain a friendly tone. If you don't know the answer, say it - make it up based on your knowledge of how hostels should work. Dont be repetative use greetings only once in coversation."
            }
          ]
        },
        {
          "role": "user",
          "parts": [
            {"text": userMessage}
          ]
        }
      ]
    });

    final response = await http.post(
      Uri.parse('$url?key=$_apiKey'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final reply =
          data['candidates']?[0]?['content']?['parts']?[0]?['text'] ?? '';
      return reply;
    } else {
      print('❌ Error from Gemini: ${response.statusCode} ${response.body}');
      return 'Sorry, I couldn\'t answer your question right now.';
    }
  }
}
