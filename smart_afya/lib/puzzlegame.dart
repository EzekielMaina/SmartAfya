import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PuzzleGame extends StatefulWidget {
  @override
  _PuzzleGameState createState() => _PuzzleGameState();
}

class _PuzzleGameState extends State<PuzzleGame> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puzzle Game'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.dictionary.com/games/word-puzzle',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (_) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading) Center(child: CircularProgressIndicator()),
        ],
      ),
      // Optional: Add a floating action button to reload the page
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
