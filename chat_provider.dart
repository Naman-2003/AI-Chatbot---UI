import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatProvider extends ChangeNotifier {
  List<Map<String, String>> messages = [];

  final String backendUrl = 'http://10.156.204.199:8000/chat'; // ✅ Updated URL

  Future<void> sendMessage(String userMessage) async {
    // Add user message
    messages.add({"role": "user", "content": userMessage});
    notifyListeners();

    try {
      final res = await http.post(
        Uri.parse(backendUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"message": userMessage}),
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        messages.add({"role": "bot", "content": data['reply'] ?? "🤖 No response."});
      } else {
        messages.add({
          "role": "bot",
          "content": "❌ Error ${res.statusCode}: ${res.reasonPhrase}"
        });
      }
    } catch (e) {
      messages.add({"role": "bot", "content": "⚠️ Failed to connect to the server."});
    }

    notifyListeners();
  }
}
