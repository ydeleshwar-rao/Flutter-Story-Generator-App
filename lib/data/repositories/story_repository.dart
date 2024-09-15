import 'package:story_app/core/services/openai_service.dart';
import 'package:story_app/core/services/claude_ai_service.dart';

class StoryRepository {
  final OpenAIService _openAIService;
  final ClaudeAIService _claudeAIService;

  StoryRepository(this._openAIService, this._claudeAIService);

  Future<String> getGeneratedStory(String prompt) async {
    return await _openAIService.generateStory(prompt);
  }

  Future<void> playStoryAsSpeech(String story) async {
    await _claudeAIService.convertTextToSpeech(story);
  }

  Future<void> stopStoryPlayback() async {
    await _claudeAIService.stopSpeech();
  }
}
