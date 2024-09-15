import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class StoryDisplay extends StatelessWidget {
  final String story;
  final VoidCallback onPlay;
  final VoidCallback onStop;

  StoryDisplay({
    required this.story,
    required this.onPlay,
    required this.onStop,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 324,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.green, Colors.yellow, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0), // This creates the border effect
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 233, 228, 237),
                borderRadius: BorderRadius.circular(9),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedTextKit(
                    key: ValueKey<String>(story), // Ensure widget resets when the story changes
                    animatedTexts: [
                      TypewriterAnimatedText(
                        story,
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        speed: Duration(milliseconds: 100), // Adjust the typing speed
                        cursor: '|', // Optional: Customize the cursor style
                      ),
                    ],
                    totalRepeatCount: 1, // Only play the animation once
                    displayFullTextOnTap: true, // If tapped, show the full text immediately
                    stopPauseOnTap: true, // If tapped while typing, stop typing and show the full text
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
              onPressed: onPlay,
              child: Text('Play Story'),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: onStop,
              child: Text('Stop Story'),
            ),
          ],
        ),
      ],
    );
  }
}
