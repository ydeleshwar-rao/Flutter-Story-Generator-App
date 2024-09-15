import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/services/openai_service.dart';
import 'core/services/claude_ai_service.dart';
import 'data/repositories/story_repository.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => OpenAIService()),
        Provider(create: (_) => ClaudeAIService()),
        ProxyProvider2<OpenAIService, ClaudeAIService, StoryRepository>(
          update: (context, openAIService, claudeAIService, _) =>
              StoryRepository(openAIService, claudeAIService),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Story Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
