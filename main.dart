import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_provider.dart';
import 'chat_screen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ChatProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot',
      debugShowCheckedModeBanner: false,
      home: const ChatScreen(),
    );
  }
}
