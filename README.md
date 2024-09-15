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


lib/
├── core/                         
│   ├── services/                 # API services, third-party integrations
│   │   ├── openai_service.dart   # Service for interacting with OpenAI API
│   │   └── claude_ai_service.dart # Service for converting text to speech (Claude AI)
│   ├── utils/                    # Utility classes, constants, helpers
│   │   └── app_constants.dart    # App-wide constants
├── data/                         
│   ├── repositories/             # Repository layer for managing data sources
│   │   └── story_repository.dart # Repository for handling story logic
├── domain/                       
│   ├── models/                   # Business logic and model classes
│   │   └── story_model.dart      # Model representing a Story
├── presentation/                 
│   ├── screens/                  # UI screens
│   │   └── home_screen.dart      # Main screen where the user inputs prompt and sees generated story
│   ├── widgets/                  # Reusable UI components
│   │   └── story_display.dart    # Widget for displaying the generated story
├── main.dart                     # Application entry point
