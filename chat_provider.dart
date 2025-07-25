import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatProvider extends ChangeNotifier {
  List<Map<String, String>> messages = [];

  Future<void> sendMessage(String userMessage) async {
    messages.add({"role": "user", "content": userMessage});
    notifyListeners();

    try {
      final res = await http.post(
        Uri.parse('http://192.168.1.70:8000/ask'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"message": userMessage}),
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        messages.add({"role": "bot", "content": data['reply']});
      } else {
        messages.add({"role": "bot", "content": "Error: ${res.statusCode}"});
      }
    } catch (e) {
      messages.add({"role": "bot", "content": "Something went wrong!"});
    }

    notifyListeners();
  }
}
