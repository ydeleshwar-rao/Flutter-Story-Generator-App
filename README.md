# story_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

This Flutter app generates creative stories based on user input using OpenAI's GPT-3.5-turbo chat model. The app also converts the generated text into speech using Claude AI.

Features
Input a prompt to generate a story using OpenAI's API.
Converts the generated story into speech using Claude AI.
Displays the generated story in a user-friendly UI.
Cross-platform support for both Android and iOS.
File Structure
The project follows a modular structure to separate concerns and make it easy to scale. Below is the breakdown of the folder structure:

graphql
Copy code
lib/
├── core/                         
│   ├── services/                 
│   │   ├── openai_service.dart    # Handles OpenAI API for story generation
│   │   └── claude_ai_service.dart # Handles text-to-speech conversion using Claude AI
│   ├── utils/                    
│   │   └── app_constants.dart     # Stores app constants like API keys
├── data/                         
│   ├── repositories/             
│   │   └── story_repository.dart  # Story generation logic, communicates with OpenAI service
├── domain/                       
│   ├── models/                   
│   │   └── story_model.dart       # Defines the structure of a story
├── presentation/                 
│   ├── screens/                  
│   │   └── home_screen.dart       # Main screen for user input
│   ├── widgets/                  
│   │   └── story_display.dart     # Widget to display the generated story
├── main.dart                      # Entry point of the Flutter application
Requirements
Before running the project, ensure that you have the following setup on your local machine:

Flutter SDK: Install Flutter if you haven't already.
OpenAI API Key: Create an account and get an API key from OpenAI.
Claude AI API Key: (Optional) If using text-to-speech, get an API key for Claude AI.
Android/iOS Emulator: Make sure you have an emulator set up or a physical device to run the app.
Installation
Follow these steps to set up the project on your local machine:

Clone the Repository

bash
Copy code
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
Install Dependencies

Run the following command to install Flutter dependencies:

bash
Copy code
flutter pub get
Set up API Keys

Open the file lib/core/utils/app_constants.dart and add your OpenAI API key and Claude AI API key (if available):

dart
Copy code
class AppConstants {
  static const openAIKey = 'YOUR_OPENAI_API_KEY';  // Add your OpenAI key here
  static const claudeAIKey = 'YOUR_CLAUDE_AI_API_KEY';  // Add your Claude AI key here
}
Run the App

To run the app, make sure your emulator is running or your device is connected. Then, execute the following command:

bash
Copy code
flutter run
How It Works
1. Story Generation
User Input: The user provides a text prompt, which is sent to OpenAI's GPT-3.5-turbo model via the openai_service.dart file.
API Call: The generateStory function sends a POST request to OpenAI's API, providing the prompt. The response contains the generated story.
2. Text-to-Speech (Optional)
If enabled, the app uses Claude AI to convert the generated text into speech. This logic is handled in claude_ai_service.dart.
3. Displaying the Story
Once the story is generated, it is displayed on the HomeScreen using the StoryDisplay widget.
Project Breakdown
Core
lib/core/services/openai_service.dart

Manages API calls to OpenAI to generate stories based on user input.
Sends user prompts to the v1/chat/completions endpoint of OpenAI and retrieves the response.
lib/core/services/claude_ai_service.dart

Converts text into speech using Claude AI's text-to-speech services.
lib/core/utils/app_constants.dart

Contains constants such as API keys used across the app.
Data
lib/data/repositories/story_repository.dart
Handles the business logic for generating stories.
Interacts with the OpenAI service to retrieve the generated story.
Domain
lib/domain/models/story_model.dart
Defines the data structure of the generated story.
Presentation
lib/presentation/screens/home_screen.dart

Main screen of the app where users input their prompts to generate stories.
Contains a TextField for the prompt and a button to generate the story.
lib/presentation/widgets/story_display.dart

Displays the generated story on the screen for the user to read.
Troubleshooting
API Key Error: Ensure that you have correctly entered your OpenAI and Claude AI API keys in the app_constants.dart file.
Flutter SDK Issues: Make sure that Flutter SDK is correctly installed and you are using a stable version.
Device Issues: Ensure that your Android/iOS emulator is running, or your device is connected to your machine via USB.
Future Enhancements
Add more customization options for users to refine the generated story.
Implement different story genres and writing styles.
Add more robust error handling and user feedback for API-related issues.
Enhance the text-to-speech feature for better audio quality.
Contributing
Feel free to fork this repository and contribute. Create a new branch, implement your changes, and submit a pull request.

License
This project is licensed

