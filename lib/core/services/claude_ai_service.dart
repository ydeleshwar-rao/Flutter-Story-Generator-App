import 'package:flutter_tts/flutter_tts.dart';

class ClaudeAIService {
  final FlutterTts _flutterTts = FlutterTts();

  Future<void> convertTextToSpeech(String story) async {
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(story);
  }

  Future<void> stopSpeech() async {
    await _flutterTts.stop();
  }
}
