import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/repositories/story_repository.dart';
import '../../presentation/widgets/story_display.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _promptController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String? _generatedStory;
  bool _labelVisible = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _promptController.addListener(_onTextChanged);
    // Delay the appearance of the label
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _labelVisible = true;
        _animationController.forward();
      });
    });
  }

  void _onTextChanged() {
    setState(() {
      _labelVisible = _promptController.text.isEmpty;
    });
  }

  @override
  void dispose() {
    _promptController.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storyRepository = context.read<StoryRepository>();

    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Color.fromARGB(255, 70, 55, 79), const Color.fromARGB(255, 41, 143, 45), Color.fromARGB(255, 101, 98, 68), Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            'Story Generator',
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold, 
               color: Colors.white, 
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(218, 224, 207, 238), 
        ),// Set the background color of the AppBar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Gradient Container with animated label text
            Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green, Colors.yellow, Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 233, 228, 237),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      // Animated label transition
                      if (_labelVisible)
                      AnimatedOpacity(
                        opacity: _labelVisible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                          child: Text(
                            "Create your story",
                            style: TextStyle(color: Colors.grey, fontSize: 16.0),
                          ),
                        ),
                      ),
                      // TextField without border
                      TextField(
                        controller: _promptController,
                        focusNode: _focusNode,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                           contentPadding: const EdgeInsets.only(left: 12.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Generate Story button
            ElevatedButton(
              onPressed: () async {
                try {
                  final story = await storyRepository.getGeneratedStory(_promptController.text);
                  setState(() {
                    _generatedStory = story;
                  });
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to generate story: $e')),
                  );
                }
              },
              child: Text('Generate Story'),
            ),
            SizedBox(height: 16),
            // Display generated story if available
            if (_generatedStory != null)
              StoryDisplay(
                story: _generatedStory!,
                onPlay: () => storyRepository.playStoryAsSpeech(_generatedStory!),
                onStop: storyRepository.stopStoryPlayback,
              ),
          ],
        ),
      ),
    );
  }
}
